# frozen_string_literal: true

require 'ltsv/log'

module Ltsv
  class Parser
    def initialize(filename:)
      @filename = filename
    end

    def parse
      File.foreach(@filename).map do |line|
        fields = {}
        line.chomp.split("\t").each do |field|
          key_val = field.split(':', 2)
          fields[key_val[0].to_sym] = key_val[1] == '-' ? nil : key_val[1]
        end
        Ltsv::Log.new(**fields)
      end
    end
  end
end
