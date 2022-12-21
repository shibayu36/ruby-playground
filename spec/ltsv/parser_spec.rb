# frozen_string_literal: true

require 'ltsv/log'
require 'ltsv/parser'

describe Ltsv::Parser do
  let(:parser) { Ltsv::Parser.new(filename: 'file.ltsv') }

  describe '.new' do
    it 'returns Ltsv::Parser instance' do
      expect(parser).to be_instance_of Ltsv::Parser
    end
  end

  describe '#parse' do
    it 'returns parsed array' do
      parser = Ltsv::Parser.new(filename: File.expand_path('../fixtures/files/1.ltsv', __dir__))
      result = parser.parse

      expect(result[0].host).to eq '127.0.0.1'
      expect(result[0].user).to eq 'frank'
      expect(result[0].epoch).to eq 1_372_694_390
      expect(result[0].req).to eq 'GET /apache_pb.gif HTTP/1.0'
      expect(result[0].status).to eq 200
      expect(result[0].size).to eq 2326
      expect(result[0].referer).to eq 'http://www.hatena.ne.jp/'

      expect(result[1].host).to eq '127.0.0.1'
      expect(result[1].user).to eq 'john'
      expect(result[1].epoch).to eq 1_372_794_390
      expect(result[1].req).to eq 'GET /apache_pb.gif HTTP/1.0'
      expect(result[1].status).to eq 200
      expect(result[1].size).to eq 1234
      expect(result[1].referer).to eq 'http://b.hatena.ne.jp/hotentry'

      expect(result[2].host).to eq '127.0.0.1'
      expect(result[2].user).to eq nil
      expect(result[2].epoch).to eq 1_372_894_390
      expect(result[2].req).to eq 'GET /apache_pb.gif HTTP/1.0'
      expect(result[2].status).to eq 302
      expect(result[2].size).to eq 9999
      expect(result[2].referer).to eq 'http://www.example.com/start.html'
    end
  end
end
