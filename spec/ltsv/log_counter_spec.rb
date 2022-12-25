# frozen_string_literal: true

require 'tempfile'
require 'ltsv/parser'
require 'ltsv/log_counter'

describe Ltsv::LogCounter do
  describe '#count_error' do
    it 'returns the number of logs with status greater than 500' do
      Tempfile.create('ltsv') do |f|
        f.puts <<~EOS
          host:127.0.0.1\tstatus:200
          host:127.0.0.1\tstatus:401
          host:127.0.0.1\tstatus:500
          host:127.0.0.1\tstatus:302
          host:127.0.0.1\tstatus:503
        EOS
        f.flush
        counter = Ltsv::LogCounter.new(Ltsv::Parser.new(filename: f.path).parse)
        expect(counter.count_error).to eq 2
      end
    end
  end
end
