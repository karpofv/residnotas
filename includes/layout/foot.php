
</div>
<footer class="app-footer">
    <div class="row">
        <div class="col-xs-12">
            <div class="footer-copyright"> Copyright © 2017 Control de evaluaciones residentes. </div>
        </div>
    </div>
</footer>
<script>
    function cerrar() {
        $("#alerta-msg").fadeOut(1000);
        $("#alerta-msg").addClass("collapse");
    }

    function cerrarmodal() {
        $("#ventanaVer").html('');
    }
</script>
<script type="text/javascript" src="<?php echo $ruta_base;?>assets/js/vendor.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base;?>assets/js/app.js"></script>
</body>

</html>