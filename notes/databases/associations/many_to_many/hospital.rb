require 'sqlite3'
require 'faker'

$db = SQLite3::Database.new 'hospital.db'

# $db.execute("drop table if exists doctors;")
# $db.execute("drop table if exists patients;")
# $db.execute("drop table if exists appointments;")

10.times do |i|
  doctor = [Faker::Name.name.gsub("'", "''"), Faker::Company.profession]
  patient = [Faker::Name.name.gsub("'", "''"), Faker::PhoneNumber.cell_phone, rand(50) + 1]
  appointment = [rand(8) + 1, rand(8) + 1, Time.at(rand * Time.now.to_i).strftime("%F %T")]

  $db.execute(<<-SQL
    INSERT INTO doctors (name, area)
    VALUES ('#{doctor[0]}','#{doctor[1]}')
    SQL
  )

    $db.execute('insert into appointments (doctor_id, patient_id, hour) values (?,?, ?)', appointment)
  $db.execute('insert into patients (name, phone, age) values (?,?,?)', patient)
end

<<-SQL

SQL

# Print doctors
print "Doctors"
puts "-"*50
p $db.execute('select * from doctors')

# Print patiens
print "Patients"
puts "-"*50
p $db.execute('select * from patients')

#Print appointments
print "Appointments"
puts "-"*50
p $db.execute('select * from appointments')

# Primer join -> Esto va a devolver una tabla cartesiana que agrupa todo n * n * n (no muy util)

# Inner Join -> Nos va a dar toda la interseccion de las tablas usando las llaves foraneas, en este caso appointments es la que nos posibilita hacer esto
<<-SQL
select *
from patients
inner join doctors
inner join appointments
on (
  patients.id = appointments.patient_id and doctors.id = appointments.doctor_id
);
SQL


# Todos los pacientes que tienen una cita con un doctor que se especiliza en programacion
<<-SQL
select p.name, p.phone, d.name, d.area
from patients p
join doctors d
join appointments a
on (
	p.id = a.patient_id
  and
  d.id = a.doctor_id
)
where d.area = 'programmer'
and p.name like '%l%';
SQL


#La cantidad de pacientes para cada doctor
<<-SQL
select d.name, count(*)
from doctors d
inner join appointments a
inner join patients p
on (
d.id = a.doctor_id
and
p.id = a.patient_id
)
group by p.name
SQL

# Left join para saber que pacientes no tiene citas programadas
