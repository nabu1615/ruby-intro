class Dog
  attr_reader :name, :height

  def initialize(args)
    @name = args[:name]
    @height = args[:height]
  end

end

bido = Dog.new name: "bido", height: 1.5
mido = Dog.new name: "mido", height: 1.5
fido = Dog.new name: "fido", height: 2.5
sido = Dog.new name: "sido", height: 3.0


begin
  puts "~"*50
  puts "trying to compare two instances of Dog"
  p fido > mido
rescue Exception => e
  # puts "weee, everything is fine."
  puts "--- ERROR! ---"
  puts e.message
  puts "--------------"
end

puts "~"*50
puts "comparing the height of two instances of Dog"
p fido.height > mido.height

# ---------------------------------------

# if i include the spaceship (comparator) operator i can
# customize my intention to compare two instances of my class

# note that i'm just cracking open the Dog class again
# modifying it by adding a new method <=>
class Dog
  def <=>(other)
    self.height <=> other.height
  end
end

puts "~"*50
puts "using the spaceship (comparator) operator "
p fido.<=>(mido)
p fido <=> sido  # same as above w. syntactic sugar

# ---------------------------------------

# now that i have a comparator i can get all the benefits
# of the Comparable module (>, < , =>, =<, ==, between?)

# yup, just cracking open the Dog class aga
# modifying it by including the Comparable module
class Dog
  include Comparable
end

puts "~"*50
puts "benefits of including Comparable"
p bido == mido
p bido >= mido
p bido <= mido

p fido > mido
p fido < mido

p fido.between?(mido, sido)

