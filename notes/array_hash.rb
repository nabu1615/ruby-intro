person = {
  name: 'juan',
  'name': 'juan',
  name: => 'juan',
  'name3' => 'juan',
  0: 'faksd',
  0 => ,
  name3: 'juan',
  name6: {name6: 'fasd'}
}

persons = {
  name: {name2: 'juan'}
}

students = {
  diana: {
    name: 'diana',
    age: 243,
    favorite_food: [
      'sushi',
      'pasta'
    ],
    mentor_id: 0
  },
  nicolas: {
    name: 'nicolas',
    age: 342,
    favorite_food: [
      'pizza',
      'ajiaco'
    ],
    mentor_id: 3
  }
}
make_it[:mentors][0][:id]
make_it = {
  mentors: [{id: 1, name: 'juan', age: 56}, {id: 0, name: 'german', age: 432}, ],
  students: students
}


make_it[:students].map do |key, value|
  if value[:mentor_id] == make_it[:mentors][0][:id]
    p "El mentor de #{value[:name]} es #{make_it[:mentors][0][:name]}"
  else
    p "El mentor de #{value[:name]} es #{make_it[:mentors][1][:name]}"
  end
end


mentors  =  make_it[:mentors];
students =  make_it[:students];

students.each do |student , info_student|
  mentors.each do |mentor|
    if info_student[:mentor_id]== mentor[:id]
      p "el mentor de #{info_student[:name]} es #{mentor[:name]}  y comida favorita"
    end
  end
end

make_it[:students].each do |student, info|
  p "el mentor de #{info[:name]} es: #{make_it[:mentors][info[:mentor_id]][:name]}"
end

# make_it[:students].each do |key, value|
#   mentor_id = value[:mentor_id]
#   mentor = make_it[:mentors][mentor_id][:name]
#   p "El mentor de #{key} es #{mentor}"
# end

make_it[:students].each do |key, value|
  mentor = make_it[:mentors].select {|mentor| mentor[:id] == value[:mentor_id] }.first
  p "Soy #{key} y mi mentor es #{mentor[:name]}, mi comida favorita es #{value[:favorite_food][0]}"
end

# students.each do |key, value|
#   p value[:name]
# end



products = [
  { id: 1, name: "Leche", price: 120, categories: ["familiar", "comida"] },
  { id: 2, name: "Arroz", price: 80, categories: ["familiar", "comida"] },
  { id: 3, name: "Lavadora", price: 7800, categories: ["electrodomésticos"] }
]


products[0][:categories][1]

sum = 0
products.each do |product|
  sum = product[:price] + sum
end
p sum


#### ARRAYS #####

name = 'juan'
age = 27
last_name = 'gomez'

person = [name, age, last_name]

temp = arr[0]
arr.insert(4, temp)

[1, "otra cosa", "nuevo"]

letters = Array.new
letters = Array.new(['a', 'b'])
letters = ['a', 'b', 'c']
letters = Array.new(3)
funArray = Array.new(3, 'fun')

letters[0]
letters[-1]
letters.insert(0, 1)
letters.insert(-1, 'd')
letters << 'e'
letters.push('f')
letters.pop
letters.delete_at(2)

array = [1, "Pedro", true, false, "Juan"]

# num_array.each.with.index {|n, index| puts "Elemento #{n} con indice #{index}"}

num_array = [1,2,3,4,5]
new_array = []
num_array.each do |n, index|
  if n == 2
    new_array.push(n * 2)
  end
end

# array.each.with_index do |element, index|
#   p "#{index}: #{element}"
# end

# Método  Descripción
# first Retorna el primer elemento del arreglo
# last  Retorna el último elemento del arreglo
# shuffle Retorna un nuevo arrego mezclado aleatoriamente
# length  Retorna el tamaño del arreglo


##### HASHES ####

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

cities = {
  CA: 'San Francisco',
  MI: 'Detroit',
  FL: 'Jacksonville',
}

cities['NY'] = 'New York'
cities['OR'] = 'Portland'


puts '-' * 10
cities.each do |key, value|
  puts "#{key} has the city #{value}"
end

puts '-' * 10
states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end

products = [
  { id: 1, name: "Leche", price: 120, categories: ["familiar", "comida"] },
  { id: 2, name: "Arroz", price: 80, ["familiar", "comida"] },
  { id: 3, name: "Lavadora", price: 7800, categories: ["electrodomésticos"] }
]

products.each do |product|
  puts product[:name]
  puts "  Id: #{product[:id]}"
  puts "  Precio: #{product[:name]}"
  puts "  Categorias: #{product[:categories].join(", ")}"
  puts "-" * 20
end

array = [1, "Pedro", true, false, "Juan"]
