class A         # line 1
  C1 = 1
  C2 = 2
end

module M        # line 6
  C3 = 3
end

class B < A     # line 10
  include M
  C4 = 4
end

class A # 継続して A を定義する
  C2 = 8 # 定数を再定義する
end

p B.const_source_location('C4')           # => ["test.rb", 12]
p B.const_source_location('C3')           # => ["test.rb", 7]
p B.const_source_location('C1')           # => ["test.rb", 2]

p B.const_source_location('C3', false)    # => nil  -- include したモジュールは検索しない

p A.const_source_location('C2')           # => ["test.rb", 16] -- 最後に定義された位置を返す

p Object.const_source_location('B')       # => ["test.rb", 10] -- Object はトップレベルの定数を検索する
p Object.const_source_location('A')       # => ["test.rb", 1] -- クラスが再定義された場合は最初の定義位置を返す

p B.const_source_location('A')            # => ["test.rb", 1]  -- Object を継承している為
p M.const_source_location('A')            # => ["test.rb", 1]  -- Object は継承していないが追加で modules をチェックする

p Object.const_source_location('A::C1')   # => ["test.rb", 2]  -- ネストの指定もサポートしている
p Object.const_source_location('String')  # => []  -- 定数は C のコードで定義されている
