module Foo
end

class Bar
  include Foo
end

class Baz < Bar
  p ancestors
  p included_modules
  p superclass
end
# => [Baz, Bar, Foo, Object, Kernel, BasicObject]
# => [Foo, Kernel]
# => Bar

p Object.ancestors
p Object.included_modules
p Object.superclass
