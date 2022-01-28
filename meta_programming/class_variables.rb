class One
  @@var1 = 1
end

class Two < One
  @@var2 = 2
end
p One.class_variables          # => [:@@var1]
p Two.class_variables          # => [:@@var2, :@@var1]
p Two.class_variables(false)   # => [:@@var2]
