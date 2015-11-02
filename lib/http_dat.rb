require 'socket'
require './lib/file_handler'
require './lib/http_server'

class HttpDat
  def initialize(port, directory)
    @port = port
    @directory = directory
  end

  def start_server
    @server = TCPServer.new @port
  end

  def run
    socket = @server.accept
    file_handler = FileHandler.new(@directory)
    HttpServer.new.request(socket, socket, file_handler)
    socket.close
  end
end
