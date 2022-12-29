def find_uncoupled_integer(arr)
  res = 0
  arr.each do |i|
    res = res ^ i
  end
  res
end

inputs = $stdin.gets.split(', ').map(&:to_i)
puts(find_uncoupled_integer(inputs))
