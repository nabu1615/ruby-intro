require 'sqlite3'

$db = SQLite3::Database.new("result.db", results_as_hash: true)

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

  def self.find(id)
    found_dog = $db.execute("SELECT * from dogs WHERE id = ?", id)
    ORM_Helper.symbolize_keys(found_dog.first)
    dog = Dog.new(found_dog.first)
  end

  def self.create(hash)
    dog = Dog.new(hash)
    $db.execute('INSERT INTO dogs (name, age, weight) VALUES(?,?,?)', [hash[:name], hash[:age], hash[:weight]]) 
    dog.id = $db.last_insert_row_id
    dog
  end

  def self.where(query, name)
    $db.execute("SELECT * FROM dogs WHERE #{query}", name).map do |dog_data|
      ORM_Helper.symbolize_keys(dog_data)
      Dog.new(dog_data)
    end
  end
  attr_accessor :name, :id
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @age = args[:age]
    @weight = args[:weight]
  end
end





# Driver code ### Esto deberia funcionar

#p Dog.all
#p Dog.find(1)
#dog2 = Dog.find(2)
#p ozu2 = Dog.create(name: 'pepito2', age: 6, weight: 14)
p ozu = Dog.create(name: 'pepito2', age: 6, weight: 14)
p Dog.where("name = ?", ozu.name)

