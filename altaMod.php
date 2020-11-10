<!DOCTYPE html>
 <html>
   <head>
    <title><?php if (isset($_GET['id_pelicula'])) { echo "Modificar Pelicula";}else{echo "Alta Pelicula";}?></title> 
   </head>
   <body>
   <?php require ("header.php");?>
    <div class="container" style="padding-top:40px;">
		<div class="row">
            <div align="center" class="col-md-12 alta">
            <?php 
    require ("conexion.php");
    if (isset($_GET['id_pelicula'])) {
       $idPelicula=$_GET['id_pelicula'];
       $consulta="SELECT * FROM movies where id_pelicula='$idPelicula';";
       $resultado=mysqli_query($conexion,$consulta);
       while ($rs=mysqli_fetch_array($resultado)) {
           $id=$rs['id_pelicula'];
           $titulo=$rs['titulo'];
           $genero=$rs['genero'];
           $duracion=$rs['duracion'];
           $puntaje=$rs['puntaje'];
           $imagen=$rs['imagen'];
           $anio=$rs['anio'];
           $descripcion=$rs['descripcion'];
       }
 
   ?>
    <form method="POST" action="ABM.php" style="width:50%">
  <div class="form-row">
    <div class="form-group col-md-8">
      <label>Titulo</label>
      <input type="text" class="form-control" name="titulo" id="titulo" value="<?php echo $titulo;?>" required>
    </div>
    <div class="form-group col-md-4">
      <label>Duracion</label>
      <input type="text" class="form-control" name="duracion" id="duracion" value="<?php echo $duracion;?>" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-8">
					
                    <label for="selectGenero">Género</label>
                    <select class="form-control" id="selectGenero" name="genero">
                       <option value="fantasia" <?php if($genero=='fantasia') echo 'Selected'?>>fantasia</option>
                       <option value="terror" <?php if($genero=='terror') echo 'Selected'?>>terror</option>
                       <option value="accion" <?php if($genero=='accion') echo 'Selected'?>>accion</option>
                    </select>
                
            </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Puntaje</label>
      <input type="text" class="form-control" name="puntaje" id="puntaje" value="<?php echo $puntaje;?>" required>
      <input type="text" class="form-control" name="id_pelicula" id="id_pelicula" value="<?php echo $id;?>" hidden>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-8">
      <label>imagen</label>
      <input type="text" class="form-control" value="<?php echo $imagen;?>" name="imagen" id="imagen" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Año</label>
      <input type="text" class="form-control" value="<?php echo $anio;?>" name="anio" id="anio">
    </div>
  </div>
  <div class="form-group">
   
    <label>Descripcion</label>
    <input type="text" class="form-control" value="<?php echo $descripcion;?>" name="descripcion" id="descripcion">
    
  </div>
  <button type="submit" class="btn btn-dark" name="Modificar" value="Modificar">Modificar</button>
</form>
<?php 
    if (isset($_GET['estado'])&& $_GET['estado']==1) {
	     echo "<script type='text/javascript'>alert('Datos Modificados');</script>";
      }
}else{?>

<form method="POST" action="ABM.php" style="width:50%">
  <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputEmail4">Titulo</label>
      <input type="text" class="form-control" name="titulo" id="titulo" required placeholder="ingrese nombre de la pelicula">
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Duracion</label>
      <input type="text" class="form-control" name="duracion" id="duracion" required placeholder="ingrese solo numeros">
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-8">
					
                    <label for="selectGenero">Género</label>
                    <select class="form-control" id="selectGenero" name="genero">
                       <option>Fantasia</option>
                       <option>Terror</option>
                       <option>Accion</option>
                    </select>
                
            </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Puntaje</label>
      <input type="text" class="form-control" name="puntaje" id="puntaje" required placeholder="ingrese solo numeros">
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-8">
      <label for="inputEmail4">imagen</label>
      <input type="text" class="form-control" name="imagen" id="imagen" required placeholder="ingrese link de la imagen">
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">año</label>
      <input type="text" class="form-control" name="anio" id="anio" required placeholder="ingrese solo numeros enteros">
    </div>
  </div>
  <div class="form-group">
   
    <label for="inputEmail4">Descripcion</label>
    <textarea type="text" class="form-control" name="descripcion" id="descripcion" required placeholder="ingrese descripcion de la pelicula"></textarea>
    
  </div>
  <button type="submit" class="btn btn-dark" name="guardar" value="guardar">Cargar</button>
</form>
<?php
if (isset($_GET['estado'])&& $_GET['estado']==1) {
	echo "<script type='text/javascript'>alert('Datos Guardados');</script>";
	
}
}

 ?>
 </div>
</div>
</div>
        <br><br><br>
		<?php require ("footer.html"); ?>
   </body>
</html>