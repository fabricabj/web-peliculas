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
		$sql = "SELECT * FROM movies WHERE (titulo LIKE'$dato%')";
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
            </tr>
                <?php }?>
	</tbody>
</table>