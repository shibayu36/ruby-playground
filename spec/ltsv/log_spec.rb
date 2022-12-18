# frozen_string_literal: true

require 'ltsv/log'

describe Log do
  let(:log) do
    Log.new(
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
end
