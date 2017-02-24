# require_relative 'racer_utils'

# class Player
#   attr_accessor :position, :name, :track

#   def initialize(name, number, length)
#     @position = 0
#     @name = name
#     @number = number
#     @track = Array.new(length, "|")
#   end
# end

# class RubyRacer
#   attr_reader :players, :length

#   def initialize(players, length = 30)
#     @players = players
#     @length = length
#     @player_1 = Player.new(players[0], 1, @length)
#     @player_2 = Player.new(players[1], 2, @length)
#     @players = [@player_1, @player_2]
#     @speed = Die.new
#   end

#   # Returns +true+ if one of the players has reached
#   # the finish line, +false+ otherwise
#   def finished?
#     if @player_1.position >= 30 || @player_2.position >= 30
#       true
#     else
#       false
#     end
#   end

#   # Returns the winner if there is one, +nil+ otherwise
#   def winner?
#     if finished?
#       champion = @player_1.position <=> @player_2.position
#       if champion == 1
#         return @player_1.name
#       elsif champion == -1
#         return @player_2.name
#       else
#         return "It's a tie!"
#       end
#     else
#       nil
#     end
#   end

#   # Rolls the dice and advances +player+ accordingly
#   def advance_player!(player)
#     player.track[player.position] = "|"
#     player.position += @speed.roll
#     player.track[player.position] = player.name
#     move!
#   end

#   def move!
#     clear_screen!
#     move_to_home!
#     puts @player_1.track.join(" ")
#     puts @player_2.track.join(" ")
#   end

#   def print_board
#     clear_screen!
#     move_to_home!
#     puts @player_1.track.insert(@player_1.position, @player_1.name).join(" ")
#     puts @player_2.track.insert(@player_2.position, @player_2.name).join(" ")
#   end

#   def run
#     start_player = @players.sample
#     current_player = nil
#     champion = winner?
#     until champion
#       advance_player!(start_player || current_player)
#       current_player = @players.reject {|player| player == start_player || player == current_player}.first
#       start_player = nil
#       champion = winner?
#       sleep 0.1
#     end
#     p champion
#   end

# end

# game = RubyRacer.new(['juan', 'carolina'])
# game.run

require_relative 'racer_utils'

class Player
  attr_accessor :position, :name

  def initialize(name)
    @position = 0
    @name = name
  end
end

class RubyRacer < Player
  attr_reader :players, :length

  def initialize(players, length = 30)
    @players = players
    @length = length
    @player_1 = Player.new(players[0])
    @player_2 = Player.new(players[1])
    @players = [@player_1, @player_2]
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    if @player_1.position >= 30 || @player_2.position >= 30
      true
    else
      false
    end
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    if finished?
      champion = @player_1.position <=> @player_2.position
      if champion == 1
        return @player_1.name
      elsif champion == -1
        return @player_2.name
      else
        return "It's a tie!"
      end
    else
      nil
    end
  end

  # Rolls the dice and advances +player+ accordingly
  def advance_player!(player)
    die = Die.new
    @players.each do |racer|
      if racer.name == player
        racer.position += die.roll
      end
    end
  end

  # Prints the current game board
  # The board should have the same dimensions each time
  # and you should print over the previous board
  def print_board
    clear_screen!
    move_to_home!
    track_1 = Array.new(@length, "|")
    track_2 = Array.new(@length, "|")
    puts track_1.insert(@player_1.position, @player_1.name).join(" ")
    puts track_2.insert(@player_2.position, @player_2.name).join(" ")
  end
end
