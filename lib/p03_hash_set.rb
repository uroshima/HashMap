require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    # p key
    key = (key.hash % num_buckets)
    # p key
    @store[key] = key unless @store.include?(key)
    @count += 1
  end

  def include?(key)
    key = (key.hash % num_buckets)
    return true if @store[key][key]
    false
  end

  def remove(key)
    key = (key.hash % num_buckets)
    @store[key] = [] if @store.include?(key)
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
    num_buckets.times do |i|
      key = @store[i].hash
      new_store.insert(key)
    end
    @store = new_store
  end
end
