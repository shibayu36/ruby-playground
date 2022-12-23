module Ltsv
  class Log2
    def initialize(**fields)
      fields.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:attr_reader, key)
      end
    end

    def method
      @req ? @req.split(' ')[0] : nil
    end

    def path
      @req ? @req.split(' ')[1] : nil
    end

    def protocol
      @req ? @req.split(' ')[2] : nil
    end

    def uri
      return unless @host

      "http://#{@host}#{path}"
    end

    def time
      return unless @epoch

      Time.at(@epoch.to_i).utc.strftime('%Y-%m-%dT%H:%M:%S')
    end
  end
end
