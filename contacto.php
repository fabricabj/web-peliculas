<!DOCTYPE html>
<html>

<head>
    <title>Contacto</title>
</head>

<body>
    <?php require("header.php") ?>
    <div class="container" style="margin-top: 30px;">
        <div class="row">
            <div class="col-md-12">
                <form class="formulario" action="" onsubmit="return form(this)" style="width:100%; text-align-last:center">
                    <h1 align="center"> Envianos tu consulta</h1>
                    <p>Nombre</p>
                    <input id="nombre" name="nombre" type="text" placeholder="Nombre(requerido)">
                    <br><br>
                    <p>Correo electronico</p>
                    <input id="correo" type="email" name="correo" placeholder="example@example.com">
                    <br><br>
                    <p>Mensaje</p>
                    <textarea id="mensaje" type="text" name="mensaje" placeholder="mensaje aqui"></textarea>
                    <br />
                    <br />
                    <button type="submit" class="btn btn-outline-secondary" onclick="form();">Enviar</button>
                    <br><br>
                </form>
            </div>
        </div>
    </div>
    <?php require("footer.html"); ?>
    <script>
        function init() {
            $('#contacto').attr("class", "");
            $('#contacto').attr("class", "btn btn-danger");
        }
        window.onload = function() {
            init();
        }

        function form(v) {
            ok = true;
            msg = "falta llenar campos: \n";
            if (v.elements["nombre"].value == "") {
                msg += "Nombre\n";
                ok = false;
            }
            if (v.elements["correo"].value == "") {
                msg += "Crreo electronico\n";
                ok = false;
            }
            if (v.elements["mensaje"].value == "") {
                msg += "Mensaje\n";
                ok = false;
            }
            if (ok == false) {
                alert(msg);
                return ok;
            } else {
                alert("mensaje enviado");
            }
        }
    </script>
</body>

</html>