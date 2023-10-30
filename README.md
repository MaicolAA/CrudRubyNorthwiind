# CRUD ruby on rails


* Ruby version
3.2.2

* System dependencies
postgres SQL

Tarea de Bases de Datos II: Prueba de CRUD en Ruby on Rails para Órdenes y Empleados

En el contexto de la asignatura Bases de Datos II, se ha realizado un proyecto de prueba que utiliza Ruby on Rails para crear, leer, actualizar y eliminar (CRUD) registros de órdenes y empleados en una base de datos existente NORTHWIND.

NORTHWIND :: es una base de datos con registros para una tienda de enceres.

**EL BACKUP DE LA BASE DE DATOS ESTARA EN EL ARCHIVO Northwind.sql EN LA RAIZ DEL PROYECTO**

**Lo que hemos hecho:**

1. **Obtención de Datos:**  Se extrae informacion de la base de datos de las tablas employees y orders

2. **Eliminación de Datos:** También he habilitado la posibilidad de borrar registros existentes de empleados en la base de datos.

3. **Actualización de Datos:** Se ha implementado la capacidad de modificar datos de registros de empleados existentes.

4. **Inserción de Nuevos Datos:** Además, he permitido la creación de nuevos registros para empleados, productos

5. **busqueda personalizada** Se incorpora un modulo para la busqueda de las ordenes generadas por un empleado en especial.

**Cosas a tener en cuenta:**

Es importante destacar que esta implementación es solo una prueba y no maneja todas las posibles situaciones de error. Si se introducen datos incorrectos, como texto en campos que esperan números, pueden ocurrir errores.

**Relevancia del Proyecto:**

Este proyecto tiene relevancia para nuestra asignatura de Bases de Datos II, construido para porporcionar una práctica al CRUD en Ruby on Rails usando bases de datos creadas en postgresSQL.





**Detalles de ejecucion**

Como este proyecto es solo una prueba las rutas deben manejarse manualmente:

1. ejecutar el proyecto **rails server**

Para ir al modulo **employes** enlace http://localhost:3000/employees

Para ir al modulo **orders** enlace http://localhost:3000/orders

Para ir a modulo de **busqueda de ordenes x empleado** http://localhost:3000/order_search/index

