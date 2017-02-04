#Crear la base de datos y ponerla en uso 
create database examen; 
use examen;

#tablas 
create table usuario(
id_usuario integer auto_increment,
nombre_user varchar(50),
primary key (id_usuario)
);

create table categoria(
id_categoria int auto_increment,
nombre_cat varchar (20) not null,
primary key (id_categoria) 
);

create table examen(
id_examen int auto_increment not null, 
numero_preguntas int not null, 
cat_examen int not null ,
primary key (id_examen),
foreign key (cat_examen) references categoria(id_categoria) 
);

create table respuestas(

id_respuesta int auto_increment,
respuesta text,
primary key (id_respuesta)

);

create table preguntas(
id_pregunta int auto_increment not null, 
enunciado varchar(255) not null, 
res_correcta int not null,
primary key (id_pregunta),
foreign key (res_correcta) references respuestas (id_respuesta) 
);





#------------------INSERCIONES------------------- 
insert into categoria (nombre_cat) values('java');
insert into categoria (nombre_cat) values('asp.net');
insert into categoria (nombre_cat) values('php');
insert into examen(numero_preguntas,cat_examen) values (10,2);
insert into examen(numero_preguntas,cat_examen) values (10,3);
insert into examen(numero_preguntas,cat_examen) values (20,3);
insert into examen(numero_preguntas,cat_examen) values (40,3);
insert into examen(numero_preguntas,cat_examen) values (50,3);
insert into examen(numero_preguntas,cat_examen) values (60,3);
insert into examen(numero_preguntas,cat_examen) values (90,3);




#------------------CONSULTAS---------------------- 



#-----------------CONSULTAS POR TABLA------------------

select * from examen;


#cantidad de examen por categoria
select count(*) as total_examen, categoria.nombre_cat from examen,categoria where examen.cat_examen=categoria.id_categoria;

#Examen que pertenecena a cada categoria
select categoria.nombre_cat, id_examen ,numero_preguntas from categoria,examen where examen.cat_examen=categoria.id_categoria;


