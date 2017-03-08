# Expresiones regulares:

# Nos sirven para encontrar patrones en strings, tales como placas de carros, tarjetas de credito, correos electronicos o culquier cosa que busquemos.


# Algunos patrones:
/\d/ #-> Cualquier digito
/\d{4}/ #-> 4 digitos seguidos
/\d{4}(\s)?/ # 4 digitos seguidos de un espacio opcional
/\d{4}[\ \-]?/ # 4 digitos seguidos de un espacio o guion opcional
/\d{4}[\s\-]?\d{4}[\s\-]?\d{4}[\s\-]?\d{4}/


# Syntaxis

# Uno o mas dentro del string
"Andres" "juan" 'pepito'
/[ab]/ # Estoy buscando sea a o b dentro del string

# Ninguno de esto en el string
/[^ab]/ # Cualquier caracter que no sea a o b

# Al comienzo del string, tambien se puede mirar al final
/\Az/ # Comienza el string con z

# n consecutivas veces
/a{4}/ # 4 a seguidas

# cero o mas
/ab*c/ #un string en donde haya una a seguida opcionalmente por n b y luego una c


#Ejercicio

# Crea una expresion regular que haga match a
# Un cuadrado seguido por un triangulo y un circulo opcionales seguido por un cuadrado opcional seguido por 2 triangulos seguido por el final del string


mentor\s(\w*)\sage\s(\d*)

#Respuestax
/s(tc)?s?t{2}\z/
/s(tc)?s?t{2}$/

stcstt
stt
sstt
stct
ststt

# Usando REGEX en ruby



'avion'.match(/on/)
/on/.match('avion') # -> matchdata Object
/carro/.match('avion') # -> nil


m = /(.)(.)(\d+)(\d)/.match("THX1138.")
m[0] # -> me da todo el pedazo que hizo match
m[1] # -> me da el primer pedazo dentro de parentesis que hizo match


/pi/ =~ 'pepito' # -> 2
'pepito' =~ /pi/

sub
sub!
gsub
gsub!

'480.01.4430'.gsub(/(\d{3})\D?(\d{2})\D?(\d{4})/, '\1-\2-\3')
'480014430'.gsub(/(\d{3})\D?(\d{2})\D?(\d{4})/, '\1-\2-\3')


