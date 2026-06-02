create database ClientMasterBD;
use ClientMasterBD;


create table Rol (
    Id_Rol int primary key identity(1,1),
    Nombre_Rol varchar(50) not null default 'Usuario',
    Permisos_Rol varchar(150) not null
);

Select * from Rol;

create table Usuario (
    Id_Usuario int primary key identity (1,1),
    Nombre_Usuario varchar(100) not null,
    Correo_Usuario varchar(100) not null unique,
    Contrasena_Usuario varchar(255) not null,
    Id_Rol int not null,

    constraint FK_Usuario_Rol
    foreign key (Id_Rol)
    references Rol(Id_Rol)
);

select * from Usuario;

create table Cliente (
    Identificacion_Cliente varchar(20) primary key,
    Nombre_Cliente varchar(100) not null,
    Tipo_Cliente varchar(30) not null default 'Pyme',
    Direccion_Cliente varchar(150),
    Estado_Cliente varchar(15) not null default 'Activo',

    constraint CHK_Estado_Cliente
    check (Estado_Cliente in ('Activo', 'Inactivo'))
);

select * from Cliente;

create table Contacto_Cliente (
    Id_Contacto int primary key identity(1,1),
    Identificacion_Cliente varchar(20) not null,

    Nombre_Contacto varchar(100) not null,
    Telefono_Contacto varchar(20) not null,
    Correo_Contacto varchar(100) unique,
    Cargo_Contacto varchar(50),

    constraint FK_Contacto_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente)
);

select * from Contacto_Cliente;

create table Telefono_Cliente (
    Id_Telefono int primary key identity(1,1),
    Identificacion_Cliente varchar(20) not null,

    Numero_Telefono varchar(20) not null,

    constraint FK_Telefono_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente)
);

select * from Telefono_Cliente;


create table Correo_Cliente (
    Id_Correo int primary key identity(1,1),
    Identificacion_Cliente varchar(20) not null,

    Correo_Electronico varchar(100) not null unique,

    constraint FK_Correo_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente)
);

select * from Correo_Cliente;


create table Interaccion (
    Id_Interaccion int primary key identity(1,1),

    Identificacion_Cliente varchar(20) not null,
    Id_Usuario int not null,

    Fecha_Interaccion date not null default (current_date),
    Descripcion_Interaccion text not null,
    Tipo_Interaccion varchar(30) not null,

    constraint FK_Interaccion_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente),

    constraint FK_Interaccion_Usuario
    foreign key (Id_Usuario)
    references Usuario(Id_Usuario)
);

select * from Interaccion;


create table Oportunidad_Venta (
    Id_Oportunidad int primary key identity(1,1),

    Identificacion_Cliente varchar(20) not null,

    Monto_Oportunidad decimal(10,2) default 0.00,
    Etapa_Oportunidad varchar(30) not null default 'Prospeccion',
    Resultado_Oportunidad varchar(30) default 'En progreso',

    constraint FK_Oportunidad_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente),

    constraint CHK_Monto_Oportunidad
    check (Monto_Oportunidad >= 0)
);

select * from Oportunidad_Venta;


create table Ticket_Soporte (
    Id_Ticket int primary key identity(1,1),

    Identificacion_Cliente varchar(20) not null,

    Ticket_Problema text not null,
    Prioridad_Ticket varchar(15) not null default 'Media',

    constraint FK_Ticket_Cliente
    foreign key (Identificacion_Cliente)
    references Cliente(Identificacion_Cliente),

    constraint CHK_Prioridad_Ticket
    check (Prioridad_Ticket in ('Alta', 'Media', 'Baja'))
);

select * from Ticket_Soporte;


create table Tarea_Seguimiento (
    Id_Tarea int primary key identity(1,1),

    Id_Interaccion int not null,

    Tarea_Seguimiento varchar(150) not null,
    Fecha_Limite_Tarea date not null default (current_date),
    Estado_Tarea varchar(20) not null default 'Pendiente',

    constraint FK_Tarea_Interaccion
    foreign key (Id_Interaccion)
    references Interaccion(Id_Interaccion)
);

select * from Tarea_Seguimiento


--Valores o datos insertados
insert into Rol (Nombre_Rol, Permisos_Rol)
values
('Administrador', 'Control total del sistema'),
('Vendedor', 'Gestion de clientes y ventas'),
('Soporte', 'Gestion de tickets y seguimiento'),
('Gerente', 'Gestion y supervision');


