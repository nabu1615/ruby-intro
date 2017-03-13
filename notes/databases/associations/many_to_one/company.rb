require 'sqlite3'
require 'faker'

$db = SQLite3::Database.new 'company.db'

10.times do |i|
  customer = [Faker::Name.name, Faker::Name.name, Faker::Internet.email, Faker::Address.street_address, Faker::Address.city, Faker::Address.state, Faker::Address.zip]

  order = [Time.at(rand * Time.now.to_i).strftime("%F %T"), rand(200..300), rand(8) + 1]

  $db.execute('insert into customers (first_name, last_name, email, address, city, state, zip) values (?,?,?,?,?,?,?)', customer)
  $db.execute('insert into orders (order_date, order_amount, customer_id) values (?,?,?)', order)
end


puts $db.execute('select count(*) from customers')
puts $db.execute('select count(*) from orders')


# inner join
<<-SQL
select *
from customers
join orders
on customers.id = orders.customer_id
SQL

# Left Joins
<<-SQL
select first_name, last_name, order_date, order_amount
from customers c
left join orders o
on c.customer_id = o.customer_id
SQL

# All customers that have not place an order
<<-SQL
select first_name, last_name, order_date, order_amount
from customers c
left join orders o
on c.customer_id = o.customer_id
where order_date is NULL
SQL

# Right joint
<<-SQL
select first_name, last_name, order_date, order_amount
from customers c
right join orders o
on c.customer_id = o.customer_id
SQL

# Orders with no customer
<<-SQL
select first_name, last_name, order_date, order_amount
from customers c
right join orders o
on c.customer_id = o.customer_id
where first_name is NULL
SQL
