local function usage()
  io.stderr:write('luajit [-g] input output')
  os.exit(1)
end

local function check(ok, ...)
  if ok then
    return ok, ...
  end
  io.stderr:write('luajit: ', ...)
  io.stderr:write('\n')
  os.exit(1)
end

local function docmd(...)
  local arg = {...}
  local n = 1
  local strip = true

  while n <= #arg do
    local a = arg[n]

    if type(a) == 'string' and string.sub(a, 1, 1) == '-' and a ~= '-' then
      table.remove(arg, n)

      if a == '-g' then
        strip = false
      else
        usage()
      end
    else
      n = n + 1
    end
  end

  -- not input/output or invalid params
  if #arg ~= 2 then
    usage()
  end

  local input, output = arg[1], arg[2]

  -- read lua input and compile
  local f = check(loadfile(input))
  local s = string.dump(f, strip)

  -- write compiled chunk
  local fp = check(io.open(output, 'w'))
  local ok, err = fp:write(s)
  if ok and output ~= '-' then
    ok, err = fp:close()
  end

  check(ok, 'cannot write ', output, ': ', err)
end

module(...)
start = docmd
