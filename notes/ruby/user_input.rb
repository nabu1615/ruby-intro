puts 'Hola como es tu nombre ?'
name = gets.chomp
puts "Hola #{name} cual es tu edad ? "
age = gets.chomp.to_f
puts "#{name} en el 2020 tendras #{age + 3}"

