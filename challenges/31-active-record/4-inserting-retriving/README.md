#Active Record Jugando con los Modelos.

## Summary

Vamos a investigar algunos de los metodos para leer e insertar registros usando Active Record.

## Pasos

### Pre-Paso

1. Desde la terminal, ejecuta `bundle install`.

2. Crear la base de datos con `bundle exec rake db:create`.

3. Corre las migraciones `bundle exec rake db:migrate`. Estas migraciones nos dejan con el esquema anterior que toca arreglar.

4. Popula la base de datos  `bundle exec rake db:seed`.

### Paso 0:

Vamos a trabajar con la clase `Dog` desde la consola. Para abrir la consola dale desde la terminal el comando `bundle exex rake console`.  Vamos a probar algunos de los métodos que nuestra clase hereda de `ActiveRecord::Base`. Para mas detalles lee esta guía [RailsGuides](http://guides.rubyonrails.org/)

Dentro de la consola ejecuta...

### Leyendo

- `Dog.all`

  Nos devuelve un `ActiveRecord::Relation`. lleno de instancias de `Dog`.

- `Dog.where(age: 1)`

  `::where` es un método de clase que acepta un hash como argumento que especifica los valores de ciertos campos en la tabla de la base de datos. En esta caso queremos todos los perros en donde la edad sea 1. `where` va a buscar todos los registros con en que hagan match con estas condiciones.

-  `Dog.where("age = ? and name like ?", 1, '%Te%')`

  `::where` también acepta string con condicionales, como si escribieres el SQL tu.

- `Dog.order(age: :desc)`

  `::order` te permite ordenar los resultados en base a algún campo.

- `Dog.limit(2)`

  `::limit` devuelve un numero Maximo de registros igual al numero especificado.

- `Dog.count`

  `::count` nos dice cuantos registros hay en la tabla.

- `Dog.pluck(:name, :age)`

  `::pluck` nos permite sacar solo los valores de ciertos campos.

-  `Dog.first`

  `::first` es un método de clase que nos da el primer registro en la tabla `dogs` ordenados por primary key. Opcionalmente podemos pasarle un numero `Dog.first(5)` para traer los primero 5 perros.

- `Dog.find(1)`

  `::find` nos permite buscar registros por su primary key. En este caso el `id`. Podemos pasar un arreglo de `ids` si buscamos multiples registros `Dog.find ([1, 2])``

- `Dog.order(name: :asc).where(age: 1).limit(1)`

  También es posible encadenar estos métodos. Active record creara solo un query de SQL para toda la cadena.


### Insertando


Ejecuta estos comandos en serie:

- `Dog.count`

  Nos debe decir que hay 3 perros en la tabla.

- `new_dog = Dog.new(name: "Bear")`

  `::new ` funciona muy parecido a como lo hace con clases normales de Ruby. Se crea una nueva instancia de `Dog` la cual nace con los atributos que le pasemos. En este caso un perro con el nombre 'Bear'. La variable `new_dog` apunta a este objeto recién creado.

  Los atributos que no especifiquemos quedan con valor `nil`. El valor del `id` también es `nil`. Al usar `Dog.new` NO guardamos el registro en la base de datos, este existe solo en memoria.

- `Dog.count`

  Seguimos con 3 perros

- `new_dog.save`

  Si tenemos una instancia de `Dog`, podemos intentar guardarla en la base de datos al llamar el método `#save` sobre la instancia. Esto genera el siguiente query:

  `INSERT INTO "dogs" ("name", ...) VALUES (?, ...)  [["name", "Bear"], ...]`

  El método `#save` devuelve `true` si el registro fue creado con éxito o `false` si no.

- `Dog.count`

  Ahora tenemos 4 perros. Los 3 iniciales y Bear.

- `Dog.create(name: "Max")`

  Aveces queremos instanciar el objeto y guardarlo en la base de datos al mismo tiempo. Para eso esta `::create`.

  `::create` va a crear el objeto, assignar atributos, e intentar guardar el registro en la base de datos. Mientras que `#save` devuelve true/false, `::create` es mas sutil. `::create` siempre va a devolver el objeto instanciado. Si el `save` fue exitoso el objeto tendrá un valor para el atributo `id`, si no fue exitoso el valor del `id` sera `nil`.

- `Dog.count`

  Ahora tenemos 5 perros.

- `Dog.create [{name: "Toot"}, {name: "Cosmo"}]`

  Si pasamos un array a create podemos crear muchos perros al tiempo.


### Paso 1: `find_or_initialize_by` and `find_or_create_by`

Algunas veces no estamos seguros si el registro ya existe en la base de datos. Por ejemplo, ya hay un perro llamado Ozu con x numero de licencia? Hay algunos métodos que nos permiten mirar en la base de datos para ver si existe y devolverlo y si no crearlo.

- `Dog.pluck(:name)`

  Aca vamos a ver todos los nombres de los perros en nuestra base de datos. Nota que el nombre `Ozu` ya esta ahi.

- `Dog.find_or_initialize_by(name: "Ozu", license: "OH-9384764")`

  Acá queremos retornar un `Dog` con el nombre `ozu` y numero de licencia `"OH-9384764"` si tal registro existe en la base de datos. Podemos ver que active record ejecuta el siguiente SQL:

  `SELECT  "dogs".* FROM "dogs"  WHERE "dogs"."name" = 'Ozu' AND "dogs"."license" = 'OH-9384764' LIMIT 1`

  En este caso, tal registro existe de modo que el método `::find_or_initialize_by` devuelve el objeto.

- `Dog.find_or_initialize_by(name: "Ozu", license: "MI-1234567")`

  En este caso, de nuevo estamos buscando un perro de nombre `Ozu`, pero esta vez con un numero de licencia diferente. El registro no es encontrado en la base de datos, de modo que Active Record instancia un nuevo `Dog` y le asigna los atributos. Pero como `::new`, `::find_or_initialize_by` no intenta guardarlo en la base de datos, podemos ver que el atributo `id` tiene valor `nil`. Tenemos que llamar `#save` para guardarlo.

- `Dog.find_or_create_by(name: "Taj", license: "OH-9084736")`

  `::find_or_create_by` es igual a  `::find_or_initialize_by`, con la diferencia que si no encuentra el registro lo crea de una vez en la base de datos.
