 <?php
        $nombre=$_REQUEST['nombre'];
        $apellido=$_REQUEST['apellido'];
        $user=$_REQUEST['mail'];
        $pass=sha1($_REQUEST['contr']);
        $grupo=2;
        require("conexion.php");
        if (isset($_REQUEST['registrado']) && !empty($_REQUEST['registrado'])) {
          if (!empty($nombre) && !empty($apellido) && !empty($user) && !empty($pass)) {
          $registros=mysqli_query($conexion,"select mail from usuarios where mail='$user'")or die("error de base de datos");
            if(mysqli_num_rows($registros)>0){ 
                  echo "<script>alert('el mail ingresado esta en uso, intente con otro');</script>";          
                  require("registrarse.html");
            }else{
                mysqli_query($conexion,"insert into usuarios(nombre,apellido,mail,contr,id_grupo)values 
                  ('$nombre','$apellido','$user','$pass',$grupo)")or die("error de base de datos");
                  echo "<script>alert('fue registrado con exito!');</script>";
                  require("login.html");
           }
           }
         }
  ?>
