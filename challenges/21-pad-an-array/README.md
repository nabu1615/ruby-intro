## Competencias de Aprendizaje
- Romper un problema en peuqueños pedazos
- Implementar un metodo basado en pseudocodigo
- Investigar metodos de ruby
- Deferenciar entre metodos destructivos y no destructivos

## Resumen:
En este reto, vas a trabajar con metodos destructivos y no destructivos. En ruby la convencion general es añadir un (`!`) a los metodos que son destructivos (aunque hay metodo destructivos que no tienen la exclamacion). Los metodos destructivos modifican la estructura de datos original permanentemente. Los metodos no destructivos devuelven una copia de la estructura original.

Lo siguiente es un ejemplo:

```ruby
# No-Destructivo
irb(main):001:0> trees = ["Birch", "Fig", "Lime", "Pine"]
=> ["Birch", "Fig", "Lime", "Pine"]
irb(main):002:0> trees.collect {|tree| tree + " Tree"}
=> ["Birch Tree", "Fig Tree", "Lime Tree", "Pine Tree"]
irb(main):003:0> trees
=> ["Birch", "Fig", "Lime", "Pine"] #trees no ha sido modificado

# Destructivo
irb(main):004:0> trees.collect! {|tree| tree + " Tree"}
=> ["Birch Tree", "Fig Tree", "Lime Tree", "Pine Tree"]
irb(main):005:0> trees
=> ["Birch Tree", "Fig Tree", "Lime Tree", "Pine Tree"] #trees a sido permanentemente modificado.

```
Tu trabajo es, crear dos metodos `pad` y `pad!`. Cada uno acepta un arreglo como argumento, un tamaño minimo (integer no negativo) y un argumento opcional que a con que debe ser rellenado el array.

Si la longitud del array es menor al tamaño minimo, `pad` debe devolver un nuevo arreglo igual al arreglo original.

Por Ejemplo:
```ruby
pad([1,2,3], 5)
```

Debe devolver:

```ruby
[1,2,3,nil,nil]
```

y

```ruby
pad([1,2,3], 5, 'apple')
```

debe devolver:

```ruby
[1,2,3,'apple', 'apple']
```

Si el tamaño minimo es menor o igual a la ongitud del array, el metodo debe devolver el array.

De modo que , `pad([1,2,3], 3)` debe devolver `[1,2,3]`.

`pad(my_array, 0)` debe devolver un arreglo igual a `my_array`. `pad` siempre debe devolver un nuevo arreglo, debe ser no destructivo.

`pad!`, se comporta identico a `pad` excepto que modifica el arreglo orignal.

