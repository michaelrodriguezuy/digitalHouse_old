create schema Universo_lector;
use Universo_lector;

create table socio (
id int not null primary key auto_increment,
dni int not null,
apellido varchar(100) not null,
nombres varchar(100) not null,
direccion varchar(200) not null,
localidad varchar(100)
);

create table telefonoxsocio (
id int not null primary key auto_increment,
 socio_id int,
 nrotelefono varchar(100),
 foreign key (socio_id) references socio (id)
);

create table editorial (
id int not null primary key auto_increment,
razon_social varchar(100) not null,
telefono varchar(100)
);

create table autor (
id int not null primary key auto_increment,
apellido varchar(100) not null,
nombre varchar(100) not null
);

create table libro (
id int not null primary key auto_increment,
isbn varchar(13) not null,
titulo varchar(200),
anio_escritura date,
autor_id int,
anio_edicion date,
editorial_id int,
foreign key (autor_id) references autor (id),
foreign key (editorial_id) references editorial (id)
);

create table volumen (
id int not null primary key auto_increment,
libro_id int,
deteriorado bool,
foreign key (libro_id) references libro (id)
);

create table prestamo (
id int not null primary key auto_increment,
socio_id int,
fecha datetime not null,
fecha_devolucion date,
fecha_tope date not null,
foreign key (socio_id) references socio (id)
);

create table prestamosxvolumen (
id int not null primary key auto_increment,
prestamo_id int,
volumen_id int,
foreign key (prestamo_id) references prestamo (id),
foreign key (volumen_id) references volumen (id)
);

INSERT INTO socio (id, dni, apellido, nombres, direccion, localidad) VALUES
(DEFAULT,3000000,"PATRICIA","JOHNSON", "28 MySQL Boulevard", "QLD"),
(DEFAULT,2988800, "LINDA", "WILLIAMS","23 Workhaven Lane", "Alberta"),
(DEFAULT,2500000, "BARBARA", "JONES", "1411 Lillydale Drive", "QLD"),
(DEFAULT,32980002, "LOIS", "BUTLER", "1688 Okara Way", "Nothwest Border Prov"),
(DEFAULT,2313909, "ROBIN", "HAYES", "262 A Corua (La Corua) Parkway", "Dhaka");

INSERT INTO telefonoxsocio (id, socio_id, nrotelefono) VALUES
(DEFAULT, 1,"54911-45636453"),
(DEFAULT, 2, "54-11-47867654"),
(DEFAULT, 3,"11498-2173"),
(DEFAULT, 4,"116847369"),
(DEFAULT, 5,"2645887755");


