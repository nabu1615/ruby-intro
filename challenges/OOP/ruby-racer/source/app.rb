require_relative 'ruby_racer'
require_relative 'view'

class Game
  def initialize(players)
    @model = RubyRacer.new(players, length = 30)
  end

  def start_game
    View.clear_screen!
  end

  def take_turns
    until @model.finished?
      @model.players.each do |player|
        View.move_to_home!
        View.print_board(@model.track1, @model.track2)
        @model.advance_player!(player)
        sleep(0.1)
      end
    end
  end

  def end_game
    View.print_board(@model.track1, @model.track2, true)
    View.print_winner(@model.winner)
  end

  def run!
    start_game
    take_turns
    end_game
  end

end

#=========== driver code ===========
game = Game.new(["A", "Z"])
game.run!
