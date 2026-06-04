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

-- Modulo III:Modificacion de estructuras (ALTER)

alter table pacientes
add telefono varchar(20);

alter table pacientes
add direccion varchar(200);

alter table pacientes
add genero varchar(20);

alter table pacientes
add tipo_sangre varchar(5);

alter table pacientes
add fecha_nacimiento date;

alter table pacientes
alter column nombre varchar(100);

alter table pacientes
alter column direccion varchar(300);

alter table medicos
add experiencia int;

alter table medicos
add turno varchar(30);

alter table medicos
add observaciones varchar(200);

alter table medicos
drop column observaciones;

alter table citas
add estado varchar(30);

alter table citas
add costo_consulta decimal(10,2);

alter table citas
alter column costo_consulta decimal(12,2);

alter table habitaciones
add disponibilidad varchar(20);
go

-- Modulo IV: Eliminacion de objetos DROP

create table tabla_temporal (
id int
);

drop table tabla_temporal;

alter table pacientes
drop constraint chk_pacientes_edad;

alter table pacientes
drop constraint uq_pacientes_correo;

alter table pacientes
drop column telefono;

create table tabla_pruebas (
id int
);

drop table tabla_pruebas;

create table auditoria (
id int,
descripcion varchar(100)
);

drop table auditoria;

create table logs (
id int,
detalle varchar(100)
);

drop table logs;

alter table habitaciones
drop constraint fk_habitaciones_pacientes;

create table medicamentosprueba (
id int
);

drop table medicamentosprueba;

create database HospitalPrueba;
go

drop database HospitalPrueba;
go

--Modulo V: Insert

-- 5 especialidades

insert into especialidades values
(1,'Cardiologia','Enfermedades del corazon',getdate()),
(2,'Pediatria','Atencion infantil',getdate()),
(3,'Neurologia','Sistema nervioso',getdate()),
(4,'Dermatologia','Enfermedades de la piel',getdate()),
(5,'Traumatologia','Lesiones oseas',getdate());

-- 10 medicos

insert into medicos
(id_medico,nombre,apellido,correo,salario,id_especialidad,fecha_registro,experiencia,turno)
values
(1,'Yamil','Perez','[yamil@hospital.com](mailto:yamil@hospital.com)',1200,1,getdate(),10,'Matutino'),
(2,'Samanta','Vela','[samanta@hospital.com](mailto:samanta@hospital.com)',1300,2,getdate(),8,'Vespertino'),
(3,'Carlos','Ruiz','[carlos@hospital.com](mailto:carlos@hospital.com)',1500,3,getdate(),12,'Nocturno'),
(4,'Emily','Melendez','[emily@hospital.com](mailto:emily@hospital.com)',1250,4,getdate(),6,'Matutino'),
(5,'Andrea','Ibarra','[andrea@hospital.com](mailto:andrea@hospital.com)',1400,5,getdate(),9,'Vespertino'),
(6,'Laura','Noguera','[lucia@hospital.com](mailto:lucia@hospital.com)',1350,1,getdate(),7,'Matutino'),
(7,'Ernesto','Mercado','[ernesto@hospital.com](mailto:ernesto@hospital.com)',1450,2,getdate(),11,'Nocturno'),
(8,'Nicole','Solorzano','[nicole@hospital.com](mailto:nicole@hospital.com)',1380,3,getdate(),5,'Vespertino'),
(9,'Mario','Torres','[mario@hospital.com](mailto:mario@hospital.com)',1420,4,getdate(),13,'Matutino'),
(10,'Isela','Trejos','[isela@hospital.com](mailto:isela@hospital.com)',1500,5,getdate(),15,'Nocturno');

-- 20 pacientes

insert into pacientes
(id_paciente,nombre,apellido,correo,edad,fecha_registro,direccion,genero,tipo_sangre,fecha_nacimiento)
values
(1,'Luis','Alvarez','[luis@gmail.com](mailto:luis@gmail.com)',25,getdate(),'Managua','M','O+','2001-01-10'),
(2,'Rosa','Perez','[rosa@gmail.com](mailto:rosa@gmail.com)',30,getdate(),'Leon','F','A+','2005-03-12'),
(3,'Miguel','Lopez','[miguel@gmail.com](mailto:miguel@gmail.com)',40,getdate(),'Masaya','M','B+','2006-04-20'),
(4,'Julia','Gomez','[julia@gmail.com](mailto:julia@gmail.com)',22,getdate(),'Granada','F','AB+','2004-07-11'),
(5,'Daniel','Medina','[daniel@gmail.com](mailto:daniel@gmail.com)',28,getdate(),'Managua','M','O-','2007-05-15'),
(6,'Elena','Torres','[elena@gmail.com](mailto:elena@gmail.com)',35,getdate(),'Carazo','F','A-','2001-02-10'),
(7,'Carlos','Mora','[carlos@gmail.com](mailto:carlos@gmail.com)',19,getdate(),'Rivas','M','B-','2007-08-01'),
(8,'Andy','Rueda','[andrea@gmail.com](mailto:andy@gmail.com)',45,getdate(),'Managua','M','O+','2008-01-14'),
(9,'Jose','Castillo','[jose@gmail.com](mailto:jose@gmail.com)',50,getdate(),'Esteli','M','A+','2006-06-25'),
(10,'Patricia','Mendez','[patricia@gmail.com](mailto:patricia@gmail.com)',31,getdate(),'Chinandega','F','AB-','2000-12-01');
