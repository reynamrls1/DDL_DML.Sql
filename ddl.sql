drop database if exists actividad;
create database actividad;
use actividad;

create table producto (
	codigo int (10) primary key auto_increment, 
    nombre varchar (100),
    precio double,
    codigo_fabricante int (10)
	);
    
create table fabricante(
	codigo int(10) primary key auto_increment,
    nombre varchar (100)
	);
    
alter table producto 
add constraint fk_codfab
foreign key (codigo_fabricante) references fabricante(codigo);