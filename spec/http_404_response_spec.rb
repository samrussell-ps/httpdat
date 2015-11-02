require 'spec_helper'
require './lib/http_404_response'

describe Http404Response do
  let(:expected_response) { "HTTP/1.0 404 Not Found\r\n\r\n" }
  let(:http_404_response) { Http404Response.new }

  describe '#to_string' do
    subject { http_404_response.to_string }
    it { is_expected.to eq(expected_response) }
  end
end
