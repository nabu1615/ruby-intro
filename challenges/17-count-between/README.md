#Count the number of elements between two bounds

## Competencias a Aprender
- Definir un metodo aue acepte y use argumentos
- Usar expresiones condicionales
- Aplicar metodos de string, array, hash y/o enumerable
- Iterar sobre arreglos

## Resumen
Escribe un metodo `count_between` el cual reciba 3 argumentos como input:

1. Un `Array` de integers
2. Un integer que sea el limite inferior
3. Un intefer que sea el limite superior

`count_between` debe devolver el numero de integers dentro del `Array` que esten dentro de los dos limites, incluyendo los limites.

Debe devolver `0` si el `Array` esta vacio.

Algunos Ejemplos:

```ruby
count_between([1,2,3], 0, 100)      # => 3
count_between([-10, 1, 2], 0, 100)  # => 2
count_between([10, 20, 30], 10, 30) # => 3
count_between([], -100, 100)        # => 0
count_between([0], 0, 0)            # => 1
```

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

Deberias obtener un resumen de pruebas exitosas y no exitosas. Resumen (Asegurate de estar en el directorio indicado)

## Paso 3: Refactor
Haz los cambios que consideres necesarios basado en las pruebas. Luego corre las pruebas de nuevo.

Asegurate que todas las pruebas pasen antes de seguir adelante.

## Paso 4: Publica
Cuando tengas la solucion lista, haz un commit y empuja tus cambios!
