 <?php
   require("conexion.php");
   $nombre=$_REQUEST['nombre'];
   $apellido=$_REQUEST['apellido'];
   $email=$_REQUEST['mail'];
   $password=sha1($_REQUEST['contr']);
        if (isset($_REQUEST['registrado']) && !empty($_REQUEST['registrado'])) {
            $registros=mysqli_query($conexion,"SELECT mail FROM usuarios WHERE mail='$email'");
            if(mysqli_num_rows($registros)>0){ 
                  echo "<script>alert('el mail ingresado esta en uso, intente con otro');</script>";          
                  require("registrarse.html");
            }else{
                $insertar=mysqli_query($conexion,"INSERT INTO usuarios VALUES(00,'$nombre','$apellido','$email','$password')");
                 echo "<script>alert('fue registrado con exito!');</script>";
                 require("login.html");
            }
          
         }
  ?>
