# Active Record Creando tablas

## Resumen

![Database Schema](/schema_design.png)

*Figura 1.* Esquema para este reto.

En este reto vamos a crear una base de datos que siga el esquema de la figura 1. Hasta ahora hemos venido escribiendo el SQL para crear nuestras tablas. Ahora vamos a usar Active Record para crear y actualizar el esquema y Active record se va a encargar de escribir el SQL necesario.

Para hacer esto vamos a usar algo llamado migraciones. [Active Record migrations](http://guides.rubyonrails.org/migrations.html). Vamos a escribir una migración para cada cambio que le hagamos al esquema de la base de datos. Por ejemplo una migración para cada tabla que creemos. También haremos migraciones para crear nuevas columna o editar las que ya existen.

```SQL
CREATE TABLE dogs (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name VARCHAR
 license VARCHAR
 age INTEGER,
 weight INTEGER,
 owner_id INTEGER
 created_at DATETIME,
 updated_at DATETIME);
```

*Figura 2.* SQL para crear la tabla perros.

Para crear la tabla `dogs` de la figura 1 podemos usar el SQL de la figura 2. Pero ahora Active record va a hacer esto. Una migración para crear esta tabla se encuentra en el archivo `20140901164300_create_dogs.rb` dentro de la carpeta `db/migrate`. Este archivo contiene el siguiente código:

```ruby
class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string   :name
      t.string   :license
      t.integer  :age
      t.integer  :weight

      t.timestamps
    end
  end
end
```

*Figura 3.*  

Una migración es una clase de ruby que hereda de `ActiveRecord::Migration`. El nombre de la clase describe lo que hace la migración. Dentro de la clase definimos un método `change` que describe los cambios que tenemos que hacer. Acá podemos usar un método como [`create_table`](http://apidock.com/rails/ActiveRecord/ConnectionAdapters/SchemaStatements/create_table). A este método le pasamos el nombre de la tabla que queremos crear y un bloque que describe como queremos que se vea la tabla.

Algunas cosas para notar:

- El nombre de la migración empieza con el un `timestamp` con el formato YYYYMMDDHHMMSS: `20140901164300`. Es es importante dado que Active Record usa estas fechas para saber que migraciones ya corrió. Una migración solo se corre una vez.

- La segunda parte del nombre hace match con el nombre de la clase. `_create_dogs.rb` y `CreateDogs`.

- La clase hereda de ActiveRecord::Migration. lo cual nos da acceso a métodos como `create_table`, [`add_column`](http://apidock.com/rails/v4.0.2/ActiveRecord/ConnectionAdapters/SchemaStatements/add_column), etc.

- No ponemos una columna para `id`. El `id ` es creado automáticamente a menos que explicitamente le digamos lo contrario.   


## Pasos

### Paso 0: Crea la base de datos y corre las migraciones

Vamos a crear una base de datos y correr la migración que ya te dimos. La migración va a crear la tabla `dogs` en la base de datos. Las pruebas te pueden comprobar que todo quedo hecho correctamente.

Sigue estos pasos:

1. Desde la terminal, corre `bundle install` para asegurarte que todos los gems estén instalados.

2. Usa las tarea de Rake para crear la base de datos. `bundle exec rake db:create`.

3. Mira que las pruebas del esquema de `dogs` fallen antes de correr la migración. corre `bundle exec rspec spec/dogs_table_spec.rb`.

4. Corre las migraciones: `bundle exec rake db:migrate`.

5. Mira que las pruebas para la tabla `dogs` pasen vuelve a correr `bundle exec rspec spec/dogs_table_spec.rb`

### Paso 1:  Termina el esquema.

Para completar este reto, deberas escribir las migraciones que faltan para crear las dos tablas restantes.

Puedes correr las pruebas para ver que las de las tablas `people` y `ratings` fallan.

Escribe las migraciones para crear la tabla `people` con sus columnas. Luego corre la migración. Correr las pruebas de nuevo. Las pruebas para la tabla `people` deberían pasar si la migración quedo bien hecha. Si las pruebas fallan haz un rollback con la tarea `db:rollback`, para poder corregir la migración y correr las pruebas de nuevo. 

Repite el proceso para la tabla `ratings`.
