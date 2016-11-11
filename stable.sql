create database stable

create table clientes(id_cliente integer auto_increment primary key, 
	nombre varchar(50), 
	apellidos varchar(80),
	rfc varchar(30),
	direccion varchar(50),
	fechaDeNacimiento date);

insert into clientes(nombre,apellidos,rfc,direccion,fechaDeNacimiento) values
	('Ana','Marlen Ocampo','651gtd145f','Tepicoloyo #79','1997-06-07'),
	('Carmen','Ocampo Barragan','651g1d125f','Santo Domingo #89','1997-07-07'),
	('Karla','Martinez Martinez','6q1g1d12wf','San Sebastian #27','1997-08-07');

create table proveedores(id_proveedor integer auto_increment primary key,
	nombre varchar(50),
	nie varchar(30),
	direccion varchar(50));

insert into proveedores(nombre,nie,direccion) values
	('Pedro','a51gtd1f5f','Tepicoloyo #29'),
	('Julian','f51s1d125f','Santo Domingo #9'),
	('Elsy','6q1g1d12wf','San Sebastian #2');

create table productos(id_producto integer auto_increment primary key,
	nombre varchar(50),
	codigo varchar(3),
	precioUni integer);

insert into productos(nombre,codigo,precioUni) values 
	('tomate','3b',10),
	('jitomate','3k',20),
	('leche','4h',18);

create table compras(id_compra integer auto_increment primary key,
	id_cliente integer,
	id_producto integer,
	id_proveedor integer,
	cantidad integer);

insert into compras(id_cliente,id_producto,id_proveedor,cantidad) values 
	(1,3,2,100),(2,1,3,200),(3,2,1,400),(3,1,3,120);

create table stock(id_stock integer auto_increment primary key,
	id_proveedor integer,
	id_producto integer,
	cantidadEx integer);

create table cupons(id_cupon integer auto_increment primary key, 
	id_compra integer);

insert into stock(id_proveedor,id_producto,cantidadEx) values 
	(3,1,1000),(2,3,1000),(1,2,1000);

-- relacion de tablas:
select cl.id_cliente, cl.nombre,pr.nombre as producto,pro.nombre as provedor from compras as co left join clientes as cl on co.id_cliente=cl.id_cliente left join productos as pr on co.id_producto=pr.id_producto left join proveedores as pro on co.id_proveedor=pro.id_proveedor;

select cl.id_cliente, cl.nombre,pr.nombre as producto,pro.nombre as provedor,pr.precioUni+pr.precioUni as total from compras as co left join clientes as cl on co.id_cliente=cl.id_cliente left join productos as pr on co.id_producto=pr.id_producto left join proveedores as pro on co.id_proveedor=pro.id_proveedor;

-- creacion de triggers:
delimiter //
create trigger insertaCp after insert
on compras
for each row
begin
insert into cupons(id_compra)
values(new.id_compra);
end
//