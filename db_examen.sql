#Crear la base de datos y ponerla en uso 
create database examen; 
use examen;

#tablas 
create table usuario(
id_usuario integer auto_increment,
nombre_user varchar(50),
primary key (id_usuario)
);

create table nivel(
id_nivel int auto_increment, 
nivel varchar(15),
primary key (id_nivel) 

);

create table categoria(
id_categoria int auto_increment,
nombre_cat varchar (20) not null,
nivel_cat int not null,
primary key (id_categoria) 
);

create table examen(
id_examen int auto_increment not null, 
numero_preguntas int not null, 
cat_examen int not null,
usuario_asignado int not null,
primary key (id_examen),
foreign key (cat_examen) references categoria(id_categoria),
foreign key (usuario_asignado) references usuario(id_usuario)
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

/*--------- Insercion en la tabla Usuario  --------  */
insert into usuario(nombre_user) values("Braulio Chavez Miranda");
insert into usuario(nombre_user) values("Jose Maria Miranda");
insert into usuario(nombre_user) values("Damaso Gutierrez Aguado");

/*--------- Insercion en la tabla Nivel  --------  */


insert into nivel (nivel) values('Basico');
insert into nivel (nivel) values('Intermedio');
insert into nivel (nivel) values('Avanzado');


/*--------- Insercion en la tabla Categoria   --------  */


insert into categoria (nombre_cat,nivel_cat) values('java',1);
insert into categoria (nombre_cat,nivel_cat) values('asp.net',2);
insert into categoria (nombre_cat,nivel_cat) values('php',1);

/*--------- Insercion en la tabla Examen   --------  */
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (10,2,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (10,3,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (20,3,3);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (40,3,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (50,3,1);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (60,3,1);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (90,3,3);

#-----------------CONSULTAS POR TABLA------------------

select * from examen;
select * from categoria;


#------------------CONSULTAS---------------------- 

#categoria y nivel 
select nombre_cat,nivel.nivel from categoria, nivel where nivel.id_nivel=categoria.nivel_cat;
/*
#cantidad de examen por categoria
select count(*) as total_examen, categoria.nombre_cat from examen,categoria where examen.cat_examen=categoria.id_categoria;

#Examen que pertenecena a cada categoria
select categoria.nombre_cat, id_examen ,numero_preguntas from categoria,examen where examen.cat_examen=categoria.id_categoria;

#Examen que tiene asignado un usuario de que categoria y cuales son

select categoria.nombre_cat, usuario.nombre_user from examen,categoria,usuario where examen.cat_examen=categoria.id_categoria 
and usuario.id_usuario=usuario_asignado;*/

