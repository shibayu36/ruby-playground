# frozen_string_literal: true

module Ltsv
  class LogCounter
    def initialize(logs)
      @logs = logs
    end

    def count_error
      @logs.count { |log| log.status.to_i >= 500 }
    end

    def group_by_user
      res = {}
      @logs.each do |log|
        user = log.user || 'guest'
        res[user] ||= []
        res[user].push(log)
      end
      res
    end
  end
end
