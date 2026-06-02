use ClientMasterBD;
go

create schema Seguridad;
go

create schema Comercial;
go

/*
Seguridad
*/

alter schema Seguridad Transfer dbo.Rol;
go

alter schema Seguridad transfer dbo.Usuario;
go

/*
Comercial
*/

alter schema Comercial transfer dbo.Cliente;
go

alter schema Comercial transfer dbo.Contacto_Cliente;
go

alter schema Comercial transfer dbo.Telefono_Cliente;
go

alter schema Comercial transfer dbo.Correo_Cliente;
go

alter schema Comercial transfer dbo.Interaccion;
go

alter schema Comercial transfer dbo.Oportunidad_Venta;
go

alter schema Comercial transfer dbo.Ticket_Soporte;
go

alter schema Comercial transfer dbo.Tarea_Seguimiento;
go

select * from sys.schemas; go

/*
verificar datos
*/

select * from Seguridad.Rol;
select * from Seguridad.Usuario;

select * from Comercial.Cliente;
select * from Comercial.Contacto_Cliente;
select * from Comercial.Telefono_Cliente;
select * from Comercial.Correo_Cliente;
select * from Comercial.Interaccion;
select * from Comercial.Oportunidad_Venta;
select * from Comercial.Ticket_Soporte;
select * from Comercial.Tarea_Seguimiento;
go