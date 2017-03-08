class BattleShip < Ship

  def initialize
    @length = 4
    @hits = 0
  end

  def increase_hit_count
    @hits += 1
  end

  def sunk?
    @hits >= @length
  end
end

class Carrier < Ship

  def initialize
    @length = 5
    @hits = 0
  end

  def increase_hit_count
    @hits += 1
  end

  def sunk?
    @hits >= @length
  end
end





























class BattleShip < Ship

  def initialize
    @size = 4
  end
end

class Carrier
  def initialize
    @size = 5
    @hits = 0
  end

  def increase_hit_count
    @hits += 1
  end

  def sunk
    @hits >= @size
  end
end

module Sinkable
end

class Ship
end
