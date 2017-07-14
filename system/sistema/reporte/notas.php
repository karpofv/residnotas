<?php
    $anual = $_POST[ano];
    if($anual!=""){
        $collapse ='';        
    } else {
        $collapse ='collapse';
    }
?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"> Lsitado de Residentes por año </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-xs-10">
                            <label class="control-label">Seleccione el Año</label>
                            <select id="txtanual" class="form-control">
                                <option value="0">Seleccione un año</option>
                                <?php
                                combos::CombosSelect("1", "$anual", "*", "tools_anual", "anual_codigo", "anual_descripcion", "1=1 order by anual_codigo");
                                ?>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <br> <a class="<?php echo $collapse;?> btn btn-default" href="accion.php?dmn=<?php echo $idMenut;?>&ver=2&act=2&anual=<?php echo $anual;?>" target="_blank">Imprimir</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#txtanual').on("change", function () {
             var anual = $("#txtanual").val();
            $.ajax({
                type: 'POST'
                , url: 'accion.php'
                , ajaxSend: $('#page-content').html(cargando)
                , data: {
                    dmn: <?php echo $idMenut;?>,
                    ver:2,
                    ano: anual,
                    editar : 1
                }
                , success: function (html) {
                    $('#page-content').html(html);
                }
                , error: function (xhr, msg, excep) {
                    alert('Error Status ' + xhr.status + ': ' + msg + '/ ' + excep);
                }
            });
            return false;
        });
    </script>