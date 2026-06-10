--Base de datos – DDL y DML
--Objetivo
--Aplicar sentencias DDL y DML para crear, modificar y administrar bases de datos y tablas, implementando restricciones de integridad y manipulando registros mediante consultas SQL.
--Parte I. Creación de Base de Datos y Tablas (DDL)
--1. Crear una base de datos llamada EmpresaSQL.
--2. Seleccionar la base de datos creada.
--3. Crear una tabla llamada TDepartamento con los campos:
--nDepartamentoID (PK, Identity)
--cNombreDepartamento (Unique, Not Null)
--4. Crear una tabla llamada TCargo con:
--nCargoID (PK, Identity)
--cNombreCargo (Unique, Not Null)
--5. Crear una tabla llamada TEmpleado con:
--nEmpleadoID (PK, Identity)
--cNIF (Unique)
--cNombre
--cApellido
--nDepartamentoID
--nCargoID
--dFechaContratacion
--nSalario
--6. Agregar restricción CHECK para que el salario sea mayor que 300.
--7. Agregar restricción DEFAULT para la fecha de contratación.
--Universidad Americana
--Página # 2
--8. Establecer llave foránea entre TEmpleado y TDepartamento.
--9. Establecer llave foránea entre TEmpleado y TCargo.
--10. Crear una tabla llamada TProyecto.
--11. Definir clave primaria autoincremental para TProyecto.
--12. Agregar campo nombre del proyecto obligatorio.
--13. Agregar fecha de inicio obligatoria.
--14. Agregar fecha de finalización.
--15. Crear tabla intermedia TEmpleadoProyecto para relación muchos a muchos.
--Parte II. Modificación de Estructuras (ALTER)
--16. Agregar columna cEmail a TEmpleado.
--17. Agregar columna cTelefono.
--18. Modificar longitud de cNombre a 100 caracteres.
--19. Modificar longitud de cApellido a 100 caracteres.
--20. Agregar columna cDireccion.
--21. Agregar columna nEdad.
--22. Crear restricción CHECK para edades entre 18 y 65 años.
--23. Agregar restricción UNIQUE al correo electrónico.
--24. Agregar columna bActivo tipo BIT con valor por defecto 1.
--25. Eliminar la columna cDireccion.
--26. Cambiar el tipo de dato de teléfono a VARCHAR(20).
--27. Agregar columna cGenero.
--28. Agregar restricción CHECK para que el género solo permita M o F.
--29. Agregar columna dFechaNacimiento.
--30. Crear una nueva tabla llamada TSucursal.
--Parte III. Inserción de Datos (INSERT)
--31. Insertar 5 departamentos diferentes.
--32. Insertar 5 cargos diferentes.
--33. Insertar 10 empleados.
--34. Insertar 3 proyectos.
--35. Asignar empleados a proyectos.
--36. Insertar un empleado utilizando el valor por defecto de fecha.
--37. Insertar un empleado con correo electrónico.
--38. Insertar un empleado sin indicar estado activo.
--39. Insertar registros usando múltiples VALUES.
--40. Intentar insertar un salario negativo y analizar el error.
--Parte IV. Actualización de Datos (UPDATE)
--41. Incrementar en 10% el salario de todos los empleados.
--42. Incrementar en 20% el salario de los empleados de un departamento específico.
--43. Actualizar el correo electrónico de un empleado.
--44. Modificar el cargo de un empleado.
--45. Cambiar el departamento de dos empleados.
--46. Marcar como inactivos a los empleados con salario inferior a 500.
--47. Actualizar la fecha de finalización de un proyecto.
--48. Asignar un nuevo proyecto a un empleado.
--Parte V. Eliminación de Datos (DELETE)
--49. Eliminar un empleado específico mediante su NIF.
--50. Eliminar todos los empleados inactivos.
--51. Eliminar un proyecto específico.
--Universidad Americana
--Página # 4
--52. Eliminar las asignaciones de un empleado en la tabla TEmpleadoProyecto.
--53. Eliminar un departamento que no tenga empleados asociados.
--Parte VI. Consultas de Verificación
--54. Mostrar todos los empleados ordenados por apellido.
--55. Mostrar empleados con salario mayor a 1,000.
--56. Mostrar empleados activos.
--57. Mostrar empleados contratados durante el año actual.
--58. Mostrar empleados y el nombre de su departamento.
--59. Mostrar empleados y el nombre de su cargo.
--60. Mostrar empleados asignados a proyectos.
--61. Mostrar cantidad de empleados por departamento.
--62. Mostrar salario promedio por departamento.
--63. Mostrar salario máximo y mínimo por departamento.
--64. Mostrar los proyectos con más de dos empleados asignados.
--65. Mostrar empleados cuyo apellido inicia con "G".
--66. Mostrar empleados ordenados por salario descendente.
--67. Mostrar los tres salarios más altos.
--68. Mostrar empleados con edad entre 25 y 40 años.
--69. Mostrar cantidad total de empleados activos.
--70. Mostrar el total de proyectos registrados.
--Parte VII. Administración de Objetos
--71. Eliminar la restricción CHECK de edad.
--72. Eliminar la restricción UNIQUE del correo.
--73. Agregar nuevamente ambas restricciones.
--74. Eliminar la tabla TEmpleadoProyecto.
--75. Eliminar la tabla TProyecto.
--76. Eliminar la tabla TEmpleado.
--77. Eliminar la tabla TCargo.
--78. Eliminar la tabla TDepartamento.
--79. Eliminar la tabla TSucursal.
--80. Eliminar la base de datos EmpresaSQL.
--Desafíos Adicionales
--81. Crear una tabla TCliente con al menos 8 campos y restricciones.
--82. Crear una tabla TVenta relacionada con TCliente.
--83. Registrar 20 clientes.
--84. Registrar 50 ventas.
--85. Actualizar precios o montos de ventas según una condición.
--86. Eliminar clientes sin ventas.
--87. Consultar los 5 clientes con mayores compras.
--88. Consultar ventas por mes.
--89. Consultar promedio de ventas por cliente.
--90. Generar un reporte consolidado utilizando JOIN entre tres tablas.
--Resultado esperado: al finalizar la práctica, el estudiante habrá trabajado con
--creación, modificación y eliminación de objetos de base de datos, aplicación de
--restricciones, integridad referencial, inserción, actualización, eliminación y consultas
--intermedias utilizando SQL Server.

