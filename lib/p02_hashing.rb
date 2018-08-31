class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |el, idx|
      hash_num += el * idx
    end
    hash_num
  end
end

class String
  def hash
    dummy = self
    hash_num = 0
    dummy.chars do |ch|
      hash_num += ch.ord * dummy.index(ch)
    end
    hash_num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  def hash
    arr = self.keys.sort
    hash_num = 0
    arr.each_with_index do |el, idx|
      hash_num += el.ord * idx
    end
    hash_num
  end
end
