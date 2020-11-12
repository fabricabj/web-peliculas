<!DOCTYPE html>
<html>
<head>
    <title>Inicio</title>
</head>
<body>
   <?php 
      require("header.php");
      require("conexion.php");  
   ?>
   <div class="container">
       <div class="row">
       <div class="col s12">
				<h3 align="center" style="color:white">Buscar</h3>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<input style="width:100%" type="text" id="dato" autofocus="true" placeholder="Ingerse el nombre de la pelicula" onkeyup="buscar()">
            </div>
            <br><br>
		</div>
        <div id="result" style="border: 1px solid white; height: 300px; overflow-y: scroll"></div>
     </div>
   </div>
   <br><br><br><br><br>
       <script src="js/jquery-3.4.1.min.js"></script>
	<script>
		function buscar(){
			if(document.getElementById('dato').value.length>0){
				$.ajax({
					url: 'listar.php',
					type: 'POST',
					data: { 
						dato: document.getElementById('dato').value, 
					},
				})
				.done(function(response){
					$("#result").html(response);
				})
				.fail(function(jqXHR){
					console.log(jqXHR.statusText);
				});
			}else{
                document.getElementById('result').innerHTML="";
			}
		}
    </script>
    <?php require("footer.html");?>
 </body>
</html>
