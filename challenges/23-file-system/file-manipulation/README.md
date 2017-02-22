# Ruby File System

## Resumen

Como todos los lenguajes de Back-End Ruby viene con un modulo para poder interactuar con el sistema de archivos de nuestro computador o servidor. Esto quiere decir que podemos leer, crear y editar archivos y carpetas de forma programatica.

Existen varias clases que nos ayudan a manipular archivos pero la principales`File`.

### Paso 1: Leer Archivos dentro de Carpetas

En este paso deberas hacer una combinacion de los metodos:

- readdir
- readFile

Tu objetivo es leer todos los archivos de primer nivel de la carpeta `testFiles`. Esto quiere decir que no debes leer los archivos que se encuentren dentro de `nestedDirectory`

el programa debe imprimir los contenidos de cada archivo en la terminal, lo que quires decir que deberias ver la historia de Javascript y de KeyboardCat en tu terminal.

### Paso 2: Crear archivos

En este paso deberas crear un programa que le permita al usuario crear un archivo con contenido.

EL objetivo es que un usuario pueda hacer lo siguiente desde la terminal:

```bash

$ ruby write_file.rb --phrase 'hola como estas'
```

el ejecutar este comando la frase `'hola como estas' ` deberia quedar escrita dentro del archivo `soy_nuevo.md` dentro de la carpeta `nestedDirectory`, el cual como puedes inferir por el nombre es un archivo que va a crear el metodo `write_file`.

Utiliza el codigo del reto `ARGV` para ayudarte.
