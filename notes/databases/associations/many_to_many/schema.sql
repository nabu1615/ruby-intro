drop table if exists doctors;

create table doctors (
  id integer primary key AUTOINCREMENT not null,
  name varchar,
  area varchar
);

drop table if exists patients;

create table patients (
  id integer primary key AUTOINCREMENT not null,
  name varchar,
  phone varchar,
  age integer
);

drop table if exists appointments;

create table appointments (
  id integer primary key AUTOINCREMENT not null,
  doctor_id integer,
  patient_id integer,
  hour date
);
