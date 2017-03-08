class Car

  def initialize(brand, model, tires)
    @brand = brand
    @model = model
    @tires = tires
  end

  def chance_of_damage
    (rand * 100).ceil
  end

  def move
    puts 'Cruising'
    if chance_of_damage > 50
      hit_bump
      puts 'Miercoles'
    end
  end

  def hit_bump
    @tires.each do |tire|
      if chance_of_damage > 65
        tire.damaged_tire
      end
    end
  end

  def able_to_move?
    status = @tires.reduce(true) do |memo, tire|
      memo = false if tire.flat?
      memo
    end
    print_status(status)
  end

  def print_status(status)
    status ? 'Todo bien' : 'Nos pinchamoss'
  end

end


class Tire

  attr_accessor :size, :quality

  def initialize(size, quality)
    @size = size
    @quality = quality
    @price = 0
    @flat = false
  end

  def flat?
    @flat
  end

  def damaged_tire
    @flat = true
  end

  def quality_price_weight
     quality_weight = {
        premium: 2.5,
        good: 1.5,
        average: 1
     }
     quality_weight[@quality]
  end

  def size_to_price
    price_chart = {
      big: 2000,
      medium: 1000,
      small: 500
    }
    price_chart[@size]
  end

  def calculate_price
    quality_price_weight * size_to_price
  end
end

tires = []
4.times do
  tires << Tire.new(:medium, :good)
end


car = Car.new('mazda', 1900, tires)
car.move
p car.able_to_move?
car.move
p car.able_to_move?
