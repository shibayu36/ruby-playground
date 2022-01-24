mod = Module.new do |_m|
  def hoge
    p 'hoge'
  end
  module_function :hoge
end

p mod
p mod.name
mod.hoge

Foo = mod
# ここで m.name を呼べば m の名前は "Foo" に確定するとドキュメントには書いているが、そうならない
# p mod.name
Bar = mod
p mod.name
