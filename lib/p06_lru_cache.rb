require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key) #Of Fenris!
    unless @map.include?(key)
      val = @prc.call(key)
      @store.append(key, val)
      @map.set(key, val)
    end
    # node = @map.get(key)
    eject! if @map.count > @max
     val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    #@map[0].delete
    @store.remove(@store.head.next.key)
  end
end
