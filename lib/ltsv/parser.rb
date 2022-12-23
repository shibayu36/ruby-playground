# frozen_string_literal: true

require 'ltsv/log'

module Ltsv
  class Parser
    def initialize(filename:)
      @filename = filename
    end

    def parse
      File.foreach(@filename).map do |line|
        fields = line.chomp.split("\t").map do |field|
          key_val = field.split(':', 2)
          [key_val[0].to_sym, key_val[1] == '-' ? nil : key_val[1]]
        end
        Ltsv::Log.new(**fields.to_h)
      end
    end
  end
end