create database EmpresaSQL;
go

use EmpresaSQL;
go


-- TDepartamento

create table TDepartamento(
    nDepartamentoID int identity(1,1) primary key,
    cNombreDepartamento varchar(100) not null unique
);
go


-- TCargo

create table TCargo(
    nCargoID int identity(1,1) primary key,
    cNombreCargo varchar(100) not null unique
);
go


-- TEmpleado

create table TEmpleado(
    nEmpleadoID int identity(1,1) primary key,
    cNIF varchar(20) unique,
    cNombre varchar(50) not null,
    cApellido varchar(50) not null,
    nDepartamentoID int,
    nCargoID int,
    dFechaContratacion date default getdate(),
    nSalario decimal(10,2),

    constraint CHK_TEmpleado_Salario
        check (nSalario > 300)
);
go

-- Llave foránea Departamento

alter table TEmpleado
add constraint FK_TEmpleado_Departamento
foreign key (nDepartamentoID)
references TDepartamento(nDepartamentoID);
go

-- Llave foránea Cargo

alter table TEmpleado
add constraint FK_TEmpleado_Cargo
foreign key (nCargoID)
references TCargo(nCargoID);
go


-- TProyecto

create table TProyecto(
    nProyectoID int identity(1,1) primary key,
    cNombreProyecto varchar(150) not null,
    dFechaInicio date not null,
    dFechaFinalizacion date
);
go


-- Relación Muchos a Muchos

create table TEmpleadoProyecto(
    nEmpleadoID int not null,
    nProyectoID int not null,

    constraint PK_TEmpleadoProyecto
        primary key(nEmpleadoID, nProyectoID),

    constraint FK_TEmpleadoProyecto_Empleado
        foreign key(nEmpleadoID)
        references TEmpleado(nEmpleadoID),

    constraint FK_TEmpleadoProyecto_Proyecto
        foreign key(nProyectoID)
        references TProyecto(nProyectoID)
);
go


-- PARTE II - MODIFICACION DE ESTRUCTURAS

-- 16. Agregar columna cEmail

alter table TEmpleado
add cEmail varchar(150);
go

-- 17. Agregar columna cTelefono

alter table TEmpleado
add cTelefono varchar(15);
go

-- 18. Modificar longitud de cNombre

alter table TEmpleado
alter column cNombre varchar(100) not null;
go

