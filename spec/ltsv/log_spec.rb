# frozen_string_literal: true

require 'ltsv/log'

describe Ltsv::Log do
  let(:log) do
    Ltsv::Log.new(
      host: '127.0.0.1',
      user: 'frank',
      epoch: '1372694390',
      req: 'GET /apache_pb.gif HTTP/1.0',
      status: '200',
      size: '2326',
      referer: 'http://www.hatena.ne.jp/'
    )
  end

  describe '#method' do
    it 'returns method name in req' do
      expect(log.method).to eq 'GET'
    end
  end

  describe '#path' do
    it 'returns path in req' do
      expect(log.path).to eq '/apache_pb.gif'
    end
  end

  describe '#protocol' do
    it 'returns protocol in req' do
      expect(log.protocol).to eq 'HTTP/1.0'
    end
  end

  describe '#uri' do
    it 'returns uri' do
      expect(log.uri).to eq 'http://127.0.0.1/apache_pb.gif'
    end
  end

  describe '#time' do
    it 'returns formatted time' do
      expect(log.time).to eq '2013-07-01T15:59:50'
    end
  end
end
