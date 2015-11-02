require 'spec_helper'
require './lib/http_response'

describe HttpResponse do
  let(:file_data) { "fake file data\ndo not care\n" }
  let(:expected_response) { "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\n\r\n" + file_data }
  let(:http_response) { HttpResponse.new(file_data) }

  describe '#to_string' do
    subject { http_response.to_string }
    it { is_expected.to eq(expected_response) }
  end
end
