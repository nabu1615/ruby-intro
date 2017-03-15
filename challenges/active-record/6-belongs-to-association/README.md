# Active Record: Asociación `belongs_to`

## Summary

![Database Schema](schema_design_new.png)

*Figura 1*. Esquema.

Ya hemos escrito las migraciones que crean las tablas y campos de nuestra aplicación. Cada tabla tiene una llave primaria `id`. Algunas de ellas tienen llaves foráneas que apuntan al `id` de otras tablas. Cuando juntamos dos tablas a travez de de llaves primarias y foráneas podemos decir que sus modelos correspondientes están asociados. Solo tenemos que definir esa asociación como se va a ver.

En nuestro esquema, podemos ver que cada registro de `ratings` tiene un `dog_id` que apunta a un registro de la tabla `dogs` con un `id` que sea igual al `dog_id`. Podemos definir una asociación que describa la relación entre las clases `Rating` y `Dog`.

La pregunta es que clase de relación toca hacer? Considerémoslo por ahora desde la perspectiva de la clase `Rating`. La tabla `ratings` tiene una llave foránea, por lo cual una instancia de `Rating` debe pertenecer (`belongs_to`)  a un `Dog`.

```ruby
class Rating < ActiveRecord::Base

  belongs_to :dog

  validates :coolness, :cuteness, :judge_id, :dog_id, { :presence => true }
  validates :coolness, { :numericality => { :greater_than => 0, :less_than => 11 } }
  validates :cuteness, { :numericality => { :greater_than => 0, :less_than => 11 } }
  validates :judge_id, { :uniqueness => { :scope => :dog_id } }

end
```

*Figura 2.*

La figura 2 nos muestra una clase `Rating` actualizada que define la asociación entre `Rating` y `Dog`. Mira la linea `belongs_to :dog`.  

Esto es muy parecido a un método `attr_reader`, `attr_writer` y `attr_accessor`. Como estos métodos `belongs_to` es un método que sera llamado sobre la clase donde lo definamos en esta caso `Rating`. `belongs_to` nos provee con métodos de instancia que podemos llamar sobre objetos de la clase `Rating`.

En particular, vamos a tener métodos *getter* y *setter* para instancias de `Dog` que estén asociadas con un `Rating`. Los nombres de los métodos se derivan del argumento que le pasemos a `belongs_to`. En este caso le pasamos `:dog`. Por lo cual obtenemos el método *getter* `#dog` y el método *setter* `#dog=`.

Hay 3 métodos mas que nos da el `belongs_to`. Estos son `#build_dog`, `#create_dog` y `#create_dog!`. Podemos usar estos métodos para construir objetos de `Dog` que le pertenezcan a una instancia de `Rating`.

### Convenciones de Active Record

Convención sobre configuración, este es un mantra de todo el stack de rails. AR nos provee con mucha funcionalidad con muy poco código escrito por nosotros, pero para poder lograr esto tenemos que seguir ciertas convenciones. Por ejemplo, los nombre de nuestras tablas tienen que hacer match con los nombres de nuestras clases de lo contrarios AR no funciona y nos toca configurarlo.

Lo mismo es cierto para definir asociaciones entre clases. Declarar `belongs_to :dog` en la clase `Rating`, implica que estemos siguiendo las siguientes convenciones:

Cuando definimos la asociaciones, AR espera encontrar una clase que tenga el mismo nombre al argumento que pasamos. En este caso el argumento que pasamos es `:dog`, por lo cual AR espera encontrar una clase `Dog`. Tenemos una entonces todo esta bien. Así mismo AR necesita saber que objeto de `Dog` es al cual el `Rating` le pertenece, en otras palabras necesita saber cual es el `foreign_key` en la table `ratings` que hace match con el `id` en la tabla `dogs`. La convención indica que el foreign key se debe llamar `dog_id`. Si seguimos esta convención la asociación simplemente funciona.

Si alguna de estas convenciones se rompe, tenemos que configurar la asociación manualmente. Osea le tenemos que decir a AR donde mirar. Podemos hacer esto pasando un hash opcional como argumento al método `belongs_to`. AR va a asumir que la clase especificas y si foreign_key existen. Si no están le damos esta información:

