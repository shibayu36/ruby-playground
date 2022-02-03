# undef_method(*name) -> self
# このモジュールのインスタンスメソッド name を未定義にします。
# [PARAM] name:
# 0 個以上の String か Symbol を指定します。
# [EXCEPTION] NameError:
# 指定したインスタンスメソッドが定義されていない場合に発生します。
# 「未定義にする」とは
# このモジュールのインスタンスに対して name というメソッドを呼び出すことを禁止するということです。スーパークラスの定義が継承されるかどうかという点において、「未定義」は「メソッドの削除」とは区別されます。以下のコード例を参照してください。

class A
  def ok
    puts 'A'
  end
end

class B < A
  def ok
    puts 'B'
  end
end

B.new.ok # => B

# undef_method の場合はスーパークラスに同名のメソッドがあっても
# その呼び出しはエラーになる
# class B
#   undef_method :ok
# end
# B.new.ok # => NameError

# remove_method の場合はスーパークラスに同名のメソッドがあると
# それが呼ばれる
class B
  remove_method :ok
end
B.new.ok   # => A
