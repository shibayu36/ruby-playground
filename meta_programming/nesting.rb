# 名前空間の解決の理解に役立つ

module Foo
  module Bar
    module Baz
      p Module.nesting
    end
  end
end

module Foo::Bar::Piyo
  p Module.nesting
end
