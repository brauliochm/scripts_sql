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



/*--------- Insercion en la tabla Categoria   --------  */


insert into categoria (nombre_cat) values('java');
insert into categoria (nombre_cat) values('asp.net');
insert into categoria (nombre_cat) values('php');

/*--------- Insercion en la tabla Examen   --------  */
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (10,2,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (10,3,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (20,3,3);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (40,3,2);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (50,3,1);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (60,3,1);
insert into examen(numero_preguntas,cat_examen,usuario_asignado) values (90,3,3);




#------------------CONSULTAS---------------------- 



#-----------------CONSULTAS POR TABLA------------------

select * from examen;


#cantidad de examen por categoria
select count(*) as total_examen, categoria.nombre_cat from examen,categoria where examen.cat_examen=categoria.id_categoria;

#Examen que pertenecena a cada categoria
select categoria.nombre_cat, id_examen ,numero_preguntas from categoria,examen where examen.cat_examen=categoria.id_categoria;