-- 19. Modificar longitud de cApellido

alter table TEmpleado
alter column cApellido varchar(100) not null;
go

-- 20. Agregar columna cDireccion

alter table TEmpleado
add cDireccion varchar(200);
go

-- 21. Agregar columna nEdad

alter table TEmpleado
add nEdad int;
go

-- 22. Restricción CHECK para edad

alter table TEmpleado
add constraint CHK_TEmpleado_Edad
check (nEdad between 18 and 65);
go

-- 23. Restricción UNIQUE para email

alter table TEmpleado
add constraint UQ_TEmpleado_Email
unique (cEmail);
go

-- 24. Columna bActivo con valor por defecto

alter table TEmpleado
add bActivo bit
constraint DF_TEmpleado_Activo default 1;
go

-- 25. Eliminar columna cDireccion

alter table TEmpleado
drop column cDireccion;
go

-- 26. Modificar longitud de teléfono

alter table TEmpleado
alter column cTelefono varchar(20);
go

-- 27. Agregar columna cGenero

alter table TEmpleado
add cGenero char(1);
go

-- 28. Restricción CHECK para género

alter table TEmpleado
add constraint CHK_TEmpleado_Genero
check (cGenero in ('M','F'));
go

-- 29. Agregar fecha de nacimiento

alter table TEmpleado
add dFechaNacimiento date;
go

-- 30. Crear tabla TSucursal

create table TSucursal(
    nSucursalID int identity(1,1) primary key,
    cNombreSucursal varchar(100) not null,
    cDireccion varchar(200),
    cTelefono varchar(20)
);
go


-- PARTE III - INSERT

-- 31. Insertar 5 departamentos

insert into TDepartamento(cNombreDepartamento)
values
('Recursos Humanos'),
('Finanzas'),
('Tecnologia'),
('Ventas'),
('Marketing');
go

-- 32. Insertar 5 cargos

insert into TCargo(cNombreCargo)
values
('Gerente'),
('Supervisor'),
('Analista'),
('Desarrollador'),
('Asistente');
go

-- 33. Insertar 10 empleados

insert into TEmpleado
(
    cNIF,
    cNombre,
    cApellido,
    nDepartamentoID,
    nCargoID,
    dFechaContratacion,
    nSalario,
    cEmail,
    cTelefono,
    nEdad,
    bActivo,
    cGenero,
    dFechaNacimiento
)
values
('NIF001','Diego','Garcia',1,1,'2022-01-10',1200,'diego@empresa.com','88881111',35,1,'M','1990-05-10'),
('NIF002','Maria','Cruz',2,2,'2021-03-15',950,'maria@empresa.com','88882222',29,1,'F','2000-08-20'),
('NIF003','Carlos','Martinez',3,4,'2023-02-01',800,'carlos@empresa.com','88883333',26,1,'M','1999-01-12'),
('NIF004','Ana','Zapata',4,3,'2020-06-20',1100,'ana@empresa.com','88884444',38,1,'F','1987-11-02'),
('NIF005','Pedro','Mena',5,5,'2022-08-05',700,'pedro@empresa.com','88885555',24,1,'M','2001-02-14'),
('NIF006','Lucia','Marin',1,2,'2021-10-10',900,'lucia@empresa.com','88886666',31,1,'F','1994-09-25'),
('NIF007','Miguel','Quezada',2,3,'2019-12-01',1400,'miguel@empresa.com','88887777',40,1,'M','1985-04-08'),
('NIF008','Sofia','Noguera',3,4,'2024-01-15',750,'sofia@empresa.com','88888888',23,1,'F','2002-07-18'),
('NIF009','Justin','Perez',4,5,'2023-09-01',650,'justin@empresa.com','88889999',28,1,'M','1997-03-22'),
('NIF010','Elena','Avalor',5,3,'2020-11-11',1000,'elena@empresa.com','88890000',36,1,'F','1989-12-30');
go

-- 34. Insertar 3 proyectos

insert into TProyecto
(
    cNombreProyecto,
    dFechaInicio,
    dFechaFinalizacion
)
values
('Sistema ERP','2025-01-01','2025-12-31'),
('Portal Web','2025-02-15','2025-10-15'),
('App Movil','2025-03-01',null);
go

-- 35. Asignar empleados a proyectos

insert into TEmpleadoProyecto
values
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3),
(10,1);
go

-- 36. Empleado usando fecha por defecto

