-- Listar las canciones que poseen la letra “z” en su título.
select * from cancion where titulo like "%z%";

-- Listar las canciones que poseen como segundo carácter la letra “a” y como último, la letra “s”.
select * from cancion where titulo like "_a%s";

-- Mostrar la playlist que tiene más canciones, renombrando las columnas poniendo mayúsculas en la primera letra, los tildes correspondientes y 
-- agregar los espacios entre palabras.
select idPlaylist as "ID playlist", idusuario as "ID usuario", titulo as Título, cantcanciones as "Cantidad de canciones", idestado as "ID estado", 
Fechacreacion as "Fecha de creación", Fechaeliminada as "Fecha de eliminación" from playlist order by cantcanciones desc limit 1;

-- En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener un listado de los 10 siguientes.
select * from usuario order by fecha_nac desc limit 10 offset 5;

-- Listar las 5 canciones con más reproducciones, ordenadas descendentemente.
select * from cancion order by cantreproduccion desc limit 5;

-- Generar un reporte de todos los álbumes ordenados alfabéticamente.
select * from album order by titulo asc;

-- Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente.
select * from album where imagenportada is null order by titulo asc;

-- Insertar un usuario nuevo con los siguientes datos (tener en cuenta las relaciones):
-- a) nombreusuario: nuevousuariodespotify@gmail.com 
-- b) Nombre y apellido: Elmer Gomez
-- c) password: S4321m
-- d) Fecha de nacimiento: 15/11/1991
-- e) Sexo: Masculino
-- f) Código Postal: B4129ATF
-- g) País: Colombia
insert into usuario (idusuario, nombreusuario, nyap, fecha_nac,sexo,CP, password, pais_idPais, idTipoUsuario, FechaPassword) 
values(20, "nuevousuariodespotify@gmail.com", "Elmer Gomez", "1991-11-15", "M", "B4129ATF", "S4321m", 2, 2, null);

-- Eliminar todas las canciones de género “pop”.
-- delete from playlistxcancion where idCancion IN (select idCancion from generoxcancion where IdGenero=9);
-- delete from cancion where idCancion IN (select idCancion from generoxcancion where IdGenero=9);
-- delete from generoxcancion where idCancion IN (select idCancion from generoxcancion where IdGenero=9);

-- Editar todos los artistas que no tengan una imagen cargada y cargarles el texto “Imagen faltante” en la columna de imagen.
update artista set imagen = 'imagen faltante' where imagen is null;