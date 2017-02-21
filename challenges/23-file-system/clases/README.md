# Clases para manipular el sistema de archivos.

## Resumen

Ruby viene con una serie de Clases las cuales podemos acceder en cualquier parte de nuestras aplicaciones. Estas Clases nos proveen informacion relevante al entorno de nuestra aplicacion y nos dejan moldear la aplicacion dependiendo de sus valores.

En esta serie de retos vamos a mirar las clasees mas importantes que vienen con Ruby y como las podemos aprovechar.

Para cada paso escribe la respuesta correspondiente en el archivo que te indique. Luego corre tu el archivo en la terminal para verificar que este funcionando de forma adecuada.

### Paso 1: Pathname

[Docs](https://ruby-doc.org/stdlib-2.4.0/libdoc/pathname/rdoc/Pathname.html)

`Pathname` es una clase que representa el nombre del archivo o su ubicacion en el sistema pero no el archivo como tal. **Nota**: Esta clase funciona sin problemas en sistemas basados en UNIX, en otros sistemas el soporte es experimental de forma que es posible que ocurran problemas en Windows.

Tu reto es que el correr el archivo `filename.rb` este imprima en la consola un string que diga `"Hola mundo desde #{nombre-del-archivo}"` #{nombre-del-archivo} debe venir de usar los metodos de Pathname mas no de quemarla en el string.

### Paso 2: ARGV

`ARGV` es una constante global que nos da acceso a los argumentos que el usuario ingrese a la hora de correr un archivo o programa de ruby desde la terminal.

Eg: Cuando un usuario hace lo siguiente

``` bash
$ ruby app.rb hola --user juan
```

en este caso `ARGV` se convertiria en un array con los valores: `['hola','--user', 'juan']`

Tu reto es crear una aplicacion de terminal en el archivo `argv.rb` la cual podamos iniciar de esta forma:

``` bash
$ ruby argv.rb --user juan --greeting 'como estas?'
```

y que esta imprima en la terminal un string que diga:

"Hola #{user}, #{greeting}"
reemplazando los #{} por los valores de los flags `#{user}` y `#{greeting}`

En caso de el usuario no pase ambos flags con sus valores, la aplicacion debe imprimir un string que diga:

'Algo salio mal'