insert into TEmpleado
(
    cNIF,
    cNombre,
    cApellido,
    nDepartamentoID,
    nCargoID,
    nSalario,
    cEmail,
    cTelefono,
    nEdad,
    cGenero,
    dFechaNacimiento
)
values
(
    'NIF011',
    'Mario',
    'Ruiz',
    1,
    4,
    850,
    'mario@empresa.com',
    '88891111',
    30,
    'M',
    '1995-06-01'
);
go

-- 37. Empleado con correo electrónico

insert into TEmpleado
(
    cNIF,
    cNombre,
    cApellido,
    nDepartamentoID,
    nCargoID,
    nSalario,
    cEmail,
    cTelefono,
    nEdad,
    cGenero,
    dFechaNacimiento
)
values
(
    'NIF012',
    'Laura',
    'Mendez',
    2,
    5,
    600,
    'laura@empresa.com',
    '88892222',
    27,
    'F',
    '1998-10-10'
);
go

-- 38. Empleado sin indicar estado activo
-- tomará el default = 1

insert into TEmpleado
(
    cNIF,
    cNombre,
    cApellido,
    nDepartamentoID,
    nCargoID,
    nSalario,
    cEmail,
    cTelefono,
    nEdad,
    cGenero,
    dFechaNacimiento
)
values
(
    'NIF013',
    'Fernando',
    'Torres',
    3,
    3,
    900,
    'fernando@empresa.com',
    '88893333',
    33,
    'M',
    '1992-02-05'
);
go

-- 39. Inserción múltiple

insert into TSucursal
(
    cNombreSucursal,
    cDireccion,
    cTelefono
)
values
('Sucursal Central','Managua','22221111'),
('Sucursal Norte','Leon','22222222'),
('Sucursal Sur','Granada','22223333');
go

-- 40. Intentar insertar salario negativo
-- Ejecutar por separado para observar el error

/*
insert into TEmpleado
(
    cNIF,
    cNombre,
    cApellido,
    nDepartamentoID,
    nCargoID,
    nSalario
)
values
(
    'NIF999',
    'Error',
    'Prueba',
    1,
    1,
    -500
);
*/


-- PARTE IV - UPDATE

-- 41. Incrementar salario 10%

update TEmpleado
set nSalario = nSalario * 1.10;
go

-- 42. Incrementar salario 20%
-- Departamento Tecnología (ID=3)

update TEmpleado
set nSalario = nSalario * 1.20
where nDepartamentoID = 3;
go

-- 43. Actualizar correo

update TEmpleado
set cEmail = 'nuevo_correo@empresa.com'
where nEmpleadoID = 1;
go

-- 44. Modificar cargo de empleado

update TEmpleado
set nCargoID = 2
where nEmpleadoID = 3;
go

-- 45. Cambiar departamento de dos empleados

update TEmpleado
set nDepartamentoID = 5
where nEmpleadoID in (4,5);
go

-- 46. Marcar inactivos salario menor a 500

update TEmpleado
set bActivo = 0
where nSalario < 500;
go

-- 47. Actualizar fecha finalización proyecto

update TProyecto
set dFechaFinalizacion = '2026-06-30'
where nProyectoID = 3;
go

-- 48. Asignar nuevo proyecto a empleado

insert into TEmpleadoProyecto
values (1,2);
go


-- PARTE V - DELETE

-- 49. Eliminar un empleado específico mediante NIF

delete from TEmpleadoProyecto
where nEmpleadoID =
(
    select nEmpleadoID
    from TEmpleado
    where cNIF = 'NIF012'
);

delete from TEmpleado
where cNIF = 'NIF012';
go

-- 50. Eliminar todos los empleados inactivos

delete from TEmpleadoProyecto
where nEmpleadoID in
(
    select nEmpleadoID
    from TEmpleado
    where bActivo = 0
);

delete from TEmpleado
where bActivo = 0;
go

-- 51. Eliminar un proyecto específico

delete from TEmpleadoProyecto
where nProyectoID = 2;

delete from TProyecto
where nProyectoID = 2;
go

-- 52. Eliminar asignaciones de un empleado

delete from TEmpleadoProyecto
where nEmpleadoID = 3;
go

-- 53. Eliminar un departamento sin empleados asociados

delete from TDepartamento
where nDepartamentoID = 5
and nDepartamentoID not in
(
    select distinct nDepartamentoID
    from TEmpleado
    where nDepartamentoID is not null
);
go


