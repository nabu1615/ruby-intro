-- Creating tables

create table directors (
   id serial primary key,
   name varchar(200) unique not null
);

create table movies (
   id serial primary key,
   title varchar(100) not null,
   release_date date,
   count_stars integer,
   director_id integer references directors(id) -- Enforces the id to exists in the directors table
)

-- Inserting values

insert into directors (name) values ('Tarantino'), ('eastwood');

insert into movies (title, release_date, count_stars, director_id) values (
    'kill bill',
    '10-10-2003',
    3,
    1
), (
    'Funny people',
    '07-20-2009',
    3,
    2
);

--Filtering values

select title from movies

select title, release_date from movies

select title, release_date as release from movies

select title,
release_date as release
from movies
where release_date > '01-01-1975'

select title,
release_date as release,
count_stars
from movies
where release_date > '01-01-1975'
and count_stars = 3

select *
from movies
where release_date > '01-01-1975'
and count_stars = 3

select * from movies limit 100

--Aggregation

--Total number of records
select count(*)
from movies;

-- Total number of stars
select sum(count_stars)
from movies;

-- average number of stars
select avg(count_stars)
from movies;

-- select all columns, create new column in memory, parse int into float and calculate value
select *,
(count_stars::float/5)*100 as rotten_tomatoes_score
from movies;

-- Group all movies by rating and order in defending order
select rating
from movies
group by rating
order by 1;

-- Group all movies by rating show, rating and number of movies with that rating
select rating, count(*)
from movies
group by rating
order by 1;

-- Histogram of movies by their rating
select round(rating), count(*)
from movies
group by 1
order by 1;

-- Group by several columns NOT only one
select title,
case
when action=true then 'action'
when animation=true then 'animation'
when comedy=true then 'comedy'
when drama=true then 'drama'
when documentary=true then 'documentary'
when romance=true then 'romance'
when short=true then 'short'
else 'other'
end as genre
from movies
limit 100;

-- Creates a new temporary table from which to perform operations
with genres as (

)

--Combining the last two operations we can build histogram of several columns
with genres as (
   select title,
   case
   when action=true then 'action'
   when animation=true then 'animation'
   when comedy=true then 'comedy'
   when drama=true then 'drama'
   when documentary=true then 'documentary'
   when romance=true then 'romance'
   when short=true then 'short'
   else 'other'
   end as genre
   from movies
)
select genre, count(*)
from genres
group by 1
order by 1

--Updating

-- Updates all records count_stars value
update movies
set count_stars=1;

-- Update only a movie wit the title kill bill
update movies
set count_stars=5
where title = 'kill bill';

-- Sort

-- Sort first by friend_count, if tie then by name
select *
from friends
order by friend_count, name;

-- Constrain in combination of two fields
alter table movies add constraint unique_title_and_release unique(title, release_date);

--Constrains

-- Add a constrain to not allow duplicate rows with the same name
alter table friends add constraint friends_name_unique unique(name);

-- count_stars must have a number greater than 0
alter table movies add constraint count_stars_greater_than_zero check(count_stars > 0);

--Deleting

-- Delete movies with 5 stars
delete from movies
where count_stars = 5;

-- Delete several things at once
delete from movies where id in (2,4)

-- Delete all movies
delete from movies
