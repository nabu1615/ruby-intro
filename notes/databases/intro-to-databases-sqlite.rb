require 'pry'
# ---------------------------------------
# ---------------------------------------
# Introduccion:
#
# En este archivo esta todo lo que ncesitas para crear, configurar y usar una base de datos usando sqlite3.

# ---------------------------------------

# Primero escojemos el nombre que le queremos dar a nuestra base de datos. Las bases de datos de sqlite3 viven en un archivo. Este va a ser el nombre de ese archivo.
DATABASE_NAME = 'first-sqlite-database'

# Requerimos el gem salite3. para que esto funcione tienes que instalarlo `gem install sqlite3`.
require 'sqlite3'

# Este es un gem para generar datos falsos.
require 'faker'


# Aca creamos la coneccion con la base de datos
# Este comando crea el archivo de la base de datos en la carpeta donde se encuentre este archivo.
db_connection = SQLite3::Database.new "#{DATABASE_NAME}.db"
# the following warning message comes up when you run this script.
# if you want to avoid it, uncomment this single following line:

# I18n.enforce_available_locales = false #



#Ahora vamos a usar los metodos que nos provee la gema de sqlite para interactuar con la base de datos.


# ---------------------------------------
# cleanup (esto borra la base de datos)
# ---------------------------------------

db_connection.execute("drop table if exists students;")

# ---------------------------------------
# creamos la tabla que vamos a usar
# ---------------------------------------

# Aca estamos usando un 'heredoc' la palabra SQL es solo para que el editor sepa que syntaxis usar.
db_connection.execute(<<-SQL
  create table students
  (
    lastname  varchar(255),
    firstname varchar(255),
    cohort    varchar(255),
    week     int
  );
  SQL
)

# ---------------------------------------
# INSERT
# ---------------------------------------
puts "-"*50
print "inserting some data ... "

db_connection.execute(<<-SQL
  insert into students
  values ('german', 'escobar', 'Fence Lizard', 3);
  SQL
)

10.times do
  week = rand(12)

  data = Faker::Name.first_name, Faker::Name.last_name, Faker::Company.bs
  labels = %w[fname lname company]
  fake_data = Hash[labels.map(&:to_sym).zip data.map{|d| d.gsub("'", "''")}]

  # Otra forma de hacerlo,
  # fn, ln, co = Faker::Name.first_name.gsub("'", "''"),
  #              Faker::Name.last_name.gsub("'", "''"),
  #              Faker::Company.bs.gsub("'", "''")

  db_connection.execute(<<-SQL
    insert into students (lastname, firstname, cohort, week)
    values ('#{fake_data[:fname]}', '#{fake_data[:lname]}', '#{fake_data[:company]}', #{week});
  SQL
  )
end

puts "done."

# ---------------------------------------
# SELECT
# ---------------------------------------
puts "-"*50
print "selecting some data ... "


# sacar todo de la base de datos
results = db_connection.execute("select * from students;") # note that sometimes quotes are enough

puts "done."
puts "verifying selection ..."
puts

p results
# binding.pry
puts "and done. "

# ---------------------------------------
# UPDATE
# ---------------------------------------
puts "-"*50
print "updating some data ... "

name = 'homer'
# actualizar la tabla
db_connection.execute(<<-SQL
  update students
  set firstname = "#{name}", lastname = 'Simpson'
  where week <= 1;
  SQL
)

puts "done."
puts "verifying changes ..."
puts

# verificar que los datos se actualizaron
results = db_connection.execute("select * from students;")
p results

puts "and done."

# ---------------------------------------
# DELETE
# ---------------------------------------
puts "-"*50
print "deleting some data ... "

# actualizar la tabla
db_connection.execute(<<-SQL
  delete from students
  where week <= 1;
  SQL
)

puts "done."
puts "verifying changes ..."
puts

# verificar que los datos se actualizaron
p  db_connection.execute("select * from students;")

puts "and done."
