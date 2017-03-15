# Active Record: Asociación `has_many`

## Resumen

![Database Schema](schema_design_new.png)

*Figura 1*. Esquema.

En el reto anterior, miramos como hacer las asociaciones del lado que pertenecen.

- Un perro le pertenece a un owner.
- Un rating le pertenece a un judge.
- Un rating le pertenece a un perro.

En este reto, vamos a mirar las asociaciones `has_many`. Este tipo de asociación es el inverso de un `belongs_to`. Un owner tiene muchos (`has_many`) perros, un judge tiene muchos ratings, y un perro tiene muchos ratings. Nuestros owner y judges son instancias de la misma clase `People`, de modo que una persona tiene muchos perros y muchos ratings.

```ruby
class Dog < ActiveRecord::Base
  include USGeography

  has_many :ratings
  belongs_to :owner, { class_name: "Person" }

  validates :name, :license, :owner_id, { :presence => true }
  validates :license, { :uniqueness => true }
  validates :license, format: { with: /\A[A-Z]{2}\-/ }
  validates :age, { :numericality => { greater_than_or_equal_to: 0 },
                    :allow_blank  => true }

  validate :license_from_valid_state

  def license_from_valid_state
	# agrega errores bajo ciertas condiciones
  end
end
```

*Figura 2.*

la figura 2 nos muestra la clase `Dog` que defina la asociación entre un `Dog` y un `Rating`, desde la perspectiva de un `Dog`. Nota la linea `has_many :ratings`.

Así como en `belongs_to`, `has_many` es un método que se va a llamar sobre la clase que lo definamos, en este caso `Dog`. `has_many` nos provee con métodos de instancia que podemos llamar sobre objetos de `Dog`. Estos métodos son un poco diferentes a los que nos da `belongs_to`.

Vamos a empezar mirando los *getter* y *setter*. De nuevo los nombres de los métodos son derivados del argumento que le pasemos a `has_many`. En este caso le pasamos `:ratings`. Por lo cual el `getter` va a ser `#ratings` y el `setter` va a ser `ratings=`

Tenemos un numero de métodos adicionales. Por ejemplo, tenemos un método para empujar objetos de `Rating` dentro de los ratings del perro `#ratings.<<`. También tenemos un getter y setter que funcionan con el `id` de los objetos asociados. De modo que para cualquier perro podemos sacar los `id` de sus ratings: `#ratings_ids`. O podemos reasignar los ratings que un perro tiene al usar `#ratings_ids=`. Y como con `belongs_to`, también tenemos métodos para construir y crear ratings que estén asociados a un perro: `#ratings.build`, `#ratings.create` y `#ratings.create!`. Para una descripción mas a fondo de estos métodos mira acá [apidock description](http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many)

### Convenciones de Active Record

Cuando definimos una asociación `has_many`. AR espera encontrar una clase con el nombre del argumento que le pasemos. En este caso le pasamos `ratings`, de modo que AR espera encontrar la clase `Rating`. Tenemos una entonces bien. También AR necesita como identificar la llave foránea en la tabla `ratings` que haga match con el `id` de un `Dog`. La convención indica que esta debería ser `dog_id`.

Si rompemos la convención tenemos que configurar la asociación.

`has_many :ratings, { :class_name => "Rating", :foreign_key => :dog_id }`

Una Persona tiene muchos perros. Si en la clase `Person` defino la asociación `has_many :dogs`, esta no va a funcionar por que la convención esta rota. AR espera encontrar una clase `Dog` la cual existe, pero también que dentro de la tabla `dogs` exista una llave foránea `person_id`, la cual no tenemos. En cambio tenemos la llave foránea `owner_id`, de modo que tenemos que especificar que llave foránea debe usar AR.

Lo mismo va a pasar cuando hagamos la asociación entre `Person` y `Rating`.

## Pasos

### Pre-paso:

1. Usa bundler para garantizar que los gems estén instalados.

2. Usa la tarea de rake para crear la base de datos.

3. Usa la tarea de rake para migrar la base de datos.

4. Usa la tarea de rake para hacer `seed` de la base de datos, esto cree registros en todas las tablas.

### Paso 0: Explorando `has_many`

Abre la consola con `bundle exec rake console`.

desde la consola ...


- `ozu = Dog.find_by(name: "Ozu")`

  Esto nos da un objeto de `Dog` para trabajar. Este quede en la variable `ozu`.

