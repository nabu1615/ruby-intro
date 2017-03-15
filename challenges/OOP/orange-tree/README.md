# Arbol de Naranjas

##Resumen

Vamos a crear un pequeño programa que modele un arbol de naranjas creciendo atravez de los años. Plantamos el arbol, esperamos que llegue a su edad de dar frutos, y luego podemos ir recogiendo naranjas de el.

Nuestro programa deberia funcionar al correrlo con el siguiente codigo:

```ruby
tree = OrangeTree.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = # It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"
```

##Pasos

###Paso 0 : Implementa la clase OrangeTree y Orange

Usa, `attr_reader`, `attr_writer` y/o `attr_accessor` para que podamos llamar `tree.height` y `tree.age` para obtener la la altura y edad del arbol respectivamente. Cual de los 3 metodos de `attr` deberias estar usando y por que ?

Haz lo mismo con la clase `Orange` de modo que podamos llamar `orange.diameter` para obtener el diametro de la naranja.

#### Implementa el envejecimiento

Cuando un arbol crece, este se vuelve mas alto. Eventualmente el arbol va a llegar a su edad de dar frutos y va a para de crecer, no necesariamente al mismo tiempo. Algunos años despues el arbol muere y no puede dar mas frutos.

Implementa el metodo de instancia `OrangeTree#age!`, el cual va a envejecer tu arbol en 1 año. Cada año que pasa el arbol deberia volverse un poco mas alto, y eventualmente dejar de crecer. Tu puedes decidir a que edad deja de crecer.

Mas tarde, el arbol deberia morir. Para este punto la clase `OrangeTree` deberia tener:

1. Un metodo `OrangeTree#height` que devuelve la altura actual del arbol
2. Un metodo `OrangeTree#age` el cual devuelve la edad actual del arbol.
3. Un metodo `OrangeTree#age!` que envejece el arbol en 1 año, crece la altura del arbol un poco si este todavia es capaz de crecer.
4. Un metodo `OrangeTree#dead?` que devuelve `true` si el arbol murio.

#### Implementa recoger naranjas

Despues de cierta cantidad de años &mdash; tu decides &mdash; el arbol de naranjas empieza a dar frutos. Escribe un metodo `OrangeTree#any_oranges?` el cual devuelve `true` si hay alguna naranja en el arbol o `false` de lo contrario.

Tambien escribe un metodo `OrangeTree#pick_an_orange!` el cual devuelve una de las naranjas que esten en el arbol (una instancia de la clase `Orange`). Si intentas recoger una naranja cuando no hay ninguna, tu codigo debera levantar un `NoOrangesError`.

Tambien tienes que implementar la clase `Orange` en este punto, incluyedo `Orange.new` y `Orange#diameter`.

#### Corre el script?

Corre el codigo que te dimos arriba e imprime lo que esperabas?

Si no, en donde esta el error o el comportamiento inesperado.
