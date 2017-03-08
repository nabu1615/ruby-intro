
require_relative 'ship'

class Carrier < Ship
  include Sinkable

  def initialize(name)
    super
    @size = 5
  end

  def increase_hit_count
    super
    @hits += 2
  end


end
