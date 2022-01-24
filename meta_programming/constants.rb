class C
  FOO = 1
  p "#{Module.constants} in C"
end

p "#{Module.constants} in main"
C.new
