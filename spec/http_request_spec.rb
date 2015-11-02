require 'spec_helper'
require './lib/http_request'

describe HttpRequest do
  describe '.from_string' do
    let(:uri) { '/testfile.ext' }
    let(:action) { 'GET' }
    let(:request_string) {
      "#{action} #{uri} HTTP/1.0\r\n" +
      "Host: 127.0.0.1\r\n" +
      "\r\n"
    }

    subject(:http_request) { HttpRequest.from_string(request_string) }

    it 'parses the verb' do
      expect(http_request.verb).to eq('GET')
    end

    it 'parses the request URI' do
      expect(http_request.uri).to eq(uri)
    end
  end
end
