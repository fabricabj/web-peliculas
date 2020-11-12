<?php
$peliculas = "";
$idUser = "";
if (isset($_GET['genero'])) {
    $peliculas = $_GET['genero'];
} else {
    $peliculas = "fantasia";
}

switch ($peliculas) {
    case 'fantasia':
        $rs = mostrarPeliculas($peliculas);
        echo "<script>$('#fantasia').css('background','#212121');$('#fantasia').css('color','white'); </script>";
        break;
    case 'terror':
        $rs = mostrarPeliculas($peliculas);
        echo "<script>$('#terror').css('background','#212121');$('#terror').css('color','white');</script>";
        break;
    case 'accion':
        $rs = mostrarPeliculas($peliculas);
        echo "<script>$('#accion').css('background','#212121');$('#accion').css('color','white');</script>";
        break;

    default:
        $rs = mostrarPeliculas($peliculas);
        break;
}
function mostrarPeliculas($peliculas)
{
    require("conexion.php");
    $consulta = mysqli_query($conexion, "SELECT * FROM movies where genero='$peliculas'");
    $peliculas_x_pag = 4;
    $total_peliculas = mysqli_num_rows($consulta);
    $paginas = $total_peliculas / $peliculas_x_pag;
    $paginas = ceil($paginas);
?>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Peliculas</title>
    </head>
    <body>
        <?php
        require("header.php");
        if (isset($_SESSION['login'])) {
            $idUser = $_SESSION['login'];
        }
        ?>
        <div class="container">
            <div class="row">
                <?php
                if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
                    $idgrupo = $_SESSION['grupo'];
                    if ($idgrupo == 1) { ?>
                        <div class="col-md-12" style="padding-top: 10px">
                            <ul class="nav justify-content-center">
                                <li class="nav-item">
                                    <a id="nuevoProducto" class="btn btn-dark" href="altaMod.php"><i class="far fa-arrow-alt-circle-up"></i> Cargar</a>
                                </li>
                            </ul>
                        </div>
                    <?php
                    }
                }
                if (isset($_GET['pagina'])) {
                    $iniciar = ($_GET['pagina'] - 1) * $peliculas_x_pag;
                    $consulta2 = mysqli_query($conexion, "SELECT * FROM movies WHERE genero='$peliculas' ORDER BY anio DESC limit $iniciar,$peliculas_x_pag");
                    while ($r = mysqli_fetch_array($consulta2)) { ?>
                        <div align="center" class="col-md-3" style="padding:1%;">
                            <div class="card" style="width: 12.5rem;background:#212121;color:white">
                                <img src="<?php echo $r['imagen']; ?>" class="card-img-top">
                                <p><?php echo "<i class='fas fa-star'></i>" . $r['puntaje']; ?></p>
                                <div class="card-body" style="height:70px">
                                    <p align="center" class="card-text"><?php echo $r['titulo']; ?></p>
                                </div>
                                <br>
                                <?php if (isset($_SESSION['login']) && $_SESSION['login'] > 0) { ?>
                                    <a style="botton:0%;position:absolute" class="btn btn-dark card-text" href="peliculas.php?id_pelicula=<?php echo $r['id_pelicula']; ?>&genero=<?php echo $peliculas; ?>&estado=1"><i class="fas fa-bookmark"></i></a>
                                    <a class="btn btn-dark card-text" href="peliculas.php?id_pelicula=<?php echo $r['id_pelicula']; ?>&genero=<?php echo $peliculas; ?>&estado=1"><i class="fas fa-bookmark"></i> Añadir a la lista</a>
                                <?php } else { ?>
                                    <a style="botton:0%;position:absolute" class="btn btn-dark card-text" href="#" onclick="lista();"><i class="fas fa-bookmark"></i></a>
                                    <a class="btn btn-dark card-text" href="#" onclick="lista();"><i class="fas fa-bookmark"></i> Añadir a la lista</a>
                                <?php  } ?>
                                <div>
                                    <?php
                                    if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
                                        if ($idgrupo == 1) {
                                    ?>
                                            <form method="GET" action="altaMod.php">
                                                <button style="float: left;margin: 5px;border-radius:30px" type="submit" name="id_pelicula" value="<?php echo $r['id_pelicula']; ?>" class="btn btn-dark"><i class="fas fa-pencil-alt"></i></button>
                                            </form>
                                            <a style="float: left;margin: 5px;border-radius:30px" class="btn btn-dark" href="#" data-toggle="modal" data-target="#info<?php echo $r['id_pelicula']; ?>"><i class="fas fa-trash-alt"></i></a>
                                    <?php }
                                    } ?>
                                    <div style="padding-top:5px;">
                                        <a title="más informacion" style="float: right;margin-right:5px;border-radius:30px" class="btn btn-dark card-text" href="#" data-toggle="modal" data-target="#info<?php echo $r['id_pelicula']; ?>"><i class="fas fa-info-circle"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div align="center" data-backdrop="static" class="modal" id="info<?php echo $r['id_pelicula']; ?>">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header" style="background:#212121;color:white">
                                        <h4 class="modal-title">informacion</h4>
                                        <button style="color:white" type="button" class="close" data-dismiss="modal">X</button>
                                    </div>
                                    <div class="modal-body" style="background:#121212;color:white">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="<?php echo $r['imagen']; ?>" style="width:50%"><br>
                                            </div>
                                            <div class="col-md-6">
                                                <h6><strong>Titulo: </strong><?php echo $r['titulo']; ?></h6>
                                                <h6><strong>Genero: </strong><?php echo $r['genero']; ?></h6>
                                                <h6><strong>Duracion: </strong><?php echo $r['duracion']." min"; ?></h6>
                                                <h6><strong>puntaje: </strong><?php echo "<i class='fas fa-star'></i>" .$r['puntaje']; ?></h6>
                                                <h6><strong>Año: </strong><?php echo $r['anio']; ?></h6>
                                                <h6 align="center"><strong>Descripcion </strong></h6>
                                                <h6><?php echo $r['descripcion']; ?></h6>
                                            </div>
                                            <?php if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
                                                if ($idgrupo == 1) { ?>
                                                    <div class="col-md-6">
                                                        <br>
                                                        <a class="btn btn-dark" href="ABM.php?borrar=<?php echo $r['id_pelicula']; ?>">Eliminar</a>
                                                    </div>
                                            <?php }
                                            } ?>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <div class="container" style="padding-top:40px">
                        <nav arial-label="page navigation">
                            <ul class="pagination justify-content-center">
                                <li class="page-item <?php echo $_GET['pagina'] <= 1 ? 'disabled' : '' ?>"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=<?php echo $_GET['pagina'] - 1 ?>">Anterior</a></li>
                                <?php for ($i = 1; $i <= $paginas; $i++) : ?>
                                    <li class="page-item <?php echo $_GET['pagina'] == $i ? 'active' : '' ?>"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=<?php echo $i ?>"><?php echo $i ?></a></li>
                                <?php endfor ?>
                                <li class="page-item <?php echo $_GET['pagina'] >= $paginas ? 'disabled' : '' ?>"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=<?php echo $_GET['pagina'] + 1 ?>">Siguiente</a></li>
                            </ul>
                        </nav>
                    </div>
                    <?php
                } else {
                    $consulta3 = mysqli_query($conexion, "SELECT * FROM movies WHERE genero='$peliculas' ORDER BY anio DESC limit $peliculas_x_pag");
                    while ($r = mysqli_fetch_array($consulta3)) { ?>
                        <div align="center" class="col-md-3" style="padding:1%;">
                            <div class="card" style="width: 12.5rem;background:#212121;color:white">
                                <img src="<?php echo $r['imagen']; ?>" class="card-img-top">
                                <p><?php echo "<i class='fas fa-star'></i>" . $r['puntaje']; ?></p>
                                <div class="card-body" style="height:70px">
                                    <p align="center" class="card-text"><?php echo $r['titulo']; ?></p>
                                </div>
                                <br>
                                <?php if (isset($_SESSION['login']) && $_SESSION['login'] > 0) { ?>
                                    <a style="botton:0%;position:absolute" class="btn btn-dark card-text" href="peliculas.php?id_pelicula=<?php echo $r['id_pelicula']; ?>&genero=<?php echo $peliculas; ?>&estado=1"><i class="fas fa-bookmark"></i></a>
                                    <a class="btn btn-dark card-text" href="peliculas.php?id_pelicula=<?php echo $r['id_pelicula']; ?>&genero=<?php echo $peliculas; ?>&estado=1"><i class="fas fa-bookmark"></i> Añadir a la lista</a>
                                <?php } else { ?>
                                    <a style="botton:0%;position:absolute" class="btn btn-dark card-text" href="#" onclick="lista();"><i class="fas fa-bookmark"></i></a>
                                    <a class="btn btn-dark card-text" href="#" onclick="lista();"><i class="fas fa-bookmark"></i> Añadir a la lista</a>
                                <?php  } ?>
                                <div>
                                    <?php
                                    if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
                                        if ($idgrupo == 1) {
                                    ?>
                                            <form method="GET" action="altaMod.php">
                                                <button style="float: left;margin: 5px;border-radius:30px" type="submit" name="id_pelicula" value="<?php echo $r['id_pelicula']; ?>" class="btn btn-dark"><i class="fas fa-pencil-alt"></i></button>
                                            </form>
                                            <a style="float: left;margin: 5px;border-radius:30px" class="btn btn-dark" href="#" data-toggle="modal" data-target="#info<?php echo $r['id_pelicula']; ?>"><i class="fas fa-trash-alt"></i></a>
                                    <?php }
                                    } ?>
                                    <div style="padding-top:5px;">
                                        <a title="más informacion" style="float: right;margin-right:5px;border-radius:30px" class="btn btn-dark card-text" href="#" data-toggle="modal" data-target="#info<?php echo $r['id_pelicula']; ?>"><i class="fas fa-info-circle"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-backdrop="static" class="modal" id="info<?php echo $r['id_pelicula']; ?>">
                            <div align="center" class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header" style="background:#212121;color:white">
                                        <h4 class="modal-title">informacion</h4>
                                        <button style="color:white" type="button" class="close" data-dismiss="modal">X</button>
                                    </div>
                                    <div class="modal-body" style="background:#121212;color:white">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="<?php echo $r['imagen']; ?>" style="width:50%"><br>
                                            </div>
                                            <div class="col-md-6">
                                                <h6><strong>Titulo: </strong><?php echo $r['titulo']; ?></h6>
                                                <h6><strong>Genero: </strong><?php echo $r['genero']; ?></h6>
                                                <h6><strong>Duracion: </strong><?php echo $r['duracion']." min"; ?></h6>
                                                <h6><strong>puntaje: </strong><?php echo "<i class='fas fa-star'></i>".$r['puntaje']; ?></h6>
                                                <h6><strong>Año: </strong><?php echo $r['anio']; ?></h6>
                                                <h6 align="center"><strong>Descripcion </strong></h6>
                                                <h6><?php echo $r['descripcion']; ?></h6>
                                            </div>
                                            <?php if (isset($_SESSION['login']) && $_SESSION['login'] > 0) {
                                                if ($idgrupo == 1) { ?>
                                                    <div class="col-md-6">
                                                        <br>
                                                        <a class="btn btn-dark" href="ABM.php?borrar=<?php echo $r['id_pelicula']; ?>">Eliminar</a>
                                                    </div>
                                            <?php }
                                            } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                    <div class="container" style="padding-top:40px">
                        <nav arial-label="page navigation">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled"><a class="page-link " href="#">Anterior</a></li>
                                <li class="page-item active"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=1">1</a></li>
                                <?php for ($i = 2; $i <= $paginas; $i++) : ?>
                                    <li class="page-item"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=<?php echo $i ?>"><?php echo $i ?></a></li>
                                <?php endfor ?>
                                <li class="page-item"><a class="page-link" href="peliculas.php?genero=<?php echo $peliculas; ?>&pagina=2">Siguiente</a></li>
                            </ul>
                        </nav>
                    </div>
            </div>
        </div>
<?php
                }
                if (isset($_GET['eliminado']) && $_GET['eliminado'] == 1) {
                    echo "<script>alert('la pelicula ha sido eliminada');</script>";
                }
                if (isset($_GET['id_pelicula']) && (isset($_GET['estado']) && $_GET['estado'] == 1)) {
                    $idPelicula = $_GET['id_pelicula'];
                    $prod = mysqli_query($conexion, "select * from usuarios_movies where id_usuario='$idUser' and id_pelicula='$idPelicula'");
                    if (mysqli_num_rows($prod) > 0) {
                        echo "<script>alert('no puede agregar una pelicula que ya se encuentra en la lista');</script>";
                    } else {
                        $insertar = mysqli_query($conexion, "insert into usuarios_movies(id_usuario,id_pelicula)values('$idUser','$idPelicula')");
                        if ($insertar == 1) {
                            header("location:peliculas.php");
                        }
                    }
                }
            }
?>
</div>
</div>
<script>
    function lista() {
        alert("debe iniciar sesion para poder agregar peliculas a la lista");
    }

    function init() {
        $('#categoria').attr("class", "");
        $('#categoria').attr("class", " dropdown-toggle btn btn-danger");
    }
    window.onload = function() {
        init();
    }
</script>
<?php
require("footer.html")
?>

    </body>
</html>