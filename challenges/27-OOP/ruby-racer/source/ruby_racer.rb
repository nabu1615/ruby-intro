require_relative 'racer_utils'

class RubyRacer
  attr_reader :players, :length

  def initialize(players, length = 30)
  end

  # Devuelve true si uno de los jugadores llego a la meta, falso de lo contrario
  def finished?
  end

  # Retorna el ganador si hay uno, nil de lo contrario
  def winner
  end

  # Rueda el dado y avanza la posicion del jugador respectivo
  def advance_player!(player)
  end

  # Imprime el tablero actual
  # El tablero siempre debe tener las mismas dimensiones
  # Debes imprimir encima del tablero anterior
  def print_board
  end
end

#=========== driver code ===========

players = ["A", "Z"]
game = RubyRacer.new(players)

# limpia la pantalla
clear_screen!

until game.finished?
  players.each do |player|
    # Mueve el cursor a la esquina derecha
    move_to_home!

    # imprimimos el tablero en su estado inicial
    game.print_board
    game.advance_player!(player)

    # tenemos que dormir un poquito, de lo contrario no vamos a ver nada del juego.
    # mira http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-sleep
    sleep(0.5)
  end
end

# El juego termino
game.print_board

puts "El jugador'#{game.winner}' ha ganado!"#
