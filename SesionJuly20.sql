--CREACION DE BD

CREATE DATABASE dbregistro
go

use dbregistro
go

--crear tabla Ciudades
create table Ciudades(
    id int primary key identity (1,1)
	, nombre nvarchar(60) not null
	, estado bit default 1
	)

	go


--crear tabla Personas
create table personas(
    id int primary key identity (1, 1)
	, nombres nvarchar (60) not null
	, estado bit default 1
	)

	go

	create table personas(
	id int primary key identity (1, 1) 
	,nombres nvarchar (40) not null
	, apellidos nvarchar (40) not null
	, ciudad_id int foreign key references ciudades (id) not null
	, activo bit default 1
	)
	go

	/*consultas de insertar*/
insert into ciudades(nombre) values ('masaya')
, (' granada' )
, (' jinotega' )
, (' managua' )
, (' Leon' )
go

insert into personas (nombres,apellidos, ciudad_id)
values (' Belen' , ' cuna' ,4 ),
(' Erick' , ' Martinez' , 4),
(' Sergio' , ' Rivas' , 1),
(' Elmer' , ' Martinez' , 3)
go

/*crud*/
/*visualizar datos*/
select * from ciudades
go

select * from  personas
go

select id as ' codigo' , nombre as ' ciudad' , estado as ' est'  from ciudades
go

select personas.id as codigo, personas.nombres+' '+ personas.apellidos
as 'nombre completo',
ciudades.nombre as ciudad from personas inner join ciudades
on personas.ciudad_id
=ciudades.id

/*variables*/
declare @nombre nvarchar(40)
set @nombre = '%k%' 

select* from personas where nombres like @nombre