<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<?php
	$codigo = $_POST[codigo];
	$cedula = $_POST[cedula];
	$nombre = $_POST[nombre];
	$apellido = $_POST[apellido];
	$direccion = $_POST[direccion];
	$anual = $_POST[anual];
	$telefono = $_POST[telefono];
	$anual = $_POST[anual];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($editar=='1' and $codigo=="" and $nombre!=""){
    paraTodos::showMsg("$editar", "", "");        
		$consul = paraTodos::arrayConsultanum("res_cedula", "residente", "res_cedula=$cedula");
		if ($consul>0){
			paraTodos::showMsg("Esta persona ya se encuentra registrada", "alert-danger");
		} else{
			paraTodos::arrayInserte("res_cedula, res_nombre, res_apellido, res_direccion, res_telefono, res_anual", "residente", "'$cedula', '$nombre', '$apellido', '$direccion', '$telefono', '$anual'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $nombre =="" and $codigo!=""){
        $consulta = paraTodos::arrayConsulta("*", "residente p", "p.res_codigo=$codigo");
		foreach($consulta as $row){
		  $cedula = $row[res_cedula];
		  $nombre = $row[res_nombre];
		  $apellido = $row[res_apellido];
		  $direccion = $row[res_direccion];
		  $telefono = $row[res_telefono];
		  $anual = $row[res_anual];
		}
	}
	/*UPDATE*/
	if($editar == 1 and $nombre !="" and $codigo!=""){
		paraTodos::arrayUpdate("res_cedula=$cedula, res_nombre='$nombre', res_apellido='$apellido', res_telefono='$telefono', res_direccion='$direccion', res_anual='$anual'", "residente", "res_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("res_codigo=$codigo", "residente");
	}
?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"> Residentes </div>
                <div class="card-body">
                    <div class="row">
                        <table class="table table-hover" id="personal">
                            <thead>
                                <tr>
                                    <td class="text-center"><strong>Año</strong></td>
                                    <td class="text-center"><strong>Cédula</strong></td>
                                    <td class="text-center"><strong>Nombre y Apellido</strong></td>
                                    <td class="text-center"><strong>Servicio</strong></td>
                                    <td class="text-center"><strong>Rotación</strong></td>
                                    <td class="text-center"><strong>Examen</strong></td>
                                    <td class="text-center"><strong>Actividades diarias</strong></td>
                                    <td class="text-center"><strong>Evaluar</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
								            $consulsol = paraTodos::arrayConsulta("*", "tools_anual,residente p left join evaluacion e on e.eval_rescodigo=p.res_codigo", "p.res_anual=anual_codigo");
foreach($consulsol as $row){
?>
                                    <tr>
                                        <td class="text-center">
                                            <?php echo $row[anual_descripcion];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[res_cedula];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo utf8_decode($row[res_nombre]." ".$row[res_apellido]);?>
                                        </td>s
                                        <td class="text-center">
                                            <?php echo $row[eval_servicio];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[eval_rotacion];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[eval_examen];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[eval_activi];?>
                                        </td>
                                        <td class="text-center">
                                            <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[res_codigo];?>,
                                                            ver 	: 2,
                                                            act     :2
                                                        },
                                                        success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-edit"></i>
									               </a> 
                                        </td>
                                    </tr>
                                    <?php
								            }
?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#personal').DataTable({
            "language": {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            }
        });
    </script>