-- PARTE VI - CONSULTAS

-- 54. Mostrar todos los empleados ordenados por apellido

select *
from TEmpleado
order by cApellido;
go

-- 55. Empleados con salario mayor a 1000

select *
from TEmpleado
where nSalario > 1000;
go

-- 56. Empleados activos

select *
from TEmpleado
where bActivo = 1;
go

-- 57. Empleados contratados durante el año actual

select *
from TEmpleado
where year(dFechaContratacion) = year(getdate());
go

-- 58. Empleados y su departamento

select
    e.cNombre,
    e.cApellido,
    d.cNombreDepartamento
from TEmpleado e
inner join TDepartamento d
    on e.nDepartamentoID = d.nDepartamentoID;
go

-- 59. Empleados y su cargo

select
    e.cNombre,
    e.cApellido,
    c.cNombreCargo
from TEmpleado e
inner join TCargo c
    on e.nCargoID = c.nCargoID;
go

-- 60. Empleados asignados a proyectos

select
    e.cNombre,
    e.cApellido,
    p.cNombreProyecto
from TEmpleado e
inner join TEmpleadoProyecto ep
    on e.nEmpleadoID = ep.nEmpleadoID
inner join TProyecto p
    on ep.nProyectoID = p.nProyectoID;
go

-- 61. Cantidad de empleados por departamento

select
    d.cNombreDepartamento,
    count(*) as CantidadEmpleados
from TEmpleado e
inner join TDepartamento d
    on e.nDepartamentoID = d.nDepartamentoID
group by d.cNombreDepartamento;
go

-- 62. Salario promedio por departamento

select
    d.cNombreDepartamento,
    avg(e.nSalario) as SalarioPromedio
from TEmpleado e
inner join TDepartamento d
    on e.nDepartamentoID = d.nDepartamentoID
group by d.cNombreDepartamento;
go

-- 63. Salario máximo y mínimo por departamento

select
    d.cNombreDepartamento,
    max(e.nSalario) as SalarioMaximo,
    min(e.nSalario) as SalarioMinimo
from TEmpleado e
inner join TDepartamento d
    on e.nDepartamentoID = d.nDepartamentoID
group by d.cNombreDepartamento;
go

-- 64. Proyectos con más de dos empleados asignados

select
    p.cNombreProyecto,
    count(*) as CantidadEmpleados
from TProyecto p
inner join TEmpleadoProyecto ep
    on p.nProyectoID = ep.nProyectoID
group by p.cNombreProyecto
having count(*) > 2;
go

-- 65. Apellido inicia con G

select *
from TEmpleado
where cApellido like 'G%';
go

-- 66. Empleados por salario descendente

select *
from TEmpleado
order by nSalario desc;
go

-- 67. Tres salarios más altos

select top 3 *
from TEmpleado
order by nSalario desc;
go

-- 68. Empleados entre 25 y 40 años

select *
from TEmpleado
where nEdad between 25 and 40;
go

-- 69. Cantidad total de empleados activos

select count(*) as TotalActivos
from TEmpleado
where bActivo = 1;
go

-- 70. Total de proyectos registrados

select count(*) as TotalProyectos
from TProyecto;
go


-- PARTE VII - ADMINISTRACION DE OBJETOS

-- 71. Eliminar restricción CHECK de edad

alter table TEmpleado
drop constraint CHK_TEmpleado_Edad;
go

-- 72. Eliminar restricción UNIQUE de email

alter table TEmpleado
drop constraint UQ_TEmpleado_Email;
go

-- 73. Agregar nuevamente ambas restricciones

alter table TEmpleado
add constraint CHK_TEmpleado_Edad
check (nEdad between 18 and 65);
go

alter table TEmpleado
add constraint UQ_TEmpleado_Email
unique (cEmail);
go

-- 74. Eliminar tabla TEmpleadoProyecto

drop table TEmpleadoProyecto;
go

-- 75. Eliminar tabla TProyecto

drop table TProyecto;
go

-- 76. Eliminar tabla TEmpleado

drop table TEmpleado;
go

-- 77. Eliminar tabla TCargo

drop table TCargo;
go

-- 78. Eliminar tabla TDepartamento

drop table TDepartamento;
go

-- 79. Eliminar tabla TSucursal

drop table TSucursal;
go

-- 80. Eliminar base de datos

use master;
go

