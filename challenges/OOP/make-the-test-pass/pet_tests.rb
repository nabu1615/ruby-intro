require_relative "./pet"
require_relative "./assert"

########################################################
# - No edites el codigo debajo de esta linea
# - Edita el codigo de las clases para hacer que las pruebas funcionen
# - Es posible que tengas que agregar un poco de driver code tambien.

fido = Dog.new
assert_equal(fido.class, Dog)

# el perro puede caminar y se acuerda que camino
assert_false(fido.walked?)
assert_equal(fido.walk!, "happy dog.")
assert(fido.walked?)

# con el paso del tiempo necesita volver a caminar
fido.passage_of_time
assert_false(fido.walked?)

# el perro puede comer y se acuerda que comio
assert_false(fido.fed?)
assert(fido.eat!)
assert(fido.fed?)

# con el paso del tiempo necesita volver a comer
fido.passage_of_time
assert_false(fido.fed?)

# el perro puede hablar
assert_equal(fido.speak!, "woof!")

precious = Cat.new
assert_equal(precious.class, Cat)

# el gato puede estirarse y se acuerda que se estiro
assert_false(precious.stretched?)
assert_equal(precious.stretch!, "happy cat.")
assert(precious.stretched?)

# con el tiempo necesita estirarse mas
precious.passage_of_time
assert_false(precious.stretched?)

# el gato puede comer
assert(precious.eat!)
assert_equal(precious.speak!, "meow.")

owner = Person.new
assert_equal(owner.class, Person)

# las personas pueden tener mascotas
assert_empty(owner.pets) # = []
assert(owner.pets << fido)
assert_equal(owner.pets.length, 1)

assert(owner.pets << precious)
assert_equal(owner.pets.length, 2)

assert(owner.pets.include? fido)
assert(owner.pets.include? precious)

fido.passage_of_time
assert_false(fido.walked?)

assert(owner.walk(fido))
assert(fido.walked?)

precious.passage_of_time
assert_false(precious.fed?)

assert(owner.feed(precious))
assert(precious.fed?)

# las mascotas pueden hacer trucos
assert(owner.showoff_pet_tricks)
