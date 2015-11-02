require 'spec_helper'
require './lib/file_handler'

describe FileHandler do
  let(:directory) { '/it/really/does/not/matter' }
  let(:file_handler) { FileHandler.new(directory) }
  let(:uri) { '/file/name' }
  let(:fake_file_string) { "more data\nlovely data\nyay\n" }

  describe '#read_file' do
    context 'file exists' do
      it 'gets a file from a uri' do
        expect(File).to receive(:read).with(directory+uri).and_return(fake_file_string)
        expect(File).to receive(:exists?).with(directory+uri).and_return(true)
        
        expect(file_handler.read_file(uri)).to eq(fake_file_string)
      end
    end
    context 'file does not exist' do
      it 'raises an exception' do
        expect(File).to receive(:exists?).with(directory+uri).and_return(false)
        
        expect { file_handler.read_file(uri) }.to raise_error(FileNotFoundException)
      end
    end
  end
end
