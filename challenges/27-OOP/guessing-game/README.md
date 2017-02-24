# Un juego de adivinar

## Resumen

En este reto vas a crear un juego de adivinar. Piensa en terminos de cuando tenias 7 años y le preguntabas a tus amigos que adivinaran el numero que estabas pensando.

Deberas crear la clase `GuessingGame`, la cual a crear una instancia de esta la inicializa con una varible de instancia `answer` la cual tiene un integer como valor.

Define un metodo de instacia `GuessingGame#guess` el cual reciba un integer llamado `guess` como input. `guess` debe devolver un simbolo `:high` si el `guess` es mas grande que `answer`, `:correct` si `guess` es igual a `answer` y `:low` si `guess` es mas bajo que `answer`.

Defien un metodo de instancia `GuessingGame#solved?` el cual devuelva `true` si el `guess` mas reciente es correcto o `false` de lo contrario.

Por ejemplo:

```ruby
game = GuessingGame.new(10)

game.solved?   # => false

game.guess(5)  # => :low
game.guess(20) # => :high
game.solved?   # => false

game.guess(10) # => :correct
game.solved?   # => true
```

O

```ruby
game = GuessingGame.new rand(100)
last_guess  = nil
last_result = nil

until game.solved?
  unless last_guess.nil?
    puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
    puts ""
  end

  print "Enter your guess: "
  last_guess  = gets.chomp.to_i
  last_result = game.guess(last_guess)
end

puts "#{last_guess} es correcto!"
```

## Paso 0: Pseudocodigo

## Paso 1: Solucion Inicial

## Paso 2: Corre las pruebas
Una vez todas las pruenas pasen, haz un refactor.

## Paso 3: Refactor
Asegurate que las pruebas sigan funcionando.
