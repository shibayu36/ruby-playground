# private_class_method(*name) -> self
# private_class_method(names) -> self
# name で指定したクラスメソッド (クラスの特異メソッド) の可視性を private に変更します。
# [PARAM] name:
# 0 個以上の String または Symbol を指定します。
# [PARAM] names:
# 0 個以上の String または Symbol を Array で指定します。

module Foo
  def self.foo; end
end

p Foo.singleton_class.private_method_defined?(:foo) # => false
p Foo.private_class_method(:foo) # => Foo
p Foo.singleton_class.private_method_defined?(:foo) # => true
