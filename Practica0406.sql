create database HospitalDB;
go

select name from sys.databases;
go

use HospitalDB;
go

--Modulo 1: Creacion de BD(DDL)

create table pacientes (
id_paciente int not null,
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
edad int,
fecha_registro datetime
);
go

create table especialidades (
id_especialidad int not null,
nombre varchar(50),
descripcion varchar(200),
fecha_registro datetime
);
go

create table medicos (
id_medico int not null,
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
salario decimal(10,2),
id_especialidad int,
fecha_registro datetime
);
go

create table citas (
id_cita int not null,
id_paciente int not null,
id_medico int not null,
fecha_cita datetime,
fecha_registro datetime
);
go

create table habitaciones (
id_habitacion int not null,
numero varchar(10),
tipo varchar(30),
id_paciente int,
fecha_registro datetime
);
go

create table tratamientos (
id_tratamiento int not null,
id_paciente int not null,
descripcion varchar(200),
fecha_inicio datetime,
fecha_fin datetime,
fecha_registro datetime
);
go

create table medicamentos (
id_medicamento int not null,
id_tratamiento int not null,
nombre varchar(100),
descripcion varchar(200),
fecha_vencimiento date,
stock int,
fecha_registro datetime
);
go

--Modulo 2: Restricciones

alter table pacientes
add constraint pk_pacientes
primary key (id_paciente);

alter table medicos
add constraint pk_medicos
primary key (id_medico);

alter table especialidades
add constraint pk_especialidades
primary key (id_especialidad);

alter table citas
add constraint pk_citas
primary key (id_cita);

alter table habitaciones
add constraint pk_habitaciones
primary key (id_habitacion);

alter table tratamientos
add constraint pk_tratamientos
primary key (id_tratamiento);

alter table medicamentos
add constraint pk_medicamentos
primary key (id_medicamento);

alter table pacientes
alter column nombre varchar(50) not null;

alter table medicos
alter column nombre varchar(50) not null;

alter table pacientes
add constraint uq_pacientes_correo
unique (correo);

alter table medicos
add constraint uq_medicos_correo
unique (correo);

alter table pacientes
add constraint chk_pacientes_edad
check (edad >= 0);

alter table medicos
add constraint chk_medicos_salario
check (salario > 0);

alter table pacientes
add constraint df_pacientes_fecha_registro
default getdate() for fecha_registro;

alter table especialidades
add constraint df_especialidades_fecha_registro
default getdate() for fecha_registro;

alter table medicos
add constraint df_medicos_fecha_registro
default getdate() for fecha_registro;

alter table citas
add constraint df_citas_fecha_registro
default getdate() for fecha_registro;

alter table habitaciones
add constraint df_habitaciones_fecha_registro
default getdate() for fecha_registro;

alter table tratamientos
add constraint df_tratamientos_fecha_registro
default getdate() for fecha_registro;

alter table medicamentos
add constraint df_medicamentos_fecha_registro
default getdate() for fecha_registro;

alter table medicos
add constraint fk_medicos_especialidades
foreign key (id_especialidad)
references especialidades(id_especialidad);

alter table citas
add constraint fk_citas_pacientes
foreign key (id_paciente)
references pacientes(id_paciente);

alter table citas
add constraint fk_citas_medicos
foreign key (id_medico)
references medicos(id_medico);

alter table tratamientos
add constraint fk_tratamientos_pacientes
foreign key (id_paciente)
references pacientes(id_paciente);

alter table medicamentos
add constraint fk_medicamentos_tratamientos
foreign key (id_tratamiento)
references tratamientos(id_tratamiento);

alter table habitaciones
add constraint fk_habitaciones_pacientes
foreign key (id_paciente)
references pacientes(id_paciente);
go