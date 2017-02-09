#Valid Triangle

## Competencias a Aprender
- Definir metodo que acepte y use variables locales

## Resumen
Escribe un metodo `valid_triangle?` el cual reciba como argumento 3 numeros no negativos. Debe devolver `true` si los 3 numeros pueden formar los lados de un triangulo y `false` si no es asi.

Los argumentos no corresponden a lados especificos. No te preocupes por manejar inputs negativos &mdash; basura que entra basura que sale.

Nota: Cuando ves un metodo que termina en `?` en el nombre, quiere decir que el resultado es un valor `Boolean`.

Por ejemplo,

```ruby
valid_triangle?(0,0,0) # => false, because a triangle can't have 0-length sides

valid_triangle?(1,1,1) # => true, an equilateral triangle

valid_triangle?(3,4,5) # => true, a right triangle
valid_triangle?(4,3,5) # => true, the same right triangle
valid_triangle?(5,3,4) # => true, the same right triangle

valid_triangle?(10, 10, 100) #=> false, no such triangle exists
```

Posiblemente quieras leer: [Este articulo de wikipedia sobre Pythagorean triples](http://en.wikipedia.org/wiki/Pythagorean_triple).

## Pasos

## Paso 0: Pseudocode
Considera cuales son los pasos necesarios para solucionar este reto. Lo mejor es que escribas estos pasos.

## Paso 1: Solucion Inicial
Escribe el codigo inicial en el archivo [my_solution.rb](my_solution.rb)

## Paso 2: Pruebas
Corre las pruebas para ver que tu codigo funcione

Escribe `rspec` seguido del nombre del archivo.

```ruby

$ <nombre-del-archivo> [master] :> rspec my_solution.rb

```

Deberias obtener un resumen de pruebas exitosas y no exitosas.  (Asegurate de estar en el directorio indicado)

## Paso 3: Refactor
Haz los cambios que consideres necesarios basado en las pruebas. Luego corre las pruebas de nuevo.

Asegurate que todas las pruebas pasen antes de seguir adelante.

## Paso 4: Publica
Cuando tengas la solucion lista, haz un commit y empuja tus cambios!
