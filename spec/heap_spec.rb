require 'heap'

describe Heap do
  describe '#push' do
    it do
      heap = Heap.new([4, 1, 3])
      expect(heap.nodes).to eq([1, 4, 3])

      heap.push(5)
      expect(heap.nodes).to eq([1, 4, 3, 5])

      heap.push(0)
      expect(heap.nodes).to eq([0, 1, 3, 5, 4])
    end
  end
end
