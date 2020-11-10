
<?php
require("conexion.php");
if (isset($_POST['guardar']) && !empty($_POST['guardar'])) {
	$resultado = 0;
	if (!empty($_POST['titulo']) && (!empty($_POST['puntaje']) && is_numeric($_POST['puntaje']))) {
		$resultado = Guardar();
		if ($resultado == 1) {
			header("location:altaMod.php?estado=$resultado");
		}
	} else {
		header("location:altaMod.php?estado=$resultado");
	}
};
if (isset($_POST['Modificar']) && !empty($_POST['Modificar'])) {
	require("conexion.php");
	$titulo = $_POST['titulo'];
	$genero = $_POST['genero'];
	$duracion = $_POST['duracion'];
	$puntaje = $_POST['puntaje'];
	$imagen = $_POST['imagen'];
	$anio = $_POST['anio'];
	$descripcion = $_POST['descripcion'];
	$id = $_POST['id_pelicula'];
	$Actualizar = "UPDATE movies SET titulo='$titulo',genero='$genero',duracion='$duracion',descripcion='$descripcion',puntaje='$puntaje',imagen='$imagen',anio='$anio' WHERE id_pelicula='$id'";
	$enviar = mysqli_query($conexion, $Actualizar);
	header("location:altaMod.php?id_pelicula=$id&estado=1");
}
function Guardar()
{
	require("conexion.php");
	$titulo = $_POST['titulo'];
	$genero = $_POST['genero'];
	$duracion = $_POST['duracion'];
	$puntaje = $_POST['puntaje'];
	$imagen = $_POST['imagen'];
	$trailer = $_POST['anio'];
	$descripcion = $_POST['descripcion'];
	$anio = $_POST['anio'];
	$Insert = "INSERT INTO movies values (00,'$titulo','$genero','$duracion','$descripcion',$puntaje,'$imagen','$anio')";
	$enviar = mysqli_query($conexion, $Insert);
	return $enviar;
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
?>