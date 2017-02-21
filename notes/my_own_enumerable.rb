e
  word_array = %w[hola como estas]

  # Returns a new array with the results of running block once for every element in enum.

  def my_map(array)
    result = []
    array.length.times do |element|
      result << yield(element)
    end
    result
  end

  def my_map(array)
    result = []
    count = 0
    while count < array.length
      result[count] = yield(array[count])
      count += 1
    end
    result
  end

  num_array = [1,2,3,4,5]

  # my_map(num_array) {|n| n * 2}


  # my_map(num_array) {|n| n * 2}


  def my_map(array)
    result = []
    array.each do |element|
      result << yield(element)
    end
    result
  end

  def filter(array)
    result = []
    array.each do |element|
      if yield(element)
        result << element
      end
    end
    result
  end

  # num_array.my_map() {}
  # my_map(num_array)


  def my_map(array)
    result = []
    array.length.times do |i|
      result << yield(self[i])
    end
    result
  end

  class Array
    def my_map()
       result = []
       self.length.times do |i|
         result << yield(self[i])
       end
       result
    end

    def batman(sidekick)
      result = []
      self.each do |hero|
        result << yield(hero)
      end
      result << "jaja #{sidekick}"
      result.join(' ')
    end
  end


  dc = ['batman', 'gatubela']
  puts dc.batman('robin') {|hero| "#{hero} algo sucede aqui"}
  # batman = num_array.my_map do |n|
  #   n * 2
  # end

  # p  batman, "nanana"

    def my_map_2(&block)
      result = []
      each do |element|
        result << block.call(element)
      end
      result
    end

  def my_map_2(&block)
    result = []
    each do |element|
      result << block.call(element)
    end
    result
  end

  # Passes each entry in enum to block. Returns the first for which block is not false. If no object matches, calls ifnone and returns its result when it is specified, or returns nil otherwise.
  def find(ifnone = nil, &block)
    result = nil
    found = false
    each do |element|
      if block.call(element)
        result = element
        found = true
        break
      end
    end
    found ? result : ifnone && ifnone.call
  end

  # Returns an array containing all elements of enum for which the given block returns a true value.
  def find_all(&block)
    result = []
    each do |element|
      if block.call(element)
        result << element
      end
    end
    result
  end

  # Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

  [1,2,3].reduce() {}
  def reduce(accumulator = nil) yield
    each do |element|
      accumulator = block.call(accumulator, element)
    end
    accumulator
  end

  def first
    found = nil
    each do |element|
      found = element
      break
    end
    found
  end

  def min
    reduce do |accumulator,element|
      accumulator > element ? element : accumulator
    end
  end

  def max
    reduce do |accumulator,element|
      accumulator < element ? element : accumulator
    end
  end







def pad(array, min, fill = nil)
  new_array = []
end













class Array
  def reduce(start = nil)
    accu = start
    self.each do |element|
      accu = yield(accu, element)
    end
    accu
  end
end

# p [1,2,3,4].reduce(0) {|accu, n| accu + n}
# p [1,2,3,4].reduce({}) { |accu, n|
#   accu[n] = n
#   accu
# }

min = [1,2,3,4,5].reduce do |accu, element|
  accu > element ? element : accu
end

max = [1,2,3,4,5].reduce do |accu, element|
  accu < element ? element : accu
end

p min, max


