# Un metodo es un bloque de codigo reutilizable


# Definicion del metodo
def say_my_name(name, age = 10, *args)
  print args
  "#{name} tienes #{age}"
end

# Invocar
p say_my_name('juan', 26, 'verde', ['ruby', 'javascript'])
p say_my_name('jose', 5)
p say_my_name('pepito', 4)

# p result
