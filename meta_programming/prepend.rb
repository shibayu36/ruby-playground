# prepend(*modules) -> self
# 指定したモジュールを self の継承チェインの先頭に「追加する」ことで self の定数、メソッド、モジュール変数を「上書き」します。
# 継承チェイン上で、self のモジュール/クラスよりも「手前」に追加されるため、結果として self で定義されたメソッドは override されます。
# modules で指定したモジュールは後ろから順に処理されるため、 modules の先頭が最も優先されます。
# また、継承によってこの「上書き」を処理するため、prependの引数として渡したモジュールのインスタンスメソッドでsuperを呼ぶことで self のモジュール/クラスのメソッドを呼び出すことができます。
# 実際の処理は modules の各要素の prepend_features を後ろから順に呼びだすだけです。 Module#prepend_features が継承チェインの改変を実行し、結果として上のような処理が実現されます。そのため、prepend_features を override することで prepend の処理を追加/変更できます。
# [PARAM] modules:
# prepend する Module を指定します
# [SEE_ALSO] Module#prepend_features, Module#prepended

# super と prepend の組み合わせの例
module X
  def foo
    puts 'X1' # (1x)
    super # (2x)
    puts 'X2' # (3x)
  end
end

class A
  prepend X

  def foo
    puts 'A' # (1a)
  end
end

A.new.foo
# (1x) (2x)(ここの super で A#foo を呼びだす) (1a) (3x) の順に実行される
# >> X1
# >> A
# >> X2
p A.ancestors

# 2つのモジュールを X, Y を prepend X, Y という順で指定したもの
module Y
  def foo
    puts 'Y1' # (1y)
    super # (2y)
    puts 'Y2' # (3y)
  end
end

class B
  prepend Y
  prepend X
  def foo
    puts 'B' # (1b)
  end
end

B.new.foo
# (1x) (2x) (1y) (2y) (1b) (3y) (3x) の順に実行される
# X#foo のほうが Y#foo より継承チェインの手前側にあり、そちらが優先される
# >> X1
# >> Y1
# >> B
# >> Y2
# >> X2
# prepend Y, X とすると Y1 X1 B X2 Y2 の順で表示される
p B.ancestors