`belongs_to :dog, { :class_name => "Dog", :foreign_key => :dog_id }`

Si nos devolvemos a la figura 1, podemos ver que `ratings` tiene otra llave foránea: `judge_id`. Nosotros no tenemos una tabla de judges, tenemos es una tabla de `people`. Por lo cual en la clase `Rating`, si queremos decir `belongs_to :judge`, vamos a tener que romper la convención. AR espera que la clase `Judge` exista, lo cual no es cierto. Por lo cual tenemos que especificar a que clase nos referimos. AR también espera que encontrar un `judge_id` en la tabla `ratings`, el cual si tenemos, por lo cual esa convención no la rompimos.

Estamos en la misma situación cuando queramos definir la asociación entre `Dog` y `Person`. Dado que queremos decir en la clase `Dog` que este `belongs_to :owner`, ahi también estamos violando una convención.

## Pasos

### Pre-paso:

1. Usa bundler para garantizar que los gems estén instalados.

2. Usa la tarea de rake para crear la base de datos.

3. Usa la tarea de rake para migrar la base de datos.

4. Usa la tarea de rake para hacer `seed` de la base de datos, esto cree registros en todas las tablas.

### Paso 0: Explorando `belongs_to`

Abre la consola con `bundle exec rake console`.

desde la consola ...

- `our_rating = Rating.first`

  Al llamar `Rating::First` esta nos devuelve el primer registro en la tabla `ratings` ordenado por primary key. Esta instancia de `Rating` queda asignada a la variable `our_rating`. Al mirar el objeto podemos ver que tiene un `dog_id` con valor `1`. En otras palabras `our_rating` pertenece al perro con `id` `1`.

- `our_rating.dog_id`

  Podemos sacar el valor de `dog_id` para ver que es en efecto `1`.

- `our_rating.dog`

  Acá estamos usando el método *getter*  que nos da `belongs_to`. Este nos da el objeto `Dog` al cual `our_rating` le pertenece. En este caso este perro es Ozu.

- `other_dog = Dog.find(3)`

  Acá estamos asignando la variable `other_dog` a una instancia de `Dog`, la que tenga el `id` de `3`.

- `our_rating.dog = other_dog`

  Estamos llamando el método *setter* dado por `belongs_to` para cambiar la instancia de `Dog` a la cual le pertenece `our_rating`.

- `our_rating.dog_id`

  Podemos ver que AR a actualizado el valor del atributo `dog_id` de `our_rating`. Sin embargo este cambio solo existe en el objeto de Ruby no en la base de datos.  

- `our_rating.save`

  AL llamar `#save` en `our_rating`. Esto va hacer que el cambio persista en el objeto `Dog` al cual `our_rating` le pertenece.

- `new_rating = Rating.new(coolness: 8, cuteness: 9, judge_id: 5)`

  Acá creamos una nueva instancia de `Rating` que no a sido guardada en la base de datos, podemos ver que tiene `nil` como como valor para su `id`. También nota que el valor para `dog_id` también `nil`.

- `new_rating.create_dog(name: "Toot", owner_id: 4, license: "OH-1234567")`

  Acá estamos usando otro de los método que nos da `belongs_to`. `#create_dog`, va a crear un perro al cual `new_rating` le va a pertenecer.

- `new_rating.dog`

  Podemos obtener este pero recién creado por medio del método *getter* `#dog`. Como llamamos `#create_dog`, una instancia de `Dog` fue creada y los datos guardados en la base de datos. Podemos verificar esto por que el perro tiene un valor para el `id`.

- `new_rating`

  Si miramos a `new_rating` podemos ver que su `dog_id` que antes era `nil`, ahora a sido actualizado con el valor `id` del perro recién creado. AR hizo todo esto por nosotros cuando llamamos `#create_dog`.

- `new_rating.save`

  Guardamos el nuevo rating en la base de datos.

- `exit`

### Paso 2:  Escribe una asociaciones `belongs_to`

Nos falta definir las asociaciones de que un rating le pertenece a un judge, y que un dog le pertenece a un owner. Definidas en sus clases respectivas. Hemos agregado pruebas para que sepas que todo te quedo bien.
