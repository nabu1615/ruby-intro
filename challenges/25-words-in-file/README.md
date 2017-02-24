# Palabras en archivo

##Competencias a aprender

* Saber leer la documentacion de Ruby
* Saber usar estructuras de datos
* Usar expresiones regulares

##Resumen

Como ya sabes puedes usar ruby para leer y escribir archivos.

En este reto, vas a leer un archivo y `parsearlo` en ruby de forma que puedas imprimir datos sobre el contenido del mismo.

Este reto esta inspirado en [este ejercicio](http://programmingpraxis.com/2009/03/10/word-frequencies/) de [Programming Praxis](http://programmingpraxis.com/).

##Pasos

###Paso 0 : Parsear el archivo

Escribe un metodo que reciba un `filename` y `n` como parametros. Este metodo debe imprimir las `n` palabras mas comunes en el archivo y el numero de ocurrencias de cada una en orden decendente.

El archivo para que pruebes este metodo esta incluido en esta carpeta. Se llama `source.txt`.

Ejemplo de como debe funcionar:

```ruby
most_common_words('some_file.txt', 3) # imprime:
> 'apples': 18 occurrences
> 'oranges': 13 occurrences
> 'melons': 9 occurrences
```

###Paso 1 : Agregale un filtro

Te daras cuenta que los resultados suelen incluir palabras como `a`, `the`, `and`, etc.

Reescribe tu programa para que filtre todo el ruido, de modo que los resultados si pinten una idea clara de los datos del archivo, de modo que solo cuente palabras `no-triviales` como verbos y sustantivos.
