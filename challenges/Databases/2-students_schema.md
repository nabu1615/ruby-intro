# Student-cohort


## Resumen

Mira la siguiente tabla la cual representa una base de datos. Es muy parecido a una hoja de excel.

<table class="table">
  <thead>
    <tr>
      <th>id</th><th>first_name</th><th>last_name</th><th>gender</th><th>birthday</th><th>email</th><th>phone</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td><td>Nikolas</td><td>Friesen</td><td>female</td><td>1998-12-24</td><td>agustina_braun@wintheiser.info</td><td>449.897.7415</td>
    </tr>
    <tr>
      <td>2</td><td>Randi</td><td>Halvorson</td><td>male</td><td>1997-01-29</td><td>heber.upton@bechtelarwisozk.biz</td><td>(697)436-2633</td>
    </tr>
    <tr>
      <td>3</td><td>Sally</td><td>Buckridge</td><td>female</td><td>1997-10-30</td><td>nora@treutel.name</td><td>1-351-672-6358x02502</td>
    </tr>
    <tr>
      <td>4</td><td>Morris</td><td>Swift</td><td>male</td><td>1995-06-27</td><td>cordell@sanfordkuhlman.org</td><td>(600)142-5639x9380</td>
    </tr>
    <tr>
      <td>5</td><td>Sidney</td><td>Ortiz</td><td>male</td><td>1997-04-04</td><td>erling@davis.name</td><td>554.170.3265</td>
    </tr>
    <tr>
      <td>6</td><td>Reid</td><td>Skiles</td><td>male</td><td>1994-10-13</td><td>mike_harvey@nikolaus.com</td><td>(543)511-2123</td>
    </tr>
    <tr>
      <td>7</td><td>Violet</td><td>Dickens</td><td>female</td><td>1994-11-19</td><td>rubye_olson@collins.biz</td><td>1-410-486-1411x5058</td>
    </tr>
    <tr>
      <td>8</td><td>Marguerite</td><td>Flatley</td><td>female</td><td>1995-05-28</td><td>wanda_okon@hane.name</td><td>572.978.5828x07860</td>
    </tr>
    <tr>
      <td>9</td><td>Cary</td><td>Schoen</td><td>male</td><td>1996-07-31</td><td>fay@runolfon.biz</td><td>1-828-134-7828x66958</td>
    </tr>
    <tr>
      <td>10</td><td>Mazie</td><td>Gibson</td><td>female</td><td>1995-09-23</td><td>doug@roberts.biz</td><td>144.038.7351x24117</td>
    </tr>
  </tbody>
</table>


Cada columna (**field**) tiene un nombre. Podemos describir la estructura de esta tabla independientemente de los datos que se encuentren en ella. Esta estructura se ve así:

<pre>
+------------+
| students   |
+------------+
| id         |
| first_name |
| last_name  |
| gender     |
| birthday   |
| email      |
| phone      |
+------------+
</pre>

### Convenciones

Podemos usar cualquiera nombre para los nombres de los campos, pero hay unas convenciones a seguir para no volvernos locos. Estas convenciones son muy populares:

1. El nombre de las tablas son en plural. Ej `students`, `products`, `todos`
2. Cada fila tiene un `id` único que se autoincrementa.
3. Usamos snake_case en vez de camaleCase para nombre los campos.
4. Los campos que tienen fechas o tiempos terminan en <code>&#95;at</code> o <code>&#95;on</code> (<code>created&#95;at</code>, <code>updated&#95;at</code>, <code>completed&#95;at</code>, etc.). A menos que se muy obvio que es algo relacionado con tiempo, por ejemplo `birthday`.
5. Cuando en duda, usa el nombre para la tabla o campo que sea mas auto explicatorio. Evita nombres como `type`, `kind` `status`.
6. Rails incluye por defecto los campos <code>created&#95;at</code> and <code>updated&#95;at</code>, de modo que haremos lo mismo con nuestras tablas.


### Llave primaria

Cada fila en una base de datos debe tener un `primary key`. Este es un campo (o colección de campos) que identifica únicamente a esa fila del resto de filas. Rails por defecto usa como `primary key` un numero entero auto incrementable que esta en el campo `id`. vamos a seguir esta convención.

## Pasos

### Paso 0: Diseña el esquema

Visita el [SQL Designer](https://ondras.zarovi.cz/sql/demo/) y recrea la tabla de arriba.

En el sql designer, vas a ver que puedes escoger el typo de dato para cada campo. Existen muchos tipos investiga sobre ellos:
[w3schools.com Data Types](https://www.w3schools.com/SQl/sql_datatypes_general.asp) o [Wikipedia : Data Types](http://en.wikipedia.org/wiki/SQL#Data_types)

Así se debería ver la tabla incluido los colores [table](http://f.cl.ly/items/0z3p0i1Y0G3h1A3V1d2p/Screen%20Shot%202012-05-17%20at%205.04.38%20PM.png)
