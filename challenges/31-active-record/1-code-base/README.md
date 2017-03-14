Paso#Active Record Boilerplate

## Resumen

En este reto vamos a presentar el boilerplate con el que vamos a estar trabajando para familiarizarnos con Active Record. Antes de empezar a hacer los retos, tenemos que conocer bien como funciona este boilerplate. Este código es muy parecido al código que vamos a estar usando cuando trabajemos con Sinatra y Rails.

### `config/environment.rb`

Este archivo configura el entorno en el que corre la aplicación. Este archivo requiere todos los gems y librerías de Ruby que  vamos a estar usando. Por otro lado carga todos nuestro modelos y configura la conexión con la base de datos.  

### `Rakefile`

El `Rakefile`, nos provee con una serie te tareas ejecutables para poder poner a andar nuestra aplicación.

Estas son las tareas disponibles:

- `:spec`

  La tarea `spec` corre todas las pruebas que están definidas en nuestra aplicación.

- `:console`

  La tarea `console` abre una session de IRB con el entorno de nuestra aplicación cargado. Los modelos quedan disponibles acá, la conexión con la base de datos esta establecida etc.

- `:db`

  El `Rakefile` incluye un `namespace` (`:db`) para tareas relacionadas con la base de datos tales como `create`, `drop`, `migrate`, `rollback`, `seed` y `version`.

### `app/models/`

Todas las clases de nuestros modelos viven acá. Cada clase debe estar definida en su propio archivo. Como ejemplo hemos incluido la clase `Dog`. No todas las clases acá tiene que heredar de `ActiveRecord::Base`, pueden ser clases de ruby normales.

### `db/`

En la carpeta `db/` es donde están los archivos relacionados con la base de datos. Como tal el archivo de Sqlite3 que es la base de datos esta acá.

- `db/migrate/`

  Todas las migraciones que escribamos van a estar en esta carpeta. Cada migración expresa un cambio al esquema de la base de datos. La tarea `db:migrate` le dice a `ActiveRecord::Migrator` que debe buscar en esta carpeta las migraciones. Cuando corremos esta tarea Active Record va a buscar acá las migraciones que todavía no se han corrido y va a actualizar la base de datos corriendo esas migraciones.

  Puede encontrar un ejemplo de una migración en el archivo `20140901164300_create_dogs.rb`. Esta migración crea la tabla dogs en la base de datos.

- `db/seeds.rb`

  Cuando queremos llenar nuestra base de datos con registros, escribimos el código necesario en este archivo. Al correr la tarea `rake db:seed` esta ejecutara este código. Hemos incluido un ejemplo para la crear algunos perros.

### `spec/`

Todas nuestras pruebas viven dentro de esta carpeta. Las podemos correr usando la tarea `spec`. Hemos creado un ejemplo en el archivo `dogs_table_spec.rb`

### `.rspec`

Configuración de este gem.

### `Gemfile & Gemfile.lock`

El `Gemfile` y el `Gemfile.lock` son archivos que especifican los gems que vamos a usar en nuestra aplicación. Bundler va a usar estos archivos para instalar los gems necesarios que necesitemos en nuestro sistema.

## Pasos

### Paso 0:  Practica usando este boilerplate

Sigue estos pasos para tomar experiencia usando tareas de Rake, la consola y bundler.

##### 1. Instala los Gems

-  Desde la terminal corre el comando: `bundle install`.

  Este comando va a instalar todos los gems necesarios que hagan falta en tu sistema.

  Para correr este comando es necesario tener instalado Bundler en tu sistema. si no lo tienes instalado corre el comando `gem install bundler`.

##### 2. Crea la base de datos

- Desde la terminal corre `bundle exec rake db:create`.

  Esto ejecuta la tarea `create` dentro de `db`. La cual va a crear una base de datos dentro de la carpeta `db/`. Al poner `bundle exec` especificamos que solo se usen las versiones de los gems que tenemos en el gemfile.

##### 3. Version de la base de datos

- Desde la terminal ejecuta `bundle exec rake db:version`.

  Este comando la tarea `version` dentro de `db`. En nuestro caso como no hemos hecho ninguna migración por lo cual deberíamos ver `Current version: 0`.

##### 4. Corre las pruebas

- Desde la terminal corre `bundle exec rake spec`.

  Esto ejecuta la tarea `spec` la cual corre nuestras pruebas. En este momento deberían fallar por que no tenemos la tabla de dogs.

##### 5. Migra la base de datos

-
-  Desde la terminal corre `bundle exec rake db:migrate`.

  Este comando corre todas las migraciones que todavía no hayan corrido.

##### 6. Revisa de nuevo la version

- Desde la terminal ejecuta `bundle exec rake db:version`.

  Active record va a mirar la tabla `schema_migrations` y buscar el timestamp de la ultima migración. Deberíamos ver en la consola lo siguiente: `Current version: 20140901164300`

##### 7. Corre las pruebas de nuevo

- Desde la terminal corre `bundle exec rake spec`.

  La migración que acabamos de correr hace que ahora todas las pruebas pasen.

##### 8. Popula la base de datos

- Desde la terminal corre `bundle exec rake db:seed`.

  Esta tarea corre el código dentro del archivo `db/seeds.rb`. El cual debería crear registros en la base de datos.

##### 9. Abre la consola

- Desde la terminal corre `bundle exec rake console`.

  Esta tarea, abre IRB con el entorno cargado. Acá podemos interactuar con nuestros modelos. Crear registros, borrarlos etc.

  Un ejemplo de lo que podemos hacer:

  -  `ActiveRecord::Base.connection.tables`

      Esto devuelve un array con los nombres de las tablas en nuestra base de datos.

  -  `ActiveRecord::Base.connection.columns(:dogs)`

      Esto devuelve un arreglo de objetos que representa las columnas de la tabla `dogs`. Los objetos son instancias de la clase `ActiveRecord::ConnectionAdapters::SQLite3Column`.

  -  `Dog`

      Esto devuelve la clase `Dog`, y podemos ver en paréntesis una lista de los atributos y types que están asociados con una instancia de `Dog`.

  - `Dog.all`

      `Dog::all` Es un método de clase que nos devuelve todos los registros dentro de la tabla `dogs` como instancias de la clase `Dog`. Las instancias están dentro de algo que se parece a un arreglo pero es en realidad un objeto de la clase `ActiveRecord::Relation` que se comporta como un arreglo.


##### 10. Rollback de la base de datos

- Desde la terminal corre `bundle exec rake db:rollback`.

  Esta tarea deshace los cambios hechos por la ultima migración.

##### 11. Tumba la base de datos

- Desde la terminal corre  `bundle exec rake db:drop`.

  Esta tarea borra la base de datos.