- `ozu.ratings`

  Acá estamos usando el `getter` de `has_may`. Este nos devuelve un objeto `ActiveRecord::Associations::CollectionProxy`. No es un arreglo, pero se comporta como uno. Todos los ratings de ozu están dentro de esta colección.

- `ozu.ratings.count`

  Esto nos da el numero de ratings de `ozu`. Puedes ver que el query de SQL que genera es:
   `SELECT COUNT(*) FROM "ratings"  WHERE "ratings"."dog_id" = ?  [["dog_id", 1]]`

- `new_rating = Rating.new(coolness: 8, cuteness: 10, judge_id: 4)`

  Acá estamos creando un nuevo  objeto `Rating` el cual vamos a proceder a incluir dentro de los ratings de `ozu`. Viendo el objeto podemos ver que su `id` y `dog_id` son ambos `nil`.

- `ozu.ratings << new_rating`

  Acá estamos usando el método `#ratings.<<` que `has_many` nos da. Se usa muy parecido a como funciona el método `Array#<<`. Estamos tomando la colección de ratings de ozu y le estamos empujando un objeto de ratings.

- `new_rating`

  Si miramos ahora a `new_rating`, podemos ver que ya tiene un valor par `id` y para `dog_id`. Cuando empujamos `new_rating` dentro de los ratings de `ozu`, AR actualizo el `dog_id` de `new_record ` para que fuera igual al `id` de `ozu`, luego guardo el registro lo cual le asigno el `id`.

- `ozu.ratings.include? new_rating`

  Al correr esto, podemos ver que dentro de los ratings de `ozu` se incluye `new_rating`. Nota que AR no hizo un query de SQL, dado que todo ya estaba en memoria.

- `ozu.rating_ids`

  Esto nos devuelve un arreglo de los `id`s, de los ratings que le pertenecen a `ozu`.

- `ozu.ratings.build(coolness: 7, cuteness: 9, judge_id: 5)`

  Acá estamos creando un nuevo `Rating` y asignándolo a `ozu`. El nuevo `Rating` tendrá su `dog_id` con el valor del `id` de `ozu`. El valor del `id` del nuevo `Rating` va a ser `nil` por que todavía no lo hemos guardado en la base de datos, este solo existe en ruby.  

- `ozu.ratings`

  Acá podemos que este nuevo rating esta dentro de los ratings de `ozu` pero su `id` es `nil`.

- `ozu.save`

  Cuando guardamos a `ozu`, el rating recién construido también es guardado.

- `ozu.ratings.where(cuteness: 10)`

  Acá estamos buscando todos los ratings de `ozu` en donde el cuteness sea 10. AR interpreta este método y crea el siguiente query:

  `SELECT "ratings".* FROM "ratings"  WHERE "ratings"."dog_id" = ? AND "ratings"."cuteness" = 10  [["dog_id", 1]]`.

- `rating_ids = ozu.rating_ids`

  De nuevo, acá estamos sacando los `id`'s de los ratings de `ozu`. Esta vez asignamos el array que nos devuelve a la variable `ratings_ids`.

- `ozu.ratings = []`

  Podemos asignar una colección de ratings a `ozu`. Acá lo hicimos con un arreglo vacío. Estamos diciendo que `ozu` no tiene ratings. Para lograr esto AR actualiza el valor de `dog_id` para todos los ratings que antes le pertenecían a `ozu`, ahora su valor va a ser `nil`.

- `ozu.ratings.empty?`

  Pedemos ver que `ozu` ya no tiene ratings.

- `Rating.find rating_ids`

  Anteriormente habíamos guardado los `id`'s viejos de los ratings de ozu en la variable `rating_ids`. Ahora la vamos a usar para encontrar todos estos ratings de la base de datos. En la colección que esto nos devuelve podemos ver que todos los ratings que están ahi tiene un como valor para `dog_id`, `nil`. Ya no hay conexión entre los registros.

- `ozu.rating_ids= rating_ids`

  Le estamos devolviedndo a `ozu` sus ratings. Podemos ver que AR hace varios llamados `UPDATE` para lograr esto.

- `ozu.ratings`

  Los ratings de vuelta.

- `exit`

### Release 2:  Write `has_many` Associations

Define las asociaciones `has_many` entre `Person` y `Dog` una persona tiene muchos perros y entre `Rating` y `Person` una persona tiene muchos ratings.
