# Valida una tarjeta de credito

## Resumen

Debes crear un clase que dado un numero de una tarjeta de credito, debes valide si este es valido o no usando el [Algoritmo de Luhn](http://en.wikipedia.org/wiki/Luhn_algorithm).

La palabra [algoritmo](http://en.wikipedia.org/wiki/Algorithm) es intimidante, pero lo puedes simplemente como una serie de pasos que se usan para solucionar un problema. Un ejemplo de un algortimo:

>1. Hierve agua
>2. Agrega pasta
>3. Si ya esta lista, cuelala

Si seguimos estos pasos terminamos con pasta lista para comer.

Para este reto, vamos a necesitar romper un algoritmo en los siguientes pasos:

1. Dobla un numero si y otro no, empezando desde el penultimo, hasta llegar al primer digito.

2. Suma todos los digitos que no modificaste con los que doblaste. (Si hay un numero de 2 digitos tienes que partirlo. 10 se compierte en 1 + 0)

3. Si el total de la suma es un multiplo de 10, el numero de la tarjeta de credito es valido!

Es posible que cada paso se convierta en su propio metodo.


Ejemplo:
```ruby
Numero dado: 4563 9601 2200 1999
Original: 4   5   6   3   9   6   0   1   2   2   0   0   1   9   9   9
Paso 1: 8   5  12   3  18   6   0   1   4   2   0   0   2   9  18   9
Paso 2: 8 + 5 + 1 + 2 + 3 + 1 + 8 + 6 + 0 + 1 + 4 + 2 + 0 + 0 +2+ 9 + 1 + 8 + 9
Paso 3: 70 (total above) % 10 == 0
Paso 4: Ganancia
```

Tu clase debe devolver `true` o `false` cuando llamamos el metodo `#check_card`. La instancia debe ser inicializada con un numero de tarjeta de credito que sea exacto de 16 digitos de los contrario tienes que lanzar un `ArgumentError`.

## Paso 0: Pseudocodigo

## Paso 1: Solucion Inicial

## Paso 2: Corre las pruebas
Una vez todas las pruenas pasen, haz un refactor.

## Paso 3: Refactor
Asegurate que las pruebas sigan funcionando.
