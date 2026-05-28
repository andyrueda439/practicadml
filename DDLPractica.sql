/* ================================================
   SCRIPT: bd_universidad
   Motor:  Microsoft SQL Server 2022
   Autor:  Andy Josué Rueda Sánchez
   Fecha:  27/05/2026
   ================================================ */

-- ============ SECCIÓN DOWN (limpiar primero) ============
use master; go
drop database if exists bd_universidad; go

-- ============ SECCIÓN UP (construir) ============
create database bd_universidad; go
use bd_universidad; go

-- Tablas en orden de dependencias...
-- [resto del script]

-- 2. Crear tablas con PK y FK

-- Crea las tablas CARRERA y MATERIA 

create table CARRERA (
    id_carrera   int identity(1,1) primary key,
    nombre       nvarchar(100) not null unique,
    modalidad    nvarchar(20)  not null,
    creditos     TINYINT       not null,
    semestre     TINYINT       not null
);

create table MATERIA (
    id_materia   int identity(1,1) primary key,
    nombre       nvarchar(100) not null unique,
    creditos     TINYINT        not null,
    semestre     TINYINT        not null
);

-- Crea la tabla ESTUDIANTE relacionada con CARRERA:

create table ESTUDIANTE (
    id_estudiante   int identity(1,1) primary key,
    carnet          nvarchar(10)  not null unique,
    nombre_completo nvarchar(150) not null,
    fecha_nacimiento date          null,
    email           nvarchar(100) not null unique,
    id_carrera      INT           not null,
    constraint fk_estudiante_carrera foreign key (id_carrera)
        references CARRERA (id_carrera)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- Crea la tabla INSCRIPCION que implementa la relación N:M entre estudiantes y materias:

create table INSCRIPCION (
    id_inscripcion int identity(1,1) primary key,
    id_estudiante  int           not null,
    id_materia     int           not null,
    nota_final     decimal(4,2)  null,
    periodo        nvarchar(3)   not null,
    anio           SMALLINT      not null,
    constraint fk_inscripcion_estudiante foreign key (id_estudiante)
        references ESTUDIANTE (id_estudiante)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    constraint fk_inscripcion_materia foreign key (id_materia)
        references MATERIA (id_materia)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    constraint ck_periodo_valido check (periodo in (N'I', N'II', N'III')),
    constraint ck_anio_valido check (anio between 2000 and 2099),
    constraint uq_inscripcion unique (id_estudiante, id_materia, anio, periodo)
);

-- Agregar columnas nuevas
-- SQL Server: ADD sin la palabra COLUMN
ALTER TABLE ESTUDIANTE
    ADD telefono nvarchar(20) null;
go

-- Agregar múltiples columnas en un solo ALTER
ALTER TABLE ESTUDIANTE
    ADD
        estado   nvarchar(10) not null default N'Activo',
        constraint ck_estado_valido check (estado in (N'Activo', N'Inactivo'));
go

-- Agrega a MATERIA la columna descripcion NVARCHAR(MAX) NULL — en SQL Server se usa NVARCHAR(MAX) en lugar de TEXT
ALTER TABLE MATERIA
    ADD descripcion NVARCHAR(MAX) null;

-- Modificar y renombrar columnas
-- Modificar tipo de dato de una columna
ALTER TABLE ESTUDIANTE
    ALTER COLUMN telefono nvarchar(25) null;
go

-- Renombrar columna: NO existe RENAME COLUMN en T-SQL
-- Se usa el procedimiento del sistema sp_rename

-- Renombra duracion_anios de CARRERA a duracion usando sp_rename — observa el mensaje de advertencia que genera SQL Server y explica por qué aparece

EXEC sp_rename 
    N'dbo.CARRERA.creditos',
    N'cantidad_creditos',
    N'COLUMN';
go

-- Modifica nota_final en INSCRIPCION de DECIMAL(4,2) a DECIMAL(5,2)
ALTER TABLE INSCRIPCION
    ALTER COLUMN nota_final decimal(5,2) null;

-- Gestionar restricciones
-- Ver todos los CHECK constraints de una tabla
select name, definition
from sys.check_constraints
where parent_object_id = OBJECT_ID(N'MATERIA');

-- Ver todos los constraints de la BD
select TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
order by TABLE_NAME;

-- Agrega un CHECK a CARRERA para que duracion esté entre 3 y 6

ALTER TABLE CARRERA
    ADD duracion TINYINT not null,
    constraint ck_duracion_carrera check (duracion between 3 and 6);

-- Crea un índice no agrupado sobre email de ESTUDIANTE

create NONCLUSTERED INDEX IX_estudiante_email on ESTUDIANTE (email);

-- Consulta el nombre autogenerado del CHECK de semestre en MATERIA usando sys.check_constraints , luego elimínalo con ALTER TABLE MATERIA DROP CONSTRAINT nombre_encontrado;

select name, definition from sys.check_constraints where parent_object_id = OBJECT_ID(N'MATERIA');

ALTER TABLE MATERIA
drop constraint ck_semestre_materia;


-- Vuelve a crearlo nombrándolo explícitamente como ck_semestre_valido

ALTER TABLE MATERIA
    add constraint ck_semestre_valido check (semestre in (1, 2, 3, 4, 5, 6));

-- Eliminar columnas con Alter
-- 1. Verificar si hay DEFAULT constraint ligado a la columna

select d.name as default_name
from sys.default_constraints d
join sys.columns c on d.parent_column_id = c.column_id
    and d.parent_object_id = c.object_id
where c.object_id = OBJECT_ID(N'MATERIA')
    and c.name = N'descripcion';

-- 2. Si existe, eliminarlo primero

ALTER TABLE MATERIA drop constraint nombre_del_default;

-- 3. Ahora sí eliminar la columna
ALTER TABLE MATERIA
    drop column descripcion;
go

-- Eliminar tablas respetando dependencias FK
-- SQL Server impide eliminar tablas que son referenciadas por FK de otras tablas. Practica el orden correcto y el uso de IF EXISTS:

-- SQL Server 2016+: DROP TABLE IF EXISTS
DROP TABLE IF EXISTS INSCRIPCION;
DROP TABLE IF EXISTS ESTUDIANTE;
DROP TABLE IF EXISTS MATERIA;
DROP TABLE IF EXISTS CARRERA;
GO

-- Alternativa compatible con versiones anteriores:
IF OBJECT_ID(N'INSCRIPCION', N'U') IS NOT NULL
    DROP TABLE INSCRIPCION;


DROP TABLE IF EXISTS INSCRIPCION;
DROP TABLE IF EXISTS ESTUDIANTE;
DROP TABLE IF EXISTS MATERIA;
DROP TABLE IF EXISTS CARRERA;
GO


TRUNCATE TABLE CARRERA;
TRUNCATE TABLE MATERIA;
TRUNCATE TABLE ESTUDIANTE;
TRUNCATE TABLE INSCRIPCION;
Go


DELETE FROM CARRERA WHERE 1=1;
DELETE FROM MATERIA WHERE 1=1;
DELETE FROM ESTUDIANTE WHERE 1=1;
DELETE FROM INSCRIPCION WHERE 1=1;
GO


BEGIN TRANSACTION;
TRUNCATE TABLE CARRERA;
ROLLBACK;