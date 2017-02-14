# Leap Years

# # Tu solucion abajo:
# condition = true

# unless !condition
#   p "algo"
# end

# p 'blahah' if condition


# if condition
#   p 'Blahah'
# end


# if condition
#   p 'if'
# else
#   p 'else'
# end

# condition ?  p 'if' : p 'else'
# def leap_year?(year)
#   if year % 4 == 0 || year % 400 == 0
#     return true unless year % 100 == 0 && year % 400 != 0
#     false
#   else
#     false
#   end
# end

def leap_year?(year)
  if year % 4 == 0 && year / 100 != 0 || year % 400 == 0
    true
  else
    false
  end
end

# def leap_year?(n)
#   if n % 4 == 0 && n % 100 == 0 && n % 400 != 0
#     false
#   elsif n % 400 == 0
#     true
#   elsif n % 4 == 0 && n % 100 == 0
#     true
#   elsif n % 4 == 0
#     true
#   else
#     false
#   end
# end
