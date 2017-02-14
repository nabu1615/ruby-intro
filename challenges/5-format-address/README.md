#Define a method that returns a formatted address

## Competencias a Aprender
- Definir un metodo que acepte argumentos y los use
- Aplicar metodos de string, array, hash y/o enumerable


## Resumen
Crea un metodo llamado `make_address` que acepte argumentos para `street`, `city`, `state`, y `zip` y que devuelva un `String` con la direccion.

Por ejemplo si llamamos el metodo de la siguiente manera:

```ruby
make_address("633 Folsom St.", "San Francisco", "CA", "94107")
```

El valor que debe devolver es:

```ruby
"You live at 633 Folsom St., in the beautiful city of San Francisco, CA. Your zip is 94107."
You live at 633 Folsom St., in the beautiful city of San Francisco, CA. Your zip is 94107.
```

**Nota**: Las palabras del output que no son parte de los parametros del metodo deben hacer match exacto con las palabras del output de arriba.


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
