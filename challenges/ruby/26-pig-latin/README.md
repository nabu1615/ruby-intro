# Pig Latin

##Resumen

Este reto esta diseñado para que veas la importancia de tener un modelo mental sobre como atacar un problema. Especificamente lo que buscamos es que antes de que empieces a escribir codigo, rompas el problema en pequeños pedazos y tengas un plan de accion sobre como resolver cada uno de ellos. En otros palabras queremos que escribas pseudocode.

El pseudocodigo, se usa para comunicar la esencia de un algoritmo, sin entorpecerlo con los detalles de la syntaxis de un lenguaje en especifico. Un buen programador puede tomar buen pseudocodigo, y traducirlo en codigo funcional.

##Pasos

###paso 0 : Construye en base a Pseudocodigo

Aca esta el pseudocodigo para `pig_latin`:

```text
Script: CONVERT TO PIG LATIN

Primera version: CONVERTIR SOLO UNA PALABRA

GET una palabra de input del usuario.
IF la palabra empieza con una vocal, no cambiarla.
ELSE reemplaza la palabra con su equivalente pig latinizado
  GET all of the consonantes before the first vowel in the word.
  SET las consonantes al final de la palabra y agrega el sufijo `ay`.
ENDIF
PRINT la palabra pig latinizada.
```

```text
Segunda Version: CONVERTIR UNA ORACION COMPLETA

GET una oracion de input del usuario.
FOR EACH palabra en la oracion.
  CONVERTIR SOLO UNA PALABRA
ENDFOR
PRINT la oracion pig latinizada.
DISPLAY la cantidad de palabras convertidas.
```

Escribe el codigo que cumpla con los requisitos de este pseudocodigo.
