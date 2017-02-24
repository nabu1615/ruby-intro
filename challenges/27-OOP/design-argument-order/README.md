# Un mejor diseño para argumentos

##Resumen

Cuando un metodo empieza a tener mas de 2 parametros, puede ser dificil acoirdarse el orden en que hay que pasarlos.

Cuando un metodo espera que los argumetos le lleguen en cierto order, esto crea un `dependencia`. El resto de tu codigo ahora debe saber como es este orden y eso lo vuelve fragil. Que pasa si quieres añadir o quitar un parametro, ahora tienes que encontrar todos los lugares en donde se invocaba elmetodo y cambiar sus argumentos.

Una buena solucion de diseño para este problema es usar `named arguments` . En ruby estos los podemos implementar al pasar un hash como argumento usando las llaves del hash como los nombres de los argumentos.

```ruby
def make_a_speech(components = {})
  introduction = components[:introduction]
  inappropriate_anecdote = components[:inappropriate_anecdote]
  long_winded_moralizing = components[:long_winded_moralizing]
  conclusion = components[:conclusion]
end
```

##Pasos

###Paso 0 : Usa named arguments

Dale una mirada al codigo del metodo `House#initialize`. Oh, cuantos parametros tiene!.

Haz un refactor de este metodo para que acepte named arguments.

**Manejando valores por defecto**

Algunos de los parametros definidos anteriormente tienen valores por defecto. Asugurate que tu diseño acomode este requerimiento.

###Paso 1 : Pilas con los booleanos

Que pasa cuando pasas un booleano o `nil` como valor del argumento? mira este ejemplo:

```ruby
class Car
  attr_reader :headlights, :gear

  def start_car(options = {})
    @headlights = options[:headlights] || true
    @gear       = options[:gear] || 1
  end
end

herbie = Car.new

# Cuando prendemos el carro las luces estan prendidas por defecto.
herbie.start_car
herbie.headlights # => true

# Pero que pasa cuando queremos prender el carro con las luces apagadas?
herbie.start_car(headlights: false)
herbie.headlights # => true  QUEEE?!
```

La forma de solucionar este problema es usar `Hash#fetch`. Lee este post de [Avdi Grim](http://devblog.avdi.org/2009/03/16/go-fetch/) y luego haz un refactor de tu codigo para que use `fetch` en vez de `Hash#[] || <default>`.
