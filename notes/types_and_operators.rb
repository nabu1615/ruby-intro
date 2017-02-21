#tipos y operadores

# Strings
# Integers
# Floats
# Booleans
# Arrays
# Hashes
# symbols
# nil
# Range

str1 = 'hola'
str2 = "como estas"
str3 = 'i love \"ruby\"'
str4 = 'i love "ruby"'

str_largo = str1 + " " + str2

# Interpolacion

str_largo = "#{str1} #{str2} pepito mi edad es #{3 * 4} nueva linea"

# puts str_largo
# print str_largo
# p str_largo

str6 = 'Me gusta Ruby'

str6['gusta'] = 'encanta'

# Numeros

int = 5
num = 8
div = num / 3

#PEMDAS

p sum = 3 * 4 + 5 # 17
p sum = 3 * (4 + 5) # 27


# Booleano

num1 = 1
num2 = 2

# <, >, <=, >=, !=, ==, &&, ||
result = num1 > num2

num = true


#### STRINGS ####

# Un string es una serie de caracteres encerrados dentro de un par de comillas

# str1 = "Texto dentro de comillas dobles"
# str2 = 'Texto dentro de comillas simples'

# # Como usar texto con comillas dentro de un string

# str1 = 'con las palabras "hola mundo" creo ruby'

# # Escapando caracteres

# str1 = 'Y con las palabras "vamos pa\' lante" creo Ruby'

# puts str1

# # Es posible concatenar strings con el operador +

# con_string = 'hola' + 'como' + ' estas'

# ### NUMBERS ####

# # En ruby los numeros se escriben sin encerrar en ningun tipo de comillas

# int = 8
# float = 8.0

# # Mismo orden que en aritmetica (Parentisis, Exponentes, Multiplicacion, Division, Adicion, substraccion) PEMDAS

# result1 = 3 * 4 + 5
# result2 = 3 * (4 + 5)

# puts result1
# puts result2
