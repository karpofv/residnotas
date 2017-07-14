<?php
include_once 'includes/layout/headp.php';
require 'includes/conf/general_parameters.php';
ini_set('display_errors', false);
ini_set('display_startup_errors', false);
if ($_GET[logaut] == '1') {
  session_cache_limiter('nocache,private');
  session_name($sess_name);
  session_start();
  $sid = session_id();
  session_destroy();
}
?>
  <div class="app app-default">
    <div class="app-container app-login">
        <div class="flex-center">
            <div class="app-header"></div>
            <div class="app-body">
                <div class="loader-container text-center">
                    <div class="icon">
                        <div class="sk-folding-cube">
                            <div class="sk-cube1 sk-cube"></div>
                            <div class="sk-cube2 sk-cube"></div>
                            <div class="sk-cube4 sk-cube"></div>
                            <div class="sk-cube3 sk-cube"></div>
                        </div>
                    </div>
                    <div class="title">Logging in...</div>
                </div>
                <div class="app-block">
                    <div class="app-form">
                        <div class="form-header">
                            <?php
                            if (isset($_GET['error_login'])) {
                                $error = $_GET['error_login']; ?>
                            <div class="alert-danger" id="alerta-msg"> <a class="close" data-dismiss="alert">&times;</a> <strong>Accion!</strong>
                                <?php echo $error_login_ms[$error];
                                ?>
                            </div>
                            <?php
                            }
                            ?>
                            <div class="app-brand"><span class="highlight">Control de </span> Evaluaciones</div>
                        </div>
                        <form action="index2.php" id="login-validation" class="col-md-12 center-margin" method="post" enctype="multipart/form-data">
                            <div class="input-group"> <span class="input-group-addon" id="basic-addon1">
                                <i class="fa fa-user" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="Usuario" aria-describedby="basic-addon1" id="user" name="user"> </div>
                            <div class="input-group"> <span class="input-group-addon" id="basic-addon2">
                                <i class="fa fa-key" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" placeholder="Contraseña" aria-describedby="basic-addon2" id="pass" name="pass"> </div>
                            <div class="text-center">
                                <input type="submit" class="btn btn-success btn-submit" value="Ingresar"> </div>
                        </form>
                        <div class="form-footer">
                        </div>
                    </div>
                </div>
            </div>
            <div class="app-footer"> </div>
        </div>
    </div>
</div>
    <?php
include_once("includes/layout/footp.php");
?>