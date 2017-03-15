require 'sqlite3'
require 'faker'
require 'pry'

$db = SQLite3::Database.new("animal_shelter.db", results_as_hash: true)

$db.execute("drop table if exists dogs;")

$db.execute <<-SQL
CREATE TABLE dogs (
id integer primary key AUTOINCREMENT not null,
name VARCHAR(64),
age INTEGER,
weight INTEGER);
SQL

10.times do |i|
  dog = [Faker::Cat.name, rand(90) + 1, rand(15) + 1]
  $db.execute('insert into dogs (name, age, weight) values (?, ?, ?)', dog)
end
