<?php
$id_usuario = 0;
$nombre_usuario = "";
require("conexion.php");
session_start();
if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
  $idgrupo = $_SESSION['grupo'];
  $id_usuario = $_SESSION['login'];
  $nombre_usuario = $_SESSION['usuario'];
}
function CerrarSession()
{
  if (isset($_POST['borrarSesion'])) {
    session_destroy();
    header("location:index.php");
  }
}
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="bootstrap-4.3.1-dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="estilos.css">
</head>

<body style="background:#121212">
  <div class="container">
    <div class="row">
      <div class="col-md-12" style="float:left">
        <nav class="navbar navbar-expand-lg navbar-light">
          <button style="background: white" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand" href="index.php"><img src="img/logo.png" style="width: 150px;height:80px;border-radius: 10px"></a>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto">
              <li class="nav-item">
                <a id="inicio" style="color:white" class="nav-link" href="index.php">Inicio</a>
              </li>
              <li class="dropdown">
                <a id="categoria" style="color:white" class="nav-link  dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categorias</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <form action="peliculas.php?genero=fantasia" method="POST">
                    <button id="fantasia" type="submit" class="dropdown-item">Fantasia</button>
                  </form>
                  <form action="peliculas.php?genero=terror" method="POST">
                    <button id="terror" type="submit" class="dropdown-item">Terror</button>
                  </form>
                  <form action="peliculas.php?genero=accion" method="POST">
                    <button id="accion" type="submit" class="dropdown-item">Accion</button>
                  </form>
                </div>
              </li>
              <li class="nav-item">
                <a id="contacto" style="color:white" class="nav-link" href="contacto.php">Contacto</a>
              </li>
            </ul>
          </div>
          <div style="float: right">
            <?php if ($id_usuario == 0) : ?>
              <nav class="navbar navbar-expand-lg navbar-light">
                <div>
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                      <a href="#" style="color:white" class="btn  dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size:20px;color:white;" class="fas fa-user-circle"></i> Invitado</a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <form action="index.php" method="POST">
                          <button type="submit" class="dropdown-item" name="borrarSesion" onclick="<?php CerrarSession(); ?>">Salir</button>
                        </form>
                      </div>
                    </li>
                  </ul>
                </div>
              </nav>
            <?php else : ?>
              <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                  <div>
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item dropdown">
                        <a href="#" style="color:white" class="btn  dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size:20px;color:white;" class="fas fa-user-circle"></i><?php echo "   " . $nombre_usuario ?></a><span style="color:grey">|</span>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <form action="index.php" method="POST">
                            <button type="submit" class="dropdown-item" name="borrarSesion" onclick="<?php CerrarSession(); ?>">Cerrar Sesión</button>
                          </form>
                        </div>
                      </li>
                      <li>
                        <a id="lista" style="color:white" title="mi lista" href="lista.php" class="btn"><i style="font-size:20px" class="fas fa-bookmark"></i> Mi lista
                          <?php if (isset($_SESSION['login'])) {
                            $idUser = $_SESSION['login'];
                            $consulta = mysqli_query($conexion, "SELECT m.id_pelicula, m.titulo,m.puntaje,
                             m.imagen,um.id_usuario from movies AS m,usuarios_movies AS um
                             where m.id_pelicula=um.id_pelicula and um.id_usuario='$idUser'");
                            $total_lista = mysqli_num_rows($consulta);
                            if ($total_lista > 0) {
                              echo "<button style='border-radius:40px;background:yellow;color:red'>" . $total_lista . "</button>";
                            }
                          }
                          ?>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
            <?php endif; ?>
          </div>
        </nav>
      </div>
    </div>
    <hr style="background:red;height:2px">
  </div>
  <?php if (!isset($_SESSION['login'])) {
    header("location:login.html");
  } ?>
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/2be8605e79.js"></script>
  <script type="text/javascript">
    function lista() {
      alert("debe Iniciar Sesión para acceder a su lista");
    }
  </script>
</body>

</html>