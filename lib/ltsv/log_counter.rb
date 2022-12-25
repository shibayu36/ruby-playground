# frozen_string_literal: true

module Ltsv
  class LogCounter
    def initialize(logs)
      @logs = logs
    end

    def count_error
      @logs.count { |log| log.status.to_i >= 500 }
    end
  end
end
