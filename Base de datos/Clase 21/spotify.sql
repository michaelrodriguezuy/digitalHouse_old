/*
4. Si tenemos una query que trae un listado ordenado por el ID de usuarios la cual
cuenta con un LIMIT 20 OFFSET 27, ¿cuál sería el primer ID de los registros y cuál
el último?
*/
-- 28 al 48
select idUsuario from usuario
order by idUsuario
limit 5
offset 10;

/*
Realizar los siguientes informes
1. Mostrar la cantidad de canciones que pertenecen a ambos géneros pop y rock
cuyo nombre contiene la letra “m”.
*************************************************************************************************************************************************/
select count(generoxcancion.idCancion) as Cantidad from cancion
join generoxcancion ON cancion.idCancion = generoxcancion.idCancion
join genero ON generoxcancion.idGenero = genero.idGenero
where (cancion.titulo like '%m%') AND (genero.idGenero = 9 and genero.idGenero = 11);
/************************************************************************************************************************************************
2. Listar todas las canciones que pertenezcan a más de una playlist. Incluir en el
listado el nombre de la canción, el código y a cuántas playlists pertenecen.
*/
select cancion.titulo, cancion.idCancion, count(playlistxcancion.Idcancion) as 'Cantidad de playlist' from cancion
join playlistxcancion ON cancion.idCancion = playlistxcancion.Idcancion
join playlist ON playlistxcancion.IdPlaylist= playlist.idPlaylist
group by playlistxcancion.Idcancion
having count(playlistxcancion.Idcancion)>1;
/*
3. Generar un reporte con el nombre del artista y el nombre de la canción que no
pertenecen a ninguna lista, ordenados alfabéticamente por el nombre del
artista.
*/
select artista.Nombre as Artista, cancion.titulo as Cancion, cancion.idCancion from cancion
inner join album ON cancion.IdAlbum = album.idAlbum
inner join artista ON album.idArtista = artista.idArtista
left join playlistxcancion ON cancion.idCancion = playlistxcancion.Idcancion
where playlistxcancion.Idcancion is null
order by artista.Nombre;
-- cancion
-- album
-- artista order by
-- lef join playlistxCancion

/*
4. Modificar el país de todos los usuarios con el código postal “7600” a “Argentina”.
*/
update usuario
set Pais_idPais = 1
where CP='1001';
/*
5. Listar todos los álbumes que tengan alguna canción que posea más de un
género.
*/

/*
6. Crear un índice agrupado para las canciones cuyo identificador sea el ID
*/


update artista
set imagen = 'Imagen faltante'
where imagen ='';