<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<?php
	$codigo = $_POST[codigo];
	$cedula = $_POST[cedula];
	$nombre = $_POST[nombre];
	$apellido = $_POST[apellido];
	$telefono = $_POST[telefono];
	$correo = $_POST[correo];
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($editar=='1' and $codigo=="" and $nombre!=""){
    paraTodos::showMsg("$editar", "", "");        
		$consul = paraTodos::arrayConsultanum("per_cedula", "personal", "per_cedula=$cedula");
		if ($consul>0){
			paraTodos::showMsg("Esta persona ya se encuentra registrada", "alert-danger");
		} else{
			paraTodos::arrayInserte("per_cedula, per_nombres, per_apellidos, per_telefonos, per_correo", "personal", "'$cedula', '$nombre', '$apellido', '$telefono', '$correo'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $nombre =="" and $codigo!=""){
        $consulta = paraTodos::arrayConsulta("*", "personal p", "p.per_codigo=$codigo");
		foreach($consulta as $row){
		  $cedula = $row[per_cedula];
		  $nombre = $row[per_nombres];
		  $apellido = $row[per_apellidos];
		  $telefono = $row[per_telefonos];
		  $correo = $row[per_correo];
		}
	}
	/*UPDATE*/
	if($editar == 1 and $nombre !="" and $codigo!=""){
		paraTodos::arrayUpdate("per_cedula=$cedula, per_nombres='$nombre', per_apellidos='$apellido', per_telefonos='$telefono', per_correo='$correo'", "personal", "per_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("per_codigo=$codigo", "personal");
	}
?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"> Doctores </div>
                <div class="card-body">
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="form-group" style="display: block;">
                                <label class="col-sm-2 control-label" for="cedula">Cédula</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="cedula" type="number" value="<?php echo $cedula; ?>">
                                    <input class="form-control collapse" id="codigo" type="number" value="<?php echo $codigo; ?>"> </div>
                            </div>
                            <div class="form-group" style="display: block;">
                                <label class="col-sm-2 control-label" for="nombre">Nombres</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="nombre" type="text" value="<?php echo $nombre;?>"> </div>
                            </div>
                            <div class="form-group" style="display: block;">
                                <label class="col-sm-2 control-label" for="apellido">Apellidos</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="apellido" type="text" value="<?php echo $apellido;?>"> </div>
                            </div>
                            <div class="form-group" style="display: block;">
                                <label class="col-sm-2 control-label" for="txttelefono">Teléfonos</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="txttelefono" type="text" value="<?php echo $telefono;?>"> </div>
                            </div>
                            <div class="form-group" style="display: block;">
                                <label class="col-sm-2 control-label" for="txtcorreo">Correo electrónico</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="txtcorreo" type="mail" value="<?php echo $correo;?>"> </div>
                            </div>
                            <div class="box-footer">
                                <input id="enviar" type="button" value="Guardar" class="btn btn-primary col-md-offset-5" onclick="
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn 	: <?php echo $idMenut;?>,
									codigo 	: $('#codigo').val(),
									cedula 	: $('#cedula').val(),
									nombre 	: $('#nombre').val(),
									apellido: $('#apellido').val(),
									telefono: $('#txttelefono').val(),
									correo: $('#txtcorreo').val(),
									editar: 1,
									ver 	: 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#cedula').val('');
									$('#nombre').val('');
									$('#apellido').val('');
									$('#txttelefono').val('');
									$('#txtcorreo').val('');
								},
							}); return false;
                   "> </div>
                        </form>
                    </div>
                    <div class="row">
                        <table class="table table-hover" id="personal">
                            <thead>
                                <tr>
                                    <td class="text-center"><strong>Cédula</strong></td>
                                    <td class="text-center"><strong>Nombre y Apellido</strong></td>
                                    <td class="text-center"><strong>Teléfonos</strong></td>
                                    <td class="text-center"><strong>Correo</strong></td>
                                    <td class="text-center"><strong>Editar</strong></td>
                                    <td class="text-center"><strong>Eliminar</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
								            $consulsol = paraTodos::arrayConsulta("*", "personal p", "1=1");
foreach($consulsol as $row){
?>
                                    <tr>
                                        <td class="text-center">
                                            <?php echo $row[per_cedula];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo utf8_decode($row[per_nombres]." ".$row[per_apellidos]);?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[per_telefonos];?>
                                        </td>
                                        <td class="text-center">
                                            <?php echo $row[per_correo];?>
                                        </td>
                                        <td class="text-center"> <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[per_codigo];?>,
                                                            editar 	: 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-edit"></i>
									               </a> </td>
                                        <td class="text-center"> <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[per_codigo];?>,
                                                            eliminar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-eraser"></i>
									               </a> </td>
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