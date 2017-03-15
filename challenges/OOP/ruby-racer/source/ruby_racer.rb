require_relative 'racer_utils'

class RubyRacer
  attr_reader :players, :length, :winner
  attr_accessor :track1, :track2

  def initialize(players, length = 30)
    @die = Die.new
    @players = players
    @length = length
    @track1 = create_track(@players[0])
    @track2 = create_track(@players[1])
    @winner = nil
  end

  def create_track(player)
    track = Array.new(@length) {"|"}
    track[0] = player
    track
  end

  # Devuelve true si uno de los jugadores llego a la meta, falso de lo contrario
  def finished?
    if @track1.index(@players[0]) >= @length
      true
    elsif @track2.index(@players[1]) >= @length
      true
    end
  end

  # Retorna el ganador si hay uno, nil de lo contrario
  def winner
    if @track1.index(@players[0]) == @track2.index(@players[1])
      @winner = @players[0] + ", " + @players[1]

    elsif @track1.index(@players[0]) >= @length
      @winner = @players[0]

    elsif @track2.index(@players[1]) >= @length
      @winner = @players[1]
    else
      nil
    end
  end

  # Rueda el dado y avanza la posicion del jugador respectivo
  def advance_player!(player)
    @track1 = @track1.insert(@die.roll + @track1.index(@players[0]), @track1.delete_at(@track1.index(@players[0])))
    @track2 = @track2.insert(@die.roll + @track2.index(@players[1]), @track2.delete_at(@track2.index(@players[1])))
  end

end
