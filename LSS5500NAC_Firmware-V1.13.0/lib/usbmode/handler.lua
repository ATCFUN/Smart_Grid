local config, dev, item

function getmsgcount()
  local count = 0
  if item and type(item.msg) == 'table' then
    count = #item.msg
  end

  return count
end

function getmsg(nr)
  local id, msg
  if item and item.msg then
    id = item.msg[ nr + 1 ]

    if id then
      msg = config.messages[ id + 1 ]
    end
  end

  return lmcore.hextostr(msg or '', true)
end

function getint(key)
  return item and tonumber(item[ key ]) or nil
end

function getstr(key)
  return item and item[ key ] or nil
end

function checkdev(idstr)
  if not config then
    config = dofile('/lib/usbmode/data.lua')
  end

  dev = config.devices[ idstr ]
  if dev then
    return true
  end
end

function finddev(mfg, prod, serial)
  local chunks, mode, str, cmp
  if not dev then
    return
  end

  item = dev['*']
  if item then
    return true
  end

  for key, val in pairs(dev) do
    chunks = key:split('=')

    if #chunks == 2 then
      mode, str = unpack(chunks)

      if mode:find('uMa', 1, true) then
        cmp = mfg
      elseif mode:find('uPr', 1, true) then
        cmp = prod
      elseif mode:find('uSe', 1, true) then
        cmp = serial
      else
        cmp = nil
      end

      if cmp and cmp == str then
        item = val
        break
      end
    end
  end

  if item then
    return true
  end
end
