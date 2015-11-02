require './lib/http_dat'

http_dat = HttpDat.new(8081, '.')

http_dat.start_server

while true
  http_dat.run
end
