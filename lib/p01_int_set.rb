class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    if is_valid?(num)
      if @store[num]
        return true
      else
        return false
      end
    end
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 1
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
     # p @store.include?(num)
    @store[num] = num unless @store.include?(num)
  end

  def remove(num)
    @store[num] = [] if @store.include?(num)
  end

  def include?(num)
    return true if @store[num][num]
    false
  end

  private

  def [](num)
    @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
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
    resize! if @count == num_buckets
    @store[num] = num unless @store.include?(num)
    @count += 1
  end

  def remove(num)
    @store[num] = [] if @store.include?(num)
  end

  def include?(num)
    return true if @store[num][num]
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    num_buckets.times { |i| new_store.insert(@store[i])}
    @store = new_store
  end
end
