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
  attr_accessor :id, :name, :age, :weight

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @age = args[:age]
    @weight = args[:weight]
  end

  def self.all
    $db.execute("SELECT * FROM dogs;").map do |dog_data|
      ORM_Helper.symbolize_keys(dog_data)
      Dog.new(dog_data)
    end
  end

  def self.create(attributes)
    record = self.new(attributes)
    record.save

    record
  end

  def self.where(query, *args)
    $db.execute("SELECT * FROM dogs WHERE #{query}", *args).map do |row|
      ORM_Helper.symbolize_keys(row)
      Dog.new(row)
    end
  end

  def self.find(id)
    self.where('id = ?', id).first
  end

  def save
    if new_record?
      results = insert!
    else
      results = update!
    end
    results
  end


  def new_record?
    self.id.nil?
  end

  def update

  end

  private

  def insert!
    fields = %w(id name age weight)
    values = [self.id, self.name, self.age, self.weight]
    marks  = Array.new(fields.length) { '?' }.join(',')

    insert_sql = "INSERT INTO dogs (#{fields.join(',')}) VALUES (#{marks})"

    results = $db.execute(insert_sql, values)

    results
  end

  def update!
    self[:updated_at] = DateTime.now

    fields = %w(id name age weight)
    values = [self.id, self.name, self.age, self.weight]

    update_clause = fields.map { |field| "#{field} = ?" }.join(',')
    update_sql = "UPDATE students SET #{update_clause} WHERE id = ?"

    # We have to use the (potentially) old ID attribute in case the user has re-set it.
    $db.execute(update_sql, values, self.old_attributes[:id])
  end

end

# p Dog.all
# p Dog.find(1)
# dog2 = Dog.find(2)
p ozu = Dog.create(name: 'ozu', age: 6, weight: 14)
p Dog.where("name = ?", ozu.name)
