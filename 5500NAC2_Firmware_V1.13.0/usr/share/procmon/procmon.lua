if os.checkproc('procmon') then
  return
end

os.writepid('procmon')

local basedir = '/etc/procmon'

local function check(file)
  local data, cfg, custom, pid

  data = io.readfile(basedir .. '/' .. file)
  cfg = loadstring('return ' .. data)()

  if type(cfg) ~= 'table' then
    return
  end

  custom = cfg.custom
  if type(custom) == 'function' then
    custom()
    return
  end

  -- read process pid location
  pid = io.readfile(cfg.pid)
  pid = tonumber(pid)

  -- pid ok, read status
  if pid then
    data = io.readfile('/proc/' .. pid .. '/status') or ''

    -- status ok, check if custom callback should be run
    if data:match('State:%s+[DRS]') then
      print('PID ok', file)
      return
    end
  end

  print('FAIL', file)
  os.execute(cfg.cmd)
end

-- system overload check
local loadavg = io.readfile('/proc/loadavg'):split(' ')[ 1 ]
print('Load', loadavg)
if tonumber(loadavg) >= 18 then
  os.execute('reboot')
  return
end

-- process check
local files = io.ls(basedir) or {}
for _, file in ipairs(files) do
  pcall(check, file)
end
