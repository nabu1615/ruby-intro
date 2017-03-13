require 'sqlite3'
require 'faker'

# Open a database
$db = SQLite3::Database.new "school.db"

puts $db.execute('select * from students')

students = []

10.times do |i|
  student = [Faker::Name.name, rand(90) + 1, rand(10) + 1]
  $db.execute('insert into students (name, age, cohort_id) values (?, ?, ?)', student)
end


student_count = $db.execute('select count(*) from students')

puts $db.execute('select * from students')




















# SELECT students.name, cohorts.name
# FROM students
# INNER JOIN cohorts
# ON students.id_cohort = cohorts.id
#
#
#
# require 'sqlite3'
# require 'faker'
# # Open a database
# $db = SQLite3::Database.new "school.db"
#
# students = []
#
# puts $db.execute('select count(*) from students')
#
#
# 10.times do |i|
#   students << [Faker::Name.name, rand(90) + 1, Faker::Name.name ,rand(10) + 1]
#   $db.execute('INSERT INTO students (name, age, last_name, id_cohort)
#               VALUES (?, ?, ?, ?)', students[i])
#   $db.execute('INSERT INTO cohorts (name)
#               VALUES (?)', Faker::Pokemon.name)
# end
#
#
# puts $db.execute('select count(*) from students')
