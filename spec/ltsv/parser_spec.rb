# frozen_string_literal: true

require 'ltsv/parser'

describe Ltsv::Parser do
  let(:parser) { Ltsv::Parser.new(filename: 'file.ltsv') }

  describe '.new' do
    it 'returns Ltsv::Parser instance' do
      expect(parser).to be_instance_of Ltsv::Parser
    end
  end

  describe '#parse' do
    it do
      parser = Ltsv::Parser.new(filename: File.expand_path('../fixtures/files/1.ltsv', File.dirname(__FILE__)))
      parser.parse
    end
  end
end
