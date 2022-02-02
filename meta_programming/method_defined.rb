# method_defined?(name, inherit=true) -> bool
# モジュールにインスタンスメソッド name が定義されており、かつその可視性が public または protected であるときに true を返します。
# [PARAM] name:
# Symbol か String を指定します。
# [PARAM] inherit:
# 真を指定するとスーパークラスや include したモジュールで定義されたメソッドも対象になります。

module A
  def method1()  end

  def protected_method1() end
  protected :protected_method1
end

class B
  def method2()  end

  def private_method2() end
  private :private_method2
end

class C < B
  include A
  def method3() end
end

p A.method_defined? :method1              #=> true
p C.method_defined? 'method1'             #=> true
p C.method_defined? 'method2'             #=> true
p C.method_defined? 'method2', true       #=> true
p C.method_defined? 'method2', false      #=> false
p C.method_defined? 'method3'             #=> true
p C.method_defined? 'protected_method1'   #=> true
p C.method_defined? 'method4'             #=> false
p C.method_defined? 'private_method2'     #=> false