drop database EmpresaSQL;
go

--Desafío 1
create table TCliente(
    nClienteID int identity(1,1) primary key,
    cNombres varchar(100) not null,
    cApellidos varchar(100) not null,
    cCedula varchar(20) not null unique,
    cTelefono varchar(20),
    cEmail varchar(150) unique,
    cDireccion varchar(200),
    dFechaRegistro date default getdate(),
    bActivo bit default 1
);
go

--Desafío 2
create table TVenta(
    nVentaID int identity(1,1) primary key,
    nClienteID int not null,
    dFechaVenta date not null,
    nMonto decimal(10,2) not null,

    constraint FK_TVenta_Cliente
    foreign key (nClienteID)
    references TCliente(nClienteID)
);
go

--Desafío 3
insert into TCliente
(cNombres,cApellidos,cCedula,cTelefono,cEmail,cDireccion)
values
('Juan','Perez','C001','88880001','juan@gmail.com','Managua'),
('Maria','Lopez','C002','88880002','maria@gmail.com','Leon'),
('Carlos','Gomez','C003','88880003','carlos@gmail.com','Masaya'),
('Ana','Martinez','C004','88880004','ana@gmail.com','Granada'),
('Pedro','Torres','C005','88880005','pedro@gmail.com','Rivas'),
('Sofia','Ruiz','C006','88880006','sofia@gmail.com','Jinotepe'),
('Luis','Garcia','C007','88880007','luis@gmail.com','Esteli'),
('Elena','Mendez','C008','88880008','elena@gmail.com','Chinandega'),
('Diego','Flores','C009','88880009','diego@gmail.com','Boaco'),
('Lucia','Silva','C010','88880010','lucia@gmail.com','Matagalpa'),
('Miguel','Castro','C011','88880011','miguel@gmail.com','Managua'),
('Paula','Rojas','C012','88880012','paula@gmail.com','Leon'),
('Jorge','Vega','C013','88880013','jorge@gmail.com','Masaya'),
('Laura','Morales','C014','88880014','laura@gmail.com','Granada'),
('Mario','Hernandez','C015','88880015','mario@gmail.com','Rivas'),
('Carmen','Gutierrez','C016','88880016','carmen@gmail.com','Jinotepe'),
('Andres','Navarro','C017','88880017','andres@gmail.com','Esteli'),
('Gabriela','Sanchez','C018','88880018','gabriela@gmail.com','Boaco'),
('Ricardo','Pineda','C019','88880019','ricardo@gmail.com','Matagalpa'),
('Valeria','Diaz','C020','88880020','valeria@gmail.com','Managua');
go

--Desafío 4
insert into TVenta(nClienteID,dFechaVenta,nMonto)
values
(1,'2025-01-05',100),(1,'2025-02-10',250),
(2,'2025-01-15',300),(2,'2025-03-12',150),
(3,'2025-01-20',500),(3,'2025-02-18',200),
(4,'2025-01-25',450),(4,'2025-04-01',175),
(5,'2025-02-05',600),(5,'2025-03-05',225),
(6,'2025-01-08',320),(6,'2025-02-08',180),
(7,'2025-01-10',410),(7,'2025-03-18',275),
(8,'2025-01-12',290),(8,'2025-04-10',360),
(9,'2025-01-14',540),(9,'2025-03-15',210),
(10,'2025-02-01',470),(10,'2025-04-12',195),
(11,'2025-01-05',125),(11,'2025-02-20',350),
(12,'2025-01-07',410),(12,'2025-03-22',200),
(13,'2025-01-09',390),(13,'2025-04-18',275),
(14,'2025-01-11',515),(14,'2025-03-25',240),
(15,'2025-01-13',430),(15,'2025-04-20',310),
(16,'2025-01-15',620),(16,'2025-03-27',180),
(17,'2025-01-17',540),(17,'2025-04-22',220),
(18,'2025-01-19',330),(18,'2025-03-30',280),
(19,'2025-01-21',470),(19,'2025-04-24',260),
(20,'2025-01-23',580),(20,'2025-04-26',300),
(1,'2025-05-01',140),(2,'2025-05-02',210),
(3,'2025-05-03',190),(4,'2025-05-04',280),
(5,'2025-05-05',330),(6,'2025-05-06',175),
(7,'2025-05-07',260),(8,'2025-05-08',220),
(9,'2025-05-09',410),(10,'2025-05-10',300);
go