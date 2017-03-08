# ---
# dependency injection _> Diseño
# ---

class Tree
  def initialize(fruit)
    @fruit = fruit
  end

  def get_fruit
    Array.new(3) {@fruit}
  end

  def method_name
    @fruit.
  end

end

orange = Orange.new
orangeTree = Tree.new(orange)


class Orange
  def squeeze

  end
end

class Apple
  def slice

  end
end


ot = Tree.new(Orange)
p ot.get_fruit

ot = Tree.new(Apple)
p ot.get_fruit


# ----
# "self"
# ----

p self -> Main
p self.class ->

puts "--1--"

def x
  p self
  p self.class
end

x

puts "--2--"

class A
  p self -> A
  p self.class

  def y
    p self
    p self.class
  end

  # Metodo de clase
  def self.z

  end

end


puts "--3--"

a = A.new
a.y

A.z

puts "--4--"

class B

  p self
  p self.class

  def y
    p self
    p self.class
  end
end

puts "--5--"

B.new.y
