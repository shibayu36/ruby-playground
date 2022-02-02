class Foo
  private

  def private_foo() end

  protected

  def protected_foo() end

  public

  def public_foo() end
end

# あるクラスのインスタンスメソッドの一覧を得る
p Foo.instance_methods(false)
p Foo.public_instance_methods(false)
p Foo.private_instance_methods(false)
p Foo.protected_instance_methods(false)

class Bar < Foo
  private

  def private_bar() end

  protected

  def protected_bar() end

  public

  def public_bar() end
end

# あるクラスのインスタンスメソッドの一覧を得る。
# 親のクラスのインスタンスメソッドも含めるため true を指定して
# いるが、Object のインスタンスメソッドは一覧から排除している。
p Bar.instance_methods(true)           - Object.instance_methods(true)
p Bar.public_instance_methods(true)    - Object.public_instance_methods(true)
p Bar.private_instance_methods(true)   - Object.private_instance_methods(true)
p Bar.protected_instance_methods(true) - Object.protected_instance_methods(true)
