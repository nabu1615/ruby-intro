# Active Record Editando tablas

## Resumen

![Database Schema](schema_design_new.png)

*Figura 2.*  Nuevo esquema

Tenemos que hacer cambios al esquema de nuestra base de datos que creamos en le reto anterior. Los cambios son los siguientes:

- En la tabla `ratings`, la columna `rater_id` ahora se llama `judge_id`.
- En la tabla `dogs`, la columna `weight` ya no existe.
- En la tabla `dogs`, la columna `breed` a sido añadida.

```ruby
class RemoveWeightFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :weight
  end
end
```

*Figura 2.*  Migración para quitar la columna `weight` de la tabla `dogs`.

En este tendrás que escribir las migraciones para hacer los cambios que pedimos.

## Pasos

### Paso 0: Configura el esquema anterior

1. Desde la terminal, ejecuta `bundle install`.

2. Crear la base de datos con `bundle exec rake db:create`.

3. Corre las migraciones `bundle exec rake db:migrate`. Estas migraciones nos dejan con el esquema anterior que toca arreglar.

4. Corre las pruebas `bundle exec rake spec`. Estas están actualizadas para mirar el nuevo esquema. De modo que algunas deberían fallar.

### Paso 1:  Actualiza el esquema

Para completar el reto, tendrás que escribir nuevas migraciones que alteren la base de datos. Puede encontrar pistas acá [RailsGuides](http://guides.rubyonrails.org/migrations.html)
