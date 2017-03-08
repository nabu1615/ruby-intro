
# Pseudocode
# 1. Solucion Inicial
# Pseudocode
# 1. Solucion Inicial
# def most_common_words filename, num
#
# end
#
filename ='./source.txt'


def most_common_words (filename,number)
  hash = Hash.new
  file = File.open(filename, "r")
  finalResult = []
  compare = ["The","the", "his",'by','was', 'for', 'Set', 'or', "pp.", "with", "that", "of", "and", "in", "to", "a", "is", "as"]
  file.each_line do  |line|
    words = line.split
    words.each do |word|
      if hash.has_key?(word)
        hash[word] = hash[word] + 1
      else
        hash[word] = 1
      end
    end
  end

  hash.each do |key, value|
    if compare.include?(key)
        hash.delete(key)
    end
  end

  hash = hash.to_a
  hash.sort_by! do |item|
    item[1]
  end
  hash = hash.reverse.to_h
  hash.each do |key, value|
    if finalResult.length < number
        finalResult << "la palabra '#{key}' tiene '#{value}' ocurrencias"
    end
  end
  puts finalResult
end
most_common_words(filename, 4)
# 2. Solucion con Refactor
###### DRIVER CODE #########
# 2. Solucion con Refactor
###### DRIVER CODE #########
