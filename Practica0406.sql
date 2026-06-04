create database HospitalDB;
go

select name from sys.databases;
go

use HospitalDB;
go

--Modulo 1: Creacion de BD(DDL)

create table pacientes (
id_paciente int,
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
edad int,
fecha_registro datetime
);
go

create table especialidades (
id_especialidad int,
nombre varchar(50),
descripcion varchar(200),
fecha_registro datetime
);
go

create table medicos (
id_medico int,
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
salario decimal(10,2),
id_especialidad int,
fecha_registro datetime
);
go

create table citas (
id_cita int,
id_paciente int,
id_medico int,
fecha_cita datetime,
fecha_registro datetime
);
go

create table habitaciones (
id_habitacion int,
numero varchar(10),
tipo varchar(30),
id_paciente int,
fecha_registro datetime
);
go

create table tratamientos (
id_tratamiento int,
id_paciente int,
descripcion varchar(200),
fecha_inicio datetime,
fecha_fin datetime,
fecha_registro datetime
);
go

create table medicamentos (
id_medicamento int,
id_tratamiento int,
nombre varchar(100),
descripcion varchar(200),
fecha_vencimiento date,
stock int,
fecha_registro datetime
);
go