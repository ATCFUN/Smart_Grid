require('uci')

values = uci.get_all('vsftpd.@vsftpd[0]') or {}

conf = {}
lines = (io.readfile('/tmp/vsftpd.conf') or ''):trim():split('\n')
for _, line in ipairs(lines) do
  line = line:trim()

  if not line:find('listen_port')
    and not line:find('pasv_address')
    and not line:find('pasv_min_port')
    and not line:find('pasv_max_port')
    and not line:find('force_local_data_ssl')
    and not line:find('force_local_logins_ssl')
    and #line > 0
  then
    conf[ #conf + 1 ] = line
  end
end

pasv_address = values.pasv_address or ''
if #pasv_address > 0 then
  conf[ #conf + 1 ] = 'pasv_address=' .. pasv_address
end

port = tonumber(values.port)
if port then
  conf[ #conf + 1 ] = 'listen_port=' .. port
end

port = tonumber(values.pasv_min_port)
if port then
  conf[ #conf + 1 ] = 'pasv_min_port=' .. port
end

port = tonumber(values.pasv_max_port)
if port then
  conf[ #conf + 1 ] = 'pasv_max_port=' .. port
end

force_ssl = tonumber(values.force_ssl)
if type(force_ssl) == 'number' and force_ssl == 0 then
  force_ssl = 'NO'
else
  force_ssl = 'YES'
end

conf[ #conf + 1 ] = 'force_local_data_ssl=' .. force_ssl
conf[ #conf + 1 ] = 'force_local_logins_ssl=' .. force_ssl

io.writefile('/tmp/vsftpd.conf', table.concat(conf, '\n') .. '\n')
