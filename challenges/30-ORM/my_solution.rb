require 'sqlite3'

$db = SQLite3::Database.new("animal_shelter.db", results_as_hash: true)

module ORM_Helper
  def self.symbolize_keys(hash)
    hash.keys.each do |key|
      hash[(key.to_sym rescue key) || key] = hash.delete(key)
    end
  end
end

class Dog
  include ORM_Helper
  
  def self.all
    $db.execute("SELECT * FROM dogs;").map do |dog_data|
      ORM_Helper.symbolize_keys(dog_data)
      Dog.new(dog_data)
    end
  end

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @age = args[:age]
    @weight = args[:weight]
  end
end





# Driver code ### Esto deberia funcionar

p Dog.all
p Dog.find(1)
dog2 = Dog.find(2)
ozu = Dog.create(name: 'ozu', age: 6, weight: 14)
p Dog.where("name = ?", ozu.name)
