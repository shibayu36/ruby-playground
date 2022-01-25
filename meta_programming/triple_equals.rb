str = String.new
case str
when String     # String === str を評価する
  p true        # => true
end

class Class1
end

class Class2 < Class1
end

c1 = Class1.new
c2 = Class2.new

case c1
when Class2
  p 'class2'
when Class1
  p 'class1'
end

case c2
when Class1
  p 'class1'
end
