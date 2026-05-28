use	UniversidadDB
go

select * from Academico.Carrera;
go

insert into Academico.Carrera(nombre, precio) values('Ingenieria de Software', 1500);

update Academico.Carrera set precio = 2000.99, updated_at = getdate() where id = 1;

insert into Seguridad.Usuario(cif, nombres, apellidos, pw) values('401', 'Pedro', 'Pascal', HASHBYTES('SHA2_256', 'Temp2026*'));

select * from Seguridad.Usuario

insert into Seguridad.Cargo(nombre)
values('Administrador');

insert into Seguridad.Usuario
(
    cif,
    nombres,
    apellidos,
    fechaNac,
    pw,
    email,
    idCargo
)
values
(
    '401',
    'Pedro',
    'Pascal',
    '1990-04-15',
    HASHBYTES('SHA2_256', 'Temp2026*'),
    'pedro@universidad.com',
    1
);