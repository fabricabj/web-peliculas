<?php 	
	session_start();
	require("conexion.php");
	if (isset($_POST['ingresar'] )&& !empty($_POST['ingresar'])) {
		$usuario=$_POST['usuario'];
		$password=sha1($_POST['contra']);
			$consulta= mysqli_query($conexion,"SELECT * FROM usuarios where mail='$usuario' and contr='$password'"); 
			if($p=mysqli_fetch_assoc($consulta)){
		  		if ($p['mail']==$usuario && $p['contr']==$password) {
					$id=$p['id_usuario'];
                    $_SESSION['grupo']=$p['id_grupo'];
		  			$_SESSION['login']=$p['id_usuario'];
		  			$_SESSION['usuario']=$p['nombre'];
                    header("location:index.php?usuario=$id");
		  		}
			}else{
				echo "<script>alert('usuario o contraseña incorrectos');</script>";
				require("login.html");		
			}
		}
			if (isset($_GET['invitado'])&& $_GET['invitado']==1){
				$_SESSION['login']=0;
				header("location:index.php");
		  }
		
 ?>