# Active Record: Validaciones

## Resumen

En este reto, vamos a estar trabajando con validaciones de Active Record. Cuando creamos tablas en SQL, puede que agreguemos limitaciones como que una columna no sea null `NOT NULL`, lo cual indica que esa columna debe tener un valor. También podemos decir un limite de caracteres `VARCHAR(64)` por ejemplo.  

Active Record nos permite crear validaciones de este tipo desde nuestro modelo. Por ejemplo, cuando intentamos guardar un registro a la base de datos, Active Record va a validar que el objeto cumpla con las validaciones antes de guardarlo. Si todo se ve bien AR, hará el SQL necesario para hacer el `INSERT`. Si hay algún problema con los atributos del objeto, AR no va a correr el `INSERT`.

Este es un ejemplo de como se ven algunas validaciones:

```ruby
class Dog < ActiveRecord::Base

  # name, license, y owner_id son obligatorios
  validates :name, :license, :owner_id, { :presence => true }

  # la licencia debe ser única para cada perro
  validates :license, { :uniqueness => true }

  # la licencia, debe empezar con dos letras en mayusculas luego un guión luego cualquier carácter.
  validates :license, format: { with: /\A[A-Z]{2}\-/ }

  # la edad no es obligatoria, pero si esta no puede ser menor de 0
  validates :age, { :numericality => { greater_than_or_equal_to: 0 },
                    :allow_blank  => true }

  # validación personalizada
  validate :license_from_us_state

  def license_from_us_state
    unless self.license.instance_of? String
      errors.add :license, "must be a string"
      return
    end

    abbreviation = self.license[0..1]
    unless valid_state_abbreviation? abbreviation
      errors.add :license, "must be from a valid US state"
    end
  end
end
```

*Figure 1.*

Vamos a seguir trabajando con nuestra clase `Dog`. La clase ya esta definida en el archivo `app/models/dog.rb`.

### `validates`

AR, nos permite validar los valores de los atributos de un objeto. Dada una instancia de `Dog`, a este le podemos requerir tener un `name` y un `age`, al mismo tiempo podemos pedirles que cumplan ciertas condiciones. Estas validaciones están definidas con el método `validates` al cual le pasamos como argumento los nombres de los atributos. Por ejemplo en la clase `Dog`. podemos ver esto `validates :name, :license, :owner_id ...` y esto `validates :license ...`, acá estamos diciendo que queremos validar `name`, `license` y `owner_id` de alguna maneara y luego `license` de otra manera.

### Validation Helpers

Como especificamos la forma en que queremos que se vea una validación? AR, nos provee un numero de [validation helpers](http://guides.rubyonrails.org/active_record_validations.html#validation-helpers) que nos dan tipos comunes de validaciones. algunos de estos ya están en uso dentro de la clase `Dog`.

Después de pasarle los nombres de los atributos a `validates`, tenemos que especificar las opciones de la validaciones. Por ejemplo, `validates :license, { uniqueness: true }` si queremos que solo valores únicos se guarden dentro de `license`.

### Validaciones personalizadas

Dentro de `Dog`, podemos ver el método `license_from_us_state`. Este método esta escrito para hacer una validación personalizada. Queremos estar seguros que la licencia de un perro comience con la abreviación de un estado de USA.

En vez de usar el método `validates` usamos el método `validate` y le pasamos el nombre del método que hace la validación personalizada `validate :license_from_us_state`.

### Errors

AR, usa los errores para determinar cuando un objeto es valido o no. Para cada validación si la validación falla esta añade un error a un atributo `errors` del objeto. Si al final de todas las validaciones el objeto no tiene errores entonces este es valido. Si tiene un error, el objeto es invalido.

Es por esto que nuestra validación personaliza llama el método `errors.add`. Esa es nuestra forma de decir que una validación personalizada a fallado. Cuando llamamos `#add` en los errores de un objeto, le pasamos el nombre del atributo que es invalido y un mensaje describiendo el fallo (ej: `errors.add :license, "must be from a valid US state"`).

Vamos a trabajar en la consola para ver como funcionan estas validaciones. Puedes leer esta guía para mas información sobre validaciones [RailsGuides](http://guides.rubyonrails.org/active_record_validations.html)

## Pasos

### Pre-paso:

1. Usa bundler para garantizar que los gems estén instalados.

2. Usa la tarea de rake para crear la base de datos.

3. Usa la tarea de rake para migrar la base de datos.

4. Usa la tarea de rake para hacer `seed` de la base de datos, esto debe crear 3 perros.

### Paso 0: Validaciones y Errores.

Usa la tarea `bundle exec rake console` para entrar a la consola:

Desde ahi...

-  `new_dog = Dog.new`

  Esto crea una instancia de `Dog`. Todos sus atributos son `nil`.

-  `new_dog.valid?`

  Al llamar `#valid` sobre `new_dog` esto pasa a ejecutar todas las validaciones y luego devolver `true` si todas pasan o `false`si el objeto tiene errores. En este caso es `false`.

-  `new_dog.errors`

  Esto devuelve los errores que tiene el objeto `new_dog`.

-  `new_dog.errors.count`

  Esto nos dice cuantos errores tiene `new_dog`.

-  `new_dog.errors.messages`

  Esto nos devuelve un hash que contiene los atributos como llaves que fallaros las validaciones. El valor de cada llave es la naturaleza del fallo.

  Podemos ver que `name` y `owner_od` son atributos de `new_dog` que fallaron 1 validación. `license` fallo 3.

-  `new_dog.errors.full_messages`

  Si queremos ver un arreglo con los mensajes de error, podemos llamar este método. Esto es util para explicarle a los usuarios por que algo fallo.

-  `new_dog.save`

  Si intentamos guardar a `new_dog` podemos ver que `#save` devuelve false. Esto es por que dado que `new_dog` tiene errores AR no intenta guardarlo en la base de datos.

- `new_dog.name = "Moshi"`

  Antes vimos que en los errores que `"Name can't be blank"`. Por lo cual le estamos agregando un valor.

-  `new_dog.valid?`

  Solo arreglamos uno de los errores de `new_dog`. Por lo cual el objeto sigue invalido.

- `new_dog.errors.count`

  Pero ahora tenemos un error menos que antes.

Continua arreglando los errores hasta que `new_dog.save` devuelva `true`. Luego sal de la consola.

### Paso 2: Escribe validaciones para  `Rating` y `Person`

Hemos agregado unas pruebas para describir las validaciones que queremos en nuestros modelos. Mira como ejemplo las pruebas para `Dog` en `source/spec/models/dog_spec.rb` y como la clase las cumple todas.

Hay pruebas también para `Rating` y `Person`. No hay necesidad de que hagas validaciones personalizadas, los helpers de validación tienen todo lo que necesitamos. Tendrás que explorarlos para poder pasar todas las pruebas. 
