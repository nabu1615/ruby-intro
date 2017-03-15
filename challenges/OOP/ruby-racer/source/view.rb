require_relative 'racer_utils'

class View
  extend ConsoleHelper

  def self.print_board(track1, track2, last = false)
    puts '='*9 + 'Final Board'+ '='*10 if last
    puts track1.join ()
    puts track2.join ()
  end

  def self.print_winner(winner)
    puts "El jugador'#{winner}' ha ganado!"#
  end
end
