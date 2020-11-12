
<?php
require("conexion.php");
if (isset($_POST['guardar']) && !empty($_POST['guardar'])) {
	require("conexion.php");
	$titulo = $_POST['titulo'];
	$duracion = $_POST['duracion'];
	$puntaje = $_POST['puntaje'];
	$imagen = $_POST['imagen'];
	$descripcion = $_POST['descripcion'];
	$anio = $_POST['anio'];
	$trailer = $_POST['trailer'];
	$generos='';
	if(isset($_POST['nombre_genero'])){
	   foreach($_POST['nombre_genero'] as $selected){
		  $generos=$generos.' '.$selected;
	   }
	}
			$registros=mysqli_query($conexion,"SELECT titulo from movies WHERE titulo='$titulo'");
            if(mysqli_num_rows($registros)>0){  
				$select=mysqli_query($conexion,"SELECT genero FROM movies WHERE titulo='$titulo'");
				while($r=mysqli_fetch_array($select)){$nombre_genero=$r['genero'];}
				header("location:peliculas.php?genero=$nombre_genero&pagina=1&estado=3");         
            }else{
			 $Insert=mysqli_query($conexion,"INSERT INTO movies values (00,'$titulo','$generos','$duracion','$descripcion',$puntaje,'$imagen','$anio','$trailer')");
			 header("location:peliculas.php?genero=$generos&esatado=1");
			}
};
if (isset($_POST['Modificar']) && !empty($_POST['Modificar'])) {
	require("conexion.php");
	$titulo = $_POST['titulo'];
	$titulo_anterior=$_POST['titulo_anterior'];
	$genero = $_POST['genero'];
	$duracion = $_POST['duracion'];
	$puntaje = $_POST['puntaje'];
	$imagen = $_POST['imagen'];
	$anio = $_POST['anio'];
	$trailer = $_POST['trailer'];
	$descripcion = $_POST['descripcion'];
	$id = $_POST['id_pelicula'];
	$generos='';
	if(isset($_POST['nombre_genero'])){
	   foreach($_POST['nombre_genero'] as $selected){
		  $generos=$generos.' '.$selected;
	   }
    }
	$Actualizar = "UPDATE movies SET titulo='$titulo',genero='$generos',duracion='$duracion',descripcion='$descripcion',puntaje='$puntaje',imagen='$imagen',anio='$anio',trailer='$trailer' WHERE titulo='$titulo_anterior'";
	$enviar = mysqli_query($conexion, $Actualizar);
	header("location:peliculas.php?genero=$generos&pagina=1&esatado=2");
}
if (isset($_GET['borrar'])) {
	$idPelicula = $_GET['borrar'];
	$select = mysqli_query($conexion, "SELECT genero FROM movies WHERE id_pelicula='$idPelicula'");
	while ($r = mysqli_fetch_array($select)) {
		$genero = $r['genero'];
	}
	$mostrar = mysqli_query($conexion, "select * from movies where id_pelicula='$idPelicula'");
	$delete = mysqli_query($conexion, "delete from usuarios_movies where id_pelicula='$idPelicula'");

	$delete2 = mysqli_query($conexion, "delete from movies where id_pelicula='$idPelicula'");

	header("location:peliculas.php?genero=$genero&eliminado=1");
}
if (isset($_POST['id_pelicula'])) {
	$idPelicula = $_POST['id_pelicula'];
	$ngenero=$_POST['genero'];
	$pagina=$_POST['pagina'];
	$select = mysqli_query($conexion, "SELECT genero FROM movies WHERE id_pelicula='$idPelicula'");
	while ($r = mysqli_fetch_array($select)) {
		$genero = $r['genero'];
	}
	$mostrar = mysqli_query($conexion, "select * from movies where id_pelicula='$idPelicula'");
	$delete = mysqli_query($conexion, "delete from usuarios_movies where id_pelicula='$idPelicula'");

	$delete2 = mysqli_query($conexion, "delete from movies where id_pelicula='$idPelicula'");

	header("location:peliculas.php?genero=$ngenero&pagina=$pagina&eliminado=1");
}
?>