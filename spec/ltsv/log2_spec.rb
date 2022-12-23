# frozen_string_literal: true

require 'ltsv/log2'

describe Ltsv::Log2 do
  let(:req) { 'GET /apache_pb.gif HTTP/1.0' }
  let(:host) { '127.0.0.1' }
  let(:epoch) { '1372694390' }
  let(:log) do
    Ltsv::Log2.new(
      host: host,
      user: 'frank',
      epoch: epoch,
      req: req,
      status: '200',
      size: '2326',
      referer: 'http://www.hatena.ne.jp/'
    )
  end

  describe '.new' do
    it 'makes accessors by field keys' do
      expect(log.host).to eq host
      expect(log.user).to eq 'frank'
      expect(log.epoch).to eq epoch
      expect(log.req).to eq req
      expect(log.status).to eq '200'
      expect(log.size).to eq '2326'
      expect(log.referer).to eq 'http://www.hatena.ne.jp/'
    end
  end

  describe '#method' do
    context 'when req is defined' do
      it 'returns method name in req' do
        expect(log.method).to eq 'GET'
      end
    end

    context 'when req is undefined' do
      let(:req) { nil }
      it 'returns nil' do
        expect(log.method).to eq nil
      end
    end
  end

  describe '#path' do
    context 'when req is defined' do
      it 'returns path in req' do
        expect(log.path).to eq '/apache_pb.gif'
      end
    end

    context 'when req is undefined' do
      let(:req) { nil }
      it 'returns nil' do
        expect(log.path).to eq nil
      end
    end
  end

  describe '#protocol' do
    context 'when req is defined' do
      it 'returns protocol in req' do
        expect(log.protocol).to eq 'HTTP/1.0'
      end
    end

    context 'when req is undefined' do
      let(:req) { nil }
      it 'returns nil' do
        expect(log.protocol).to eq nil
      end
    end
  end

  describe '#uri' do
    context 'when host is undefined' do
      let(:host) { nil }
      it 'returns nil' do
        expect(log.uri).to eq nil
      end
    end

    context 'when req is undefined' do
      let(:req) { nil }

      it 'returns uri without path' do
        expect(log.uri).to eq 'http://127.0.0.1'
      end
    end

    context 'when both host and path are defined' do
      it 'returns uri' do
        expect(log.uri).to eq 'http://127.0.0.1/apache_pb.gif'
      end
    end
  end

  describe '#time' do
    context 'when epoch is undefined' do
      let(:epoch) { nil }
      it 'returns nil' do
        expect(log.time).to eq nil
      end
    end

    context 'when epoch is defined' do
      it 'returns formatted time' do
        expect(log.time).to eq '2013-07-01T15:59:50'
      end
    end
  end
end
