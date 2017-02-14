
# Pseudocode

1. input un arreglo de numeros
2. iterar sobre el arreglo
3. crear un variable  voy a ir guardando el mas pen
3. en cada iteracion comparar el elemento con

#Definicion
def find_minimun(array)
  return nil if array.length == 0
  count = array.first
  array.each.with_index do |n, index|
    if index == 0
      count = n
    else
      if n < count
        count = n
      end
    end
  end
  count
end

def find_minimun(arr)
  return nil if arr.length == 0
  count = array.first
  arr.each do |n|
    if n < count
      count = n
    end
  end
  count
end

rangos[:temperature] = temperature
rangos[:altitude] = altitude
rangos[:pressure] = pressure

# Invocar (Usar el metodo)

say_name('juan') # => 'Juan'
say_name(3) # => 3
say_name('fbasdjkfl ') # => fdksal;

find_minimun([1,2,3,4,5,6])
