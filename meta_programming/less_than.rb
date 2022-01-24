module Foo
end

class Bar
  include Foo
end

class Baz < Bar
end

class Qux
end
p Bar < Foo     # => true
p Baz < Bar     # => true
p Baz < Foo     # => true
p Baz < Qux     # => nil
p Baz > Qux     # => nil

p Foo < Object.new # => in `<': compared with non class/module (TypeError)
