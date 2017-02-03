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