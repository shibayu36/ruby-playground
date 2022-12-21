module Ltsv
  class Parser
    def initialize(filename:)
      @filename = filename
    end

    def parse
      File.foreach(@filename) do |line|
        p(line)
      end
    end
  end
end
