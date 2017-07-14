<?php
    $anual = $_GET[anual];
    $agno=date("Y");
    $mes=date("n")-1;
    if ($mes==0){ $mes=1; $agno=$agno-1; }
    $fecha=$agno."-".$mes; 
    require_once('../includes/fpdf/fpdf.php');
    class PDF extends FPDF {
        function Header() {
         }
         function Footer() {
          /*** Funcion Donde es Escribe los Datos que se Imprimen en la zona Inferior del Documento ***/
          }
     }
    $consulanual = paraTodos::arrayConsulta("anual_descripcion", "tools_anual", "anual_codigo=$anual");
    foreach($consulanual as $anuales){
        $nombreanual = $anuales[anual_descripcion];
    }
        $pdf=new FPDF('L','mm','A4');
        $pdf->AddPage();
        setlocale(LC_TIME, "es_VE.utf8"); 
        $fechac=strftime("%A %d de %B de %Y a las %T");
        $pdf->SetFont('Arial','B',10);
        $pdf->SetX(110);
        $pdf->Image('../assets/images/cintillorep.jpg' , 65 ,0,150 , 10,'JPG', '');
        $pdf->MultiCell(70,5,utf8_decode('Residencia asitencial Programada del postgrado en puericultura y pediatria "Hospital General Dr, Luis Razzetti"'),0,'C');
        $pdf->Ln(8);
        $pdf->SetX(110);
        $pdf->MultiCell(70,5,utf8_decode("RESIDENTES DEL $nombreanual"),0,'C');
        $pdf->SetFont('Arial','B',8);
        $pdf->Cell(60,10,'NOMBRE DEL RESIDENTE',1,0,'C');
        $pdf->Cell(60,10,'SERVICIO',1,0,'C');
        $pdf->Cell(20,10,'ROTACION',1,0,'C');
        $pdf->Cell(15,10,'60%',1,0,'C');
        $pdf->Cell(20,10,'EXAMEN',1,0,'C');
        $pdf->Cell(15,10,'30%',1,0,'C');
        $pdf->Cell(40,10,'ACTIVIDADES DIARIAS',1,0,'C');
        $pdf->Cell(15,10,'10%',1,0,'C');
        $pdf->Cell(20,10,'NOTA FINAL',1,1,'C');
        $consulsol = paraTodos::arrayConsulta("*", "tools_anual,residente p left join evaluacion e on e.eval_rescodigo=p.res_codigo", "p.res_anual=anual_codigo and res_anual=$anual");
        foreach($consulsol as $row){
        $pdf->Cell(60,10,$row[res_nombre].' '.$row[res_apellido],1,0,'C');
        $pdf->Cell(60,10,$row[eval_servicio],1,0,'C');
        $pdf->Cell(20,10,$row[eval_rotacion],1,0,'C');
        $pdf->Cell(15,10,$row[eval_rotacion]*60/100,1,0,'C');
        $pdf->Cell(20,10,$row[eval_examen],1,0,'C');
        $pdf->Cell(15,10,$row[eval_examen]*30/100,1,0,'C');
        $pdf->Cell(40,10,$row[eval_activi],1,0,'C');
        $pdf->Cell(15,10,$row[eval_activi]*10/100,1,0,'C');
        $pdf->Cell(20,10,($row[eval_rotacion]*60/100)+($row[eval_examen]*30/100)+($row[eval_activi]*10/100),1,1,'C');
        }
        $pdf->MultiCell(0,5,utf8_decode("Impresión realizada el día ".$fechac),0,'C');
    $pdf->Output();
?>