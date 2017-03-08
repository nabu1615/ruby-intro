class Ship
  include Sinkable

fsdfsdfsf
  def initialize
    @hits = 0
  end

  def increase_hit_count
    @hits += 1
  end
end

module Sinkable
  def sunk?
    @hits >= @size
  end


end
