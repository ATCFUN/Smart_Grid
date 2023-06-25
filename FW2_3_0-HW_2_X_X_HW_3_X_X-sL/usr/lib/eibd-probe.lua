require('uci')

function find(where, what)
  return where:find(what, 1, true)
end

function probe()
  local dev, port, res, len, b1, b2, cpuinfo, model
  cpuinfo = io.readfile('/proc/cpuinfo')

  -- intel nuc
  if find(cpuinfo, 'Intel') then
    return 'ip', ''
  -- imx
  elseif find(cpuinfo, 'MX') then
    if find(cpuinfo, 'i.MX6') then
      model = io.readfile('/proc/device-tree/model')

      if not find(model, 'LM5GM') then
        dev = '/dev/ttymxc5'
      end
    else
      dev = '/dev/ttyAPP4'
    end

    if dev and io.exists(dev) then
      return 'tpuarts', dev
    else
      return 'ip', ''
    end
  -- ramips
  elseif find(cpuinfo, 'MT7688') then
    if find(cpuinfo, 'LMWA') then
      return 'tpuarts', '/dev/ttyS0'
    else
      return 'ip', ''
    end
  end

  -- at91 lm2
  port = require('serial').open('/dev/ttyS5', { baudrate = 19200, parity = 'even' })

  -- port ok
  if port then
    port:flush()

    -- send reset (tp-uart only)
    port:write(string.char(0x01))
    res, len = port:read(2, 0.1)

    -- 2 bytes: 0x00, 0x03
    if len == 2 then
      b1, b2 = res:byte(1, 2)

      -- tp-uart
      if b1 == 0 and b2 == 3 then
        return 'tpuarts', '/dev/ttyS5'
      end
    end
  end

  return 'ft12', '/dev/ttyS1'
end

-- local mode - decide either tp-uart of ft1.2
function setlocal(id)
  local cmode, cpath = probe()
  uci.set('eibd', id, 'cmode', cmode)
  uci.set('eibd', id, 'cpath', cpath)
  uci.commit('eibd')
end

-- fix incorrect settings
function checkip(id, cmode, cpath)
  -- fix /dev/ entries in ip-based connections
  if cpath:match('/dev/') then
    cpath = ''
    uci.set('eibd', id, 'cpath', cpath)
    uci.commit('eibd')
  end

  -- tunneling will not work without ip
  if cpath == '' and (cmode == 'ipt' or cmode == 'iptn') then
    uci.set('eibd', id, 'cmode', 'ip')
    uci.commit('eibd')
  end
end

function check(id, params)
  local cmode, cpath = params.cmode or '', params.cpath or ''

  if cmode == 'local' then
    setlocal(id)
  elseif cmode ~= 'tpuarts' and cmode ~= 'ft12' then
    checkip(id, cmode, cpath)
  end
end

local cfg = uci.get_all('eibd') or {}
for id, params in pairs(cfg) do
  check(id, params)
end
