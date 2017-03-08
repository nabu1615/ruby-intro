# FLujo control es establecer dependiendo de condiciones que debe hacer el programa

# < > <= >=

num1 = 9.0
num2 = 10
str = nil

# < > <= >= == != && ||


# Or
# Expresión Resultado
# (true || true)  true
# (true || false) true
# (false || true )true
# (false || false)  false

# And
# Expresión Resultado
# (true && true)  true
# (true && false) false
# (false && true) false
# (false && false)  false



# falsy , thruty
# if num1 <= num2
#   if num1 == num2
#     puts 'si num1 es o igual a num2 '
#   else
#     puts 'si num1 es menor a num2'
#   end
#   puts 'Estoy adentro del if'
#   if num1.class == Float
#     puts 'Si num1 es menor o igual a num2 i ademas es un FLoat'
#   end
# elsif num1.class == Integer
#   puts 'Si num1 es mayor a num y es in Integer'
# else
#   puts 'nada de lo anterior se cumple'
# end


if 3 != 4 && !("pedro" == "juan" || 26 > 10)
  puts 'Dentro del if'
end
# true && !(false || true)
# true && !(true)
# true && false
# false


customer_would_like_coffee? = true

puts "Preparar cafe" if customer_would_like_coffee?
puts "Naranjas" unless customer_would_like_coffee?

customer_would_like_coffee? ? puts "Preparar cafe" : puts "Naranjas"


hour = 15



case average
when hour < 12
    puts "Good Morning"
when hour > 12 && hour < 17
    puts "Good Afternoon"
else
    puts "Good Evening"
end

message = if
    when hour < 12
        "Good Morning"
    when hour > 12 && hour < 17
        "Good Afternoon"
    else
        "Good Evening"
    end

#statements #expresions

puts message





