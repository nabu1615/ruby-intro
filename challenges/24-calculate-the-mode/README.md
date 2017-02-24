# Calcula la Moda

## Competencias a aprender
- Rompe un problema en pequeños pedazos
- Implementa un metodo basado en pseudocodigo
- Itera por estructuras para manipular datos
- Determina cuando usar un Array o un Hash

## Resumen:

Escribe un metodo `mode` el cual reciba como argumento un `array` de numeros o strings como su input. Este debe devolver un `array` con los valores mas frequentes.

Si solo hay 1 valor que sea el mas frecuente, el metodo devuelve un `array` de un solo elemento.

Por Ejemplo:

```ruby
mode([1,2,3,3])         # => [3]
mode([4.5, 0, 0])       # => [0]
mode([1.5, -1, 1, 1.5]) # => [1.5]
mode([1,1,2,2])         # => [1,2]
mode([1,2,3])           # => [1,2,3], por que todos ocurren con la misma frecuencia
mode(["who", "what", "where", "who"]) # => "who"
```
Pista: Es posible que quieras usar un hash [`Hash`](http://ruby-doc.org/core-2.4.0/Hash.html).
