module Foo1
end

module Foo2
end

class Bar
  def self.include_foo
    include Foo1
  end

  def instance_include_foo
    Bar.include Foo2
  end
end

p Bar.ancestors
Bar.include_foo
p Bar.ancestors
Bar.new.instance_include_foo
p Bar.ancestors
