#Crear la base de datos y ponerla en uso 
create database examen; 
use examen;

#tablas 

create table categoria(
id_categoria int auto_increment,
nombre varchar (20) not null,
primary key (id_categoria) 
);

create table examen(
id_examen int auto_increment, 
total_preguntas int, 
cat_examen int,
primary key (id_examen),
foreign key (cat_examen) references categoria(id_categoria) 
);

#------------------INSERCIONES------------------- 
insert into categoria (nombre) values('java');
insert into categoria (nombre) values('asp.net');
insert into categoria (nombre) values('php');
select * from categoria;
insert into examen(total_preguntas,cat_examen) values (10,2);
insert into examen(total_preguntas,cat_examen) values (10,3);

#------------------CONSULTAS---------------------- 

select * from examen;
select categoria.nombre, examen.id_examen, examen.total_preguntas from categoria, examen where examen.cat_examen=categoria.id_categoria;