module Module1
end

module Module2
  include Module1
end

module Module3
end

class Class1
end

class Class2 < Class1
  include Module2
  include Module3
end

p('start')
a = Class2.new
def a.name
  p('a.name')
end
p(a.singleton_class)
p(a.singleton_class.method(:name).inspect)
p(a.class.ancestors)
