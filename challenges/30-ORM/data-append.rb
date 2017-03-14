require 'sqlite3'
require 'faker'

#open
$db = SQLite3::Database.new 'result.db'

$db.execute("drop table if exists dogs;")

$db.execute(<<-SQL
create table dogs(
	id integer primary key AUTOINCREMENT not null,
	name varchar(50) not null,
	age integer,
	weight integer
)
SQL
)

20.times do |item|
	dog = [Faker::Name.first_name, rand(20) + 1, rand(10) + 1]
	$db.execute('insert into dogs (name, age, weight) values (?, ?, ?)', dog)
end