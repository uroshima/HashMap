class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index {|el, i| result += (el.hash * i.hash)}
    result
  end
end

class String
  def hash
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    result = 0
    self.chars.each_with_index {|el, i| result += (alphabet.index(el).hash * i.hash)}
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    result = 0
    self.each do |key, value|
      if key.class == Symbol
        key = key.to_s + "a"
      end
      value = value.to_s
      result += (alphabet.index(key).hash * alphabet.index(value).hash)
    end
    result
  end
end
