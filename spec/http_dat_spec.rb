require 'spec_helper'
require './lib/http_dat'

describe HttpDat do
  let(:port) { 1234 }
  let(:directory) { '/a/b/c/d' }
  let(:http_dat) { HttpDat.new(port, directory) }
  let(:mock_tcp_server) { instance_double("TCPServer") }
  let(:mock_tcp_socket) { instance_double("TCPSocket") }

  describe '#start_server' do
    it 'starts a server' do
      expect(TCPServer).to receive(:new).with(port).and_return(mock_tcp_server)

      http_dat.start_server
    end
  end

  describe '#run' do
    let(:mock_file_handler) { instance_double("FileHandler") }
    let(:mock_http_server) { instance_double("HttpServer") }

    it 'answers connections' do
      expect(TCPServer).to receive(:new).with(port).and_return(mock_tcp_server)
      expect(mock_tcp_server).to receive(:accept).and_return(mock_tcp_socket)
      expect(FileHandler).to receive(:new).with(directory).and_return(mock_file_handler)
      expect(HttpServer).to receive(:new).and_return(mock_http_server)
      expect(mock_http_server).to receive(:request).with(mock_tcp_socket, mock_tcp_socket, mock_file_handler)

      http_dat.start_server
      http_dat.run
    end
  end
end
