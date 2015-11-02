require 'spec_helper'
require './lib/http_server'
require './lib/http_request'
require './lib/http_response'
require './lib/file_handler'

require 'stringio'

describe HttpServer do
  let(:http_server) { HttpServer.new }

  describe '#request' do
    let(:uri) { '/testfile.ext' }
    let(:verb) { 'GET' }
    let(:request_string) {
      "#{verb} #{uri} HTTP/1.0\r\n" +
      "Host: 127.0.0.1\r\n" +
      "\r\n"
    }
    let(:response_string) {
      'really does not matter what this is at this stage as we are mocking it'
    }
    let(:fake_file) {
      'also just gets passed straight through, samuel l ipsum'
    }
    let(:input_stream) { StringIO.new(request_string) }
    let(:output_stream) { StringIO.new }
    let(:mock_file_handler) { instance_double("FileHandler") }
    let(:mock_http_request) { instance_double("HttpRequest") }
    let(:mock_http_response) { instance_double("HttpResponse") }

    it 'serves an HTTP request' do
      expect(HttpRequest).to receive(:from_string).with(request_string).and_return(mock_http_request)
      allow(mock_http_request).to receive(:uri).and_return(uri)
      allow(mock_http_request).to receive(:verb).and_return(verb)
      expect(mock_file_handler).to receive(:read_file).with(uri).and_return(fake_file)
      expect(HttpResponse).to receive(:new).with(fake_file, verb).and_return(mock_http_response)
      allow(mock_http_response).to receive(:to_string).and_return(response_string)
      
      http_server.request(input_stream, output_stream, mock_file_handler)

      expect(output_stream.string).to eq(response_string)
    end

    it 'throws 404 when page is missing' do
      expect(HttpRequest).to receive(:from_string).with(request_string).and_return(mock_http_request)
      allow(mock_http_request).to receive(:uri).and_return(uri)
      expect(mock_file_handler).to receive(:read_file).with(uri).and_raise(FileNotFoundException)
      expect(Http404Response).to receive(:new).and_return(mock_http_response)
      allow(mock_http_response).to receive(:to_string).and_return(response_string)
      
      http_server.request(input_stream, output_stream, mock_file_handler)

      expect(output_stream.string).to eq(response_string)
    end
  end
end
