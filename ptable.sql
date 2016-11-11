create database ptable;

create table categoria(id_categoria integer auto_increment primary key, 
	nombreC varchar(50),
	descrip varchar(45),
	encarg varchar(50));

insert into categoria(nombreC,descrip,encarg) values 
	('ensaladas','chido','Laura'),
	('pastas','ta bueno','Carmen'),
	('postres','chido','Ana');

create table ingredientes(id_ingrediente integer auto_increment primary key, 
	nombreI varchar(50), 
	cantidad integer,
	unidad varchar(5),
	id_platillo integer,
	almacen integer);

insert into ingredientes(nombreI,cantidad,unidad,id_platillo,almacen) values
	('lechuga',200,'gr',1,5),
	('filete de pollo',1,'com',1,10),
	('pan',50,'gr',1,10),
	('queso parmesano',40,'gr',1,20),
	('huevo',2,'clara',2,50),
	('yemas'4,'',2,50),
	('azucar',100,'gr',2,5),
	('queso mascarpone',200,'gr',2,20),
	('biscocho',200,'gr',2,30),
	('cafe',174,'gr',2,10),
	('chocolate',200,'gr',2,20),
	('pasta',200,'gr',3,40),
	('tomane',2,'',3,40),
	('oregano',2,'gr',3,50);



create table platillos(id_platillo integer auto_increment primary key, 
	nombreP varchar(45),
	foto varchar(50),
	descrip varchar(45),
	precio integer);

insert into platillos(nombreP,foto,descrip,precio) values 
	('ensalada cesar','ec.jpg','chido',50),
	('tiramisu','t.jpg','chido',60),
	('pasta verano','pv.jpg','tabueno',80);

create table menu(id_menu integer auto_increment primary key, 
	id_platillo integer,
	id_categoria integer,
	id_ingrediente integer);

insert into menu(id_platillo,id_categoria,id_ingrediente)values
	(1,1,1),(1,1,2),(1,1,3),(1,1,4),(2,3,5),(2,3,6),(2,3,7),(2,3,8),(2,3,9),(2,3,10),(2,3,11),(3,2,12),(3,2,13),(3,2,14);

create table Nplatillos(id_Nplatillo integer auto_increment primary key, id_platillo integer);

-- relacion de tablas:
select pl.id_platillo, pl.nombreP, ing.nombreI from menu as m left join platillos as pl on m.id_platillo=pl.id_platillo left join ingredientes as ing on m.id_ingrediente=ing.id_ingrediente;

select pl.id_platillo, pl.nombreP, ca.nombreC from menu as m left join platillos as pl on m.id_platillo=pl.id_platillo left join categoria as ca
on m.id_categoria=ca.id_categoria;

-- creacion de triggers:
delimiter //
create trigger insertaP after insert 
on platillos
for each row
begin
insert into Nplatillos(id_platillo)
values(new.id_platillo);
end
//