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

  describe '#group_by_user' do
    it 'returns hash grouping logs by user' do
      Tempfile.create('ltsv') do |f|
        f.puts <<~EOS
          user:john\tnumber:1
          user:frank\tnumber:2
          user:-\tnumber:3
          user:john\tnumber:4
          user:-\tnumber:5
        EOS
        f.flush
        counter = Ltsv::LogCounter.new(Ltsv::Parser.new(filename: f.path).parse)

        res = counter.group_by_user
        expect(res['john'].map(&:number)).to eq %w[1 4]
        expect(res['frank'].map(&:number)).to eq %w[2]
        expect(res['guest'].map(&:number)).to eq %w[3 5]
      end
    end
  end
end
