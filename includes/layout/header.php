<nav class="navbar navbar-top" id="navbar">
    <div class="container-fluid">
        <div class="navbar-collapse collapse in banner">
            <ul class="nav navbar-nav navbar-mobile">
                <li>
                    <button type="button" class="sidebar-toggle"> <i class="fa fa-bars"></i> </button>
                </li>
                <li class="logo"> <a class="navbar-brand" href="#"><span class="highlight">Calificación</span> Residentes</a> </li>
                <li>
                    <button type="button" class="navbar-toggle"> <img class="profile-img" src="<?php echo $ruta_base;?>assets/images/profile.png"> </button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li class="navbar-title">Inicio</li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown profile">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"> <img class="profile-img" src="<?php echo $ruta_base;?>assets/images/profile.png">
                        <div class="title">Profile</div>
                    </a>
                    <div class="dropdown-menu">
                        <div class="profile-info">
                            <h4 class="username"><?php echo $_SESSION[user_name];?></h4>
                        </div>
                        <ul class="action">
                            <li>
                                <a href="accion.php?salir=1">Salir</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="ventanaVer" class="modal-open"> </div>
