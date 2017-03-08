En todos los retos siguientes te vamos a pedir que hagas la misma cosa. Diseñar una modelo de datos, cada vez un mayor nivel de dificultad.

Esta es la lista de retos
#### Intro Databases (Semana 5)
- Student cohort
- Address book schema
- Family tree database design
- Reddit JR database design


## SQL Básico

Diseñar la base de datos es la parte fácil!

Para cada uno de los retos anteriores debes inventarte de 3 a 5 preguntas sobre los datos que quieras hacer. Luego debes escribir los queries de SQL para responder estas preguntas.

Por ejemplo, en el reto `Student cohort` puedes preguntarte como responder la siguientes preguntas y responderlas usando SQL

Cuando lees las siguientes expresiones, considera que están caen en las 4 operaciones básicas que se usan para manipular una base de datos: CRUD

- create: `INSERT`
- retrieve / read: `SELECT`
- update: `UPDATE`
- delete / destroy: `DELETE`


```sql
--------------------------------------
-- preguntas con  INSERT
--------------------------------------

-- puedo añadir estudiantes a la tabla?
INSERT INTO students
(first_name, last_name, gender, birthday, email, phone)
VALUES
('jane', 'smith', 'female', '1997-7-20', 'abc@hi.com', '123.321.2323')

-- puedo hacerlo sin incluir email y phone?
INSERT INTO students
(first_name, last_name, gender, birthday)
VALUES
('jane', 'smith', 'female', '1997-7-20')

-- puedo cambiar el orden de mis columnas?
INSERT INTO students
(gender, first_name, last_name)
VALUES
('female', 'jane', 'smith')


--------------------------------------
-- usando  SELECT
--------------------------------------

-- puede listar todas las mujeres de la tabla
SELECT *
FROM students
WHERE gender = 'female'

-- puedo listar los hombres?
SELECT *
FROM students
WHERE gender = 'male'

-- puedo listar los estudiantes que nacieron en 1994
SELECT *
FROM students
WHERE birthday LIKE '1994%'

-- puedo listar los estudiantes cuyo apellido empieza con la letra 's'
SELECT *
FROM students
WHERE last_name LIKE 'S%'


-- puedo listar los estudiantes cuyo email termine con .biz
SELECT *
FROM students
WHERE email LIKE '%biz'
ORDER BY last_name, first_name


--------------------------------------
-- usando UPDATE
--------------------------------------

-- puedo cambiar el email de un estudiante si se su id
UPDATE students
SET email = '123@abc.com'
WHERE id = 1

-- puedo cambiar el email de un estudiante sin su id?
UPDATE students
SET email = '123@abc.com'
WHERE email = 'agustina_braun@wintheiser.info'

-- puedo cambiar el email de varios estudiantes al tiempo?
UPDATE students
SET email = '123@abc.com'
WHERE last_name LIKE 'S%'


--------------------------------------
-- usando DELETE
--------------------------------------

-- puedo borrar a un estudiante si conozco su id
DELETE from students
WHERE id = 1

-- puedo borrar un estudiante sin saber su id?
DELETE from students
WHERE email = '123@abc.com'

-- puedo borrar toda la tabla?
DELETE from students
WHERE 1 = 1

```

Imagina leer esta lista, para cada uno de los retos. Haz buenas preguntas y respondelas con SQL.

## SQL Intermedio

Una vez que tengas la idea básica de como hacer un CRUD con solo una tabla. Crear relaciones es el siguiente paso. En la imagen de abajo podrás varios tipos de `joins`. Los `inner joins` son de lejos los mas populares. Los otros son importantes también, al usar diagramas venn va hacer mas fácil recordarlos.

Considera que la relación entre dos tablas A y B se puede representar con los diagramas de abajo. Incluso una sola tabla se puede unir con ella misma para crear resultados interesantes.

![SQL joins](http://f.cl.ly/items/393r1B431Y432i0R2Z3E/sql_joins.jpg)
