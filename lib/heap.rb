require 'debug'

class Heap
  attr_reader :nodes

  def initialize(arr)
    @nodes = []
    arr.each { |val| push(val) }
  end

  def size
    @nodes.size
  end

  def push(val)
    @nodes.push(val)

    return if size <= 1

    current_index = size - 1
    parent_index = parent_of(size - 1)

    while @nodes[parent_index] > @nodes[current_index]
      swap(parent_index, current_index)
      current_index = parent_index
      parent_index = parent_of(current_index)
      break if current_index == 0
    end
  end

  def pop; end

  private

  def parent_of(index)
    (index - 1) / 2
  end

  def swap(i, j)
    @nodes[i], @nodes[j] = @nodes[j], @nodes[i]
  end
end
