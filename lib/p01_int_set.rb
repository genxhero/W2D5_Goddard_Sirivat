class MaxIntSet
  def initialize(max = 5)
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length].push(num)
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == @store.size
      resize!
    end
    unless @store[num % @store.length].include?(num)
      @store[num % @store.length].push(num)
      @count += 1
    end
  end

  def remove(num)
      if @store[num % @store.length].include?(num)
        @store[num % @store.length].delete(num) 
        @count -= 1
      end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) {Array.new}
    @store.each do |arr|
      next if arr == []
      @store[arr.first % @store.length] = arr
    end
  end
end
