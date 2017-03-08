# Galletas y Hornos

##Resumen

Vamos a crear el software para manejar una pastelería. Tu trabajo es construir un programa que le sirva al pastelero para hornear sus galletas. Estas son algunas de las historias de usuario que tienes que resolver:

- Como pastelero, Quiero poder hornear diferentes tipos de galletas. (chocolate, almendras, avena, etc ..)
- Como pastelero, Quiero poder hornear lotes de galletas.     
- Como pastelero, Quiero saber cuando un lote de galletas ya esta listo para salir del horno.

El punto de este reto es ejercitar tus músculos de OOP. Vamos a ver que tal te va  

##Pasos

###Paso 1:

Agrega la siguiente funcionalidad:   

- Multiples tipos de galletas, cada uno con tiempos diferentes de hornear.       
- Cada tipo de galleta debe tener características únicas. Las galletas de chips de chocolate deben tener un `chip_count` las de almendras un `almond_count`, las de azúcar deben tener la cantidad de gramos de azúcar por galleta etc..
- Debes agregar un atributos a las galletas que nos diga su estado, con por lo menos los siguiente valores: `:doughy`, `:almost_ready`, `:ready`, `:burned`

###Paso 2 : Refactor

Mira el código que creaste. Pasalo por la siguiente lista de preguntas para si estas siguiendo los principios de OOP:  

- Es DRY?        
- Siguen tus clases la [ley de Demeter](http://en.wikipedia.org/wiki/Law_of_Demeter)?
- Son tus clase [ortogonales](http://stackoverflow.com/a/1527430)?
- Expusiste solo la minima cantidad de area de cada objeto?

---

La ley de Demeter se puede resumir de la siguiente forma:

*For all classes C. and for all methods M attached to C, all objects to which M sends a message must be instances of classes associated with the following classes:*

1. *The argument classes of M (including C).*
2. *The instance variable classes of C.*

*(Objects created by M, or by functions or methods which M calls, and objects in global variables are considered as arguments of M.)*

Lee el post de [Avdi Grimm's](http://devblog.avdi.org/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/) para una explicación mas a fondo.

###Paso 3 : Se creativo!

Punte en los zapatos del pastelero. Imagine que otras funcionalidades podrías necesitar nuestro programa. Luego escoge las que mas te gusten e implementalas.
