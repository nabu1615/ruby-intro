
drop table if exists customers;

create table customers (
  id integer primary key AUTOINCREMENT not null,
  first_name varchar(255),
  last_name varchar(255),
  email varchar(255),
  address varchar(255),
  city varchar(255),
  state varchar(255),
  zip integer
);

drop table if exists orders;

create table orders (
  id integer primary key AUTOINCREMENT not null,
  order_date date,
  order_amount decimal,
  customer_id integer
);
