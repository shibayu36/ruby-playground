require 'active_support'

module Software1
  extend ActiveSupport::Concern

  VAR = 'hejsan'

  def exit
    @text = "exited"
    puts @text
  end
end

class Windows1
  extend Software1
  def self.start
    exit
    puts VAR
    puts @text
  end
end

# Windows1.start

module Software2
  extend ActiveSupport::Concern
  included do
    VAR = 'hejisan'
  end

  def exit
    @text = "exited"
    puts @text
  end
end

class Windows2
  extend Software2

  def self.start
    exit
    puts VAR
    puts @text
  end
end

Windows2.start
