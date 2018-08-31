require_relative 'p04_linked_list'

class HashMap
  
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    
    if self.include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      resize! if @count == num_buckets
      @store[key.hash % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
      if self.include?(key)
        @store[key.hash % num_buckets].remove(key)
        @count -= 1
      end
       
  end

  def each
    @store.each do |ll|
      ll.each do |node|
        yield([node.key, node.val])
      end
    end
  end

  #uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { LinkedList.new }
    @store.each do |ll|
      next if ll.head.next.key == nil
      @store[ll.head.next.key.hash % num_buckets] = ll 
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
