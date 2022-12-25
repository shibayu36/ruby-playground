# frozen_string_literal: true

require 'tempfile'
require 'ltsv/parser'
require 'ltsv/log_counter'

describe Ltsv::LogCounter do
  let(:ltsv) { '' }

  def with_tempfile
    Tempfile.create('ltsv') do |f|
      f.puts(ltsv)
      f.flush
      yield f.path
    end
  end

  describe '#count_error' do
    let(:ltsv) do
      <<~EOS
        host:127.0.0.1\tstatus:200
        host:127.0.0.1\tstatus:401
        host:127.0.0.1\tstatus:500
        host:127.0.0.1\tstatus:302
        host:127.0.0.1\tstatus:503
      EOS
    end

    it 'returns the number of logs with status greater than 500' do
      with_tempfile do |path|
        counter = Ltsv::LogCounter.new(Ltsv::Parser.new(filename: path).parse)
        expect(counter.count_error).to eq 2
      end
    end
  end

  describe '#group_by_user' do
    let(:ltsv) do
      <<~EOS
        user:john\tnumber:1
        user:frank\tnumber:2
        user:-\tnumber:3
        user:john\tnumber:4
        user:-\tnumber:5
      EOS
    end

    it 'returns hash grouping logs by user' do
      with_tempfile do |path|
        counter = Ltsv::LogCounter.new(Ltsv::Parser.new(filename: path).parse)

        res = counter.group_by_user
        expect(res['john'].map(&:number)).to eq %w[1 4]
        expect(res['frank'].map(&:number)).to eq %w[2]
        expect(res['guest'].map(&:number)).to eq %w[3 5]
      end
    end
  end
end
