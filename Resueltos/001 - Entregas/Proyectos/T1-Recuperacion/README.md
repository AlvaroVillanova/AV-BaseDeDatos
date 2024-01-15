Alvaro Villanova Ahlroth            STEM Granada 2024
# RECUPERACION Base de Datos:



## Historial de versiones:


#### Comienzo de proyecto (V0.1):

En esta version (v0.1) se piensa completar el diagrama de Entidad-Relacion partiendo desde la guia del modulo.
    

**0.11**:
  - Creadas todas las entidades y algunas de las relaciones. Falta repasar la guia de modulo de nuevo porque me han salido algunas dudas: Por ejemplo, ESPIA puede ser miembro O lider, asi que esto deberia de cambiar de ser un atributo de la entidad ESPIA a una relacion de parentesco tipo "ESPIA-ES_UN-MIEMBRO/LIDER"

**0.12**:
  - Creadas todas las relaciones y repasado las entidades. Todo relativamente sencillo, solo algunas relaciones mas especiales entre ciertas entidades (como la de "espia presta espia", "agencia colabora con agencia") como la de parentesco (Espia ES UN miembro/lider/asesino) o agregacion (empresa fabrica equipo). Aun y asi falta repasar todas estas de nuevo ya que faltan algunas por completar.

**0.13**:
  - Repasadas todas las entidades y relaciones. Creadas las cardinalidades aunque falta repasarlas. Modelo Relacional completado "a medias"; hace falta completarlo y crear las tablas extras pertinentes a las relaciones entre entidades.

  **0.14**:
  - Completado el modelo relacional. Gracias a esto he podido corregir algunas de las cardinalidades que estaban incorrectas; como la de las relaciones reflexivas entre ciudad-ciudad, espia-espia y agencia-agencia (las tenia 1-1 y eran M-M, lo cual crea nuevas tablas).

**0.15**:
  - Completada primera versión del archivo SQL. Tuve varios problemas tontos que pude resolver facilmente. Por ejemplo me encontre con el error 1170 varias veces al intentar usar una entidad BLOB/TEXT como PRIMARY KEY sin especificar longitud. Descubrí que es mejor usar VARCHAR en estas ocasiones. También me equivoqué al no añadir en una primera ocasión un ID a CIVIL (no se menciona en la guia de estudios, pero es optimo) lo cual me hizo nombrar entidades relacionadas de una manera diferente en diferentes columnas (Ver historial de versiones).
  Todavía falta repasar todas las tablas de nuevo y empezar a añadir restricciones, instertar datos, etc...

**0.16**:
  - SQL completado del todo. Añadidas las inserciones de datos (He usado algo de ChatGPT para generarme las inserciones, aunque ha hecho falta editar casi todas, ya que ChatGPT tiene muy mala memoria) y corregidas las restricciones incorrectas. Tambien he corregido las claves de las relaciones reciprocas (agencia colabora con ciudad, espia presta equipo a espia, etc...); ya que solo tenian a un agente involucrado (Hacen falta dos: un agente le presta equipo a OTRO agente= ID_AGENTE1, ID_AGENTE2). Esto también ha sido reflejado en el modelo Entidad-Relacion, a la cual le faltaban algunas de estas claves.
