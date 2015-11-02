require 'spec_helper'
require './lib/http_response'

describe HttpResponse do
  let(:file_data) { "fake file data\ndo not care\n" }
  let(:expected_get_response) { "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\nContent-Length: #{file_data.length}\r\n\r\n" + file_data }
  let(:expected_head_response) { "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\nContent-Length: #{file_data.length}\r\n\r\n" }
  let(:verb) { '' }
  let(:http_response) { HttpResponse.new(file_data, verb) }

  describe '#to_string' do
    context 'HEAD' do
      let(:verb) { 'HEAD' }
      subject { http_response.to_string }
      it { is_expected.to eq(expected_head_response) }
    end

    context 'GET' do
      let(:verb) { 'GET' }
      subject { http_response.to_string }
      it { is_expected.to eq(expected_get_response) }
    end
  end
end
