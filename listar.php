<?php 
session_start();
  $idgrupo = $_SESSION['grupo'];
  $id_usuario=$_SESSION['login'];
?>
<table class="table striped" style="color:white">
	<thead>
        <th>Titulo</th>
        <th>Genero</th>
		<th>Duracion</th>
		<th>Descripcion</th>
        <th>Puntaje</th>
        <th>Anio</th>
        <th></th>
        <th></th>
	</thead>
	<tbody>
		<?php
		$dato = strtoupper($_REQUEST['dato']);
		require("conexion.php");
        $cant = 0;
		$sql = "SELECT * FROM deletepeliculas WHERE (titulo LIKE'$dato%')";
        $result = mysqli_query($conexion, $sql);
		$cant = mysqli_num_rows($result);
        mysqli_close($conexion);
                  while($row=mysqli_fetch_array($result)){?>
                    <tr>
				<td>
					<?php echo $row['titulo'];?>
				</td>
				<td>
					<?php echo $row['genero'];?>
                </td>
                <td>
					<?php echo $row['duracion'];?>
				</td>
				<td>
					<?php echo $row['descripcion'];?>
                </td>
                <td>
					<?php echo $row['puntaje'];?>
				</td>
				<td>
					<?php echo $row['anio'];?>
				</td>
				<!--<td>
				   <form method="POST" action="altanew.php">
					   <input type="text" id="id_pelicula" name="id_pelicula" value="<?php echo $row['id_pelicula'];?>" hidden>
                      <button  class="btn btn-dark" style="margin-top: 3%;width: 100%;" name="alta" value="alta"><i class="far fa-arrow-alt-circle-up"></i>Alta pelicula</button>
                  </form>    
				</td>-->
            </tr>
                <?php }?>
	</tbody>
</table>