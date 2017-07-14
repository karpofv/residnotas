<?php
    $codigo = $_POST[codigo];
    $activi = $_POST[activi];
    $serv = $_POST[serv];
    $rota = $_POST[rota];
    $anual = $_POST[anual];
    $examen = $_POST[examen];
    $evalua = $_POST[evalua];
    $editar = $_POST[editar];
    if($editar==1 and $serv!=""){
        $consulnotas = paraTodos::arrayConsultanum("eval_codigo", "evaluacion", "eval_rescodigo=$codigo and eval_anual=$anual");
        if($consulnotas>0){
            $update = paraTodos::arrayUpdate("eval_percodigo='$evalua',eval_servicio='$serv', eval_anual='$anual', eval_rotacion='$rota', eval_examen='$examen', eval_activi='$activi'", "evaluacion", "eval_rescodigo=$codigo and eval_anual=$anual");
            
        } else{
            $insertar = paraTodos::arrayinserte("eval_rescodigo, eval_percodigo,eval_servicio, eval_anual, eval_rotacion, eval_examen, eval_activi", "evaluacion", "$codigo, $evalua,'$serv', $anual, $rota, $examen, '$activi'");
        }
        $editar="";
    }
    if($editar==""){
        $consulresidente = paraTodos::arrayConsulta("*", "residente", "res_codigo=$codigo");
        foreach($consulresidente as $residente){
            $anual = $residente[res_anual];
        }
        $consulnota = paraTodos::arrayConsulta("*", "evaluacion", "eval_rescodigo=$codigo");
        foreach($consulnota as $nota){
            $activi = $nota[eval_activi];
            $rota = $nota[eval_rotacion];
            $examen = $nota[eval_examen];
            $evalua = $nota[eval_percodigo];
            $serv = $nota[eval_servicio];
        }
    }
?>
<div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: block; padding-right: 17px;">
      <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cerrarmodal();"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title">Evaluación de residentes</h4>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-sm-12">
                      <label class="control-label">Evaluador</label>
                      <select id="txtevalua" class="form-control">
                          <option value="0">Seleccion médico evaluador</option>
                          <?php
                          combos::CombosSelect("1", "$evalua", "per_codigo, concat(per_cedula,'-', per_nombres, ' ', per_apellidos) as descrip", "personal", "per_codigo", "descrip", "1=1 order by per_cedula");
                          ?>
                      </select>
                  </div>
                  <div class="col-sm-4">
                      <label class="control-label">Servicio</label>
                      <input type="text" class="form-control" id="txtservicio" value="<?php echo $serv;?>">
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label">Rotación 60%</label>                      
                      <input type="number" class="form-control" id="rotacion" min="0" max="20" value="<?php echo $rota;?>">
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label">Examen 30%</label>
                      <input type="number" class="form-control" id="examen" min="0" max="20" value="<?php echo $examen;?>">
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label">Actividades diarias 10%</label>
                      <input type="number" class="form-control" id="activi" min="0" max="20" value="<?php echo $activi;?>">
                  </div>
                  <div class="col-sm-2">
                      <br>
                      <button type="button" class="btn btn-default" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $codigo;?>,
                                                            anual 	: <?php echo $anual;?>,
                                                            rota 	: $('#rotacion').val(),
                                                            examen 	: $('#examen').val(),
                                                            activi 	: $('#activi').val(),
                                                            serv 	: $('#txtservicio').val(),
                                                            evalua 	: $('#txtevalua').val(),
                                                            editar 	: 1,
                                                            ver 	: 2,
                                                            act     :2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;">Guardar</button>
                  </div>
              </div>
              <div class="row">
                  <div class="col-sm-4">
                      <label class="control-label"><?php echo $serv;?></label>
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label"><?php echo number_format(($rota*60)/100, 2, ",", ".");?> Pts.</label>
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label"><?php echo number_format(($examen*30)/100, 2, ",", ".");?> Pts.</label>
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label"><?php echo number_format(($activi*30)/100, 2, ",", ".");?> Pts.</label>
                  </div>
                  <div class="col-sm-2">
                      <label class="control-label">Total <?php echo number_format((($rota*60)/100)+(($examen*60)/100)+(($activi*30)/100), 2, ",", ".");?> Pts.</label>
                  </div>
              </div>                  
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal" onclick="cerrarmodal();">Cerrar</button>
          </div>
        </div>
      </div>
    </div>