insert into Usuario
(Nombre_Usuario, Correo_Usuario, Contrasena_Usuario, Id_Rol)
values
('Maria Celeste Carrasco Obando', 'maria@crm.com', '123456', 1),
('Diego Alexander Gomez Solis', 'diego@crm.com', '123456', 2),
('Andy Josue Rueda Sanchez', 'andy@crm.com', '123456', 1),
('Alejandro Enrique Zeledon Del Cid', 'alejandro@crm.com', '123456', 3);


insert into Cliente
(Identificacion_Cliente, Nombre_Cliente, Tipo_Cliente, Direccion_Cliente, Estado_Cliente)
values
('001-010101-0001A', 'Tech Solutions', 'Corporativo', 'Managua', 'Activo'),
('001-020202-0002B', 'Innovatech', 'Pyme', 'Leon', 'Activo'),
('001-030303-0003C', 'Digital Services', 'Corporativo', 'Masaya', 'Activo'),
('001-040404-0004D', 'Comercial Alpha', 'Pyme', 'Granada', 'Inactivo');


insert into Contacto_Cliente
(Identificacion_Cliente, Nombre_Contacto, Telefono_Contacto, Correo_Contacto, Cargo_Contacto)
values
('001-010101-0001A', 'Maria Carrasco', '88887777', 'maria@tech.com', 'Gerente'),
('001-020202-0002B', 'Diego Gomez', '88886666', 'diego@innovatech.com', 'Supervisor'),
('001-030303-0003C', 'Andy Rueda', '88885555', 'andy@digital.com', 'Director Comercial'),
('001-040404-0004D', 'Alejandro Zeledon', '88884444', 'alejandro@alpha.com', 'Administrador');


insert into Telefono_Cliente
(Identificacion_Cliente, Numero_Telefono)
values
('001-010101-0001A', '22770001'),
('001-020202-0002B', '22770002'),
('001-030303-0003C', '22770003'),
('001-040404-0004D', '22770004');


insert into Correo_Cliente
(Identificacion_Cliente, Correo_Electronico)
values
('001-010101-0001A', 'contacto@techsolutions.com'),
('001-020202-0002B', 'ventas@innovatech.com'),
('001-030303-0003C', 'info@digitalservices.com'),
('001-040404-0004D', 'admin@comercialalpha.com');


insert into Interaccion
(Identificacion_Cliente, Id_Usuario, Fecha_Interaccion, Descripcion_Interaccion, Tipo_Interaccion)
values
('001-010101-0001A', 1, GETDATE(), 'Llamada de seguimiento comercial', 'Llamada'),
('001-020202-0002B', 2, GETDATE(), 'Reunion para propuesta de venta', 'Reunion'),
('001-030303-0003C', 3, GETDATE(), 'Correo enviado con cotizacion', 'Correo'),
('001-040404-0004D', 4, GETDATE(), 'Soporte tecnico solicitado', 'Soporte');


insert into Oportunidad_Venta
(Identificacion_Cliente, Monto_Oportunidad, Etapa_Oportunidad, Resultado_Oportunidad)
values
('001-010101-0001A', 5000.00, 'Propuesta', 'En progreso'),
('001-020202-0002B', 12000.00, 'Negociacion', 'En progreso'),
('001-030303-0003C', 8500.00, 'Cierre', 'Ganada'),
('001-040404-0004D', 3000.00, 'Prospeccion', 'Pendiente');


insert into Ticket_Soporte
(Identificacion_Cliente, Ticket_Problema, Prioridad_Ticket)
values
('001-010101-0001A', 'Error en acceso al sistema', 'Alta'),
('001-020202-0002B', 'Problema de sincronizacion', 'Media'),
('001-030303-0003C', 'Fallo en reportes del sistema', 'Alta'),
('001-040404-0004D', 'Consulta sobre configuracion', 'Baja');


insert into Tarea_Seguimiento
(Id_Interaccion, Tarea_Seguimiento, Fecha_Limite_Tarea, Estado_Tarea)
values
(1, 'Enviar propuesta comercial', GETDATE(), 'Pendiente'),
(2, 'Dar seguimiento al cliente', GETDATE(), 'En proceso'),
(3, 'Confirmar recepcion de cotizacion', GETDATE(), 'Pendiente'),
(4, 'Resolver problema tecnico', GETDATE(), 'Completado');