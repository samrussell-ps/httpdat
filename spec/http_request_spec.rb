require 'spec_helper'
require './lib/http_request'

describe HttpRequest do
  describe '.from_string' do
    let(:serialised_request) {
      "GET /testfile HTTP/1.0\r\n" +
      "Host: 127.0.0.1\r\n" +
      "\r\n"
    }

    subject(:http_request) { HttpRequest.from_string(serialised_request) }

    xit 'parses the method' do
      expect(http_request.method).to eq('GET')
    end

    xit 'parses the request URI' do
      expect(http_request.request_uri).to eq('testfile')
    end
  end
end
