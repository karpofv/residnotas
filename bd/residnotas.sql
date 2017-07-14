-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para residnotas
CREATE DATABASE IF NOT EXISTS `residnotas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `residnotas`;


-- Volcando estructura para tabla residnotas.componente
CREATE TABLE IF NOT EXISTS `componente` (
  `comp_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `comp_fechain` datetime DEFAULT CURRENT_TIMESTAMP,
  `comp_nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_marca` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_modelo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_serial` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_biennac` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_estado` int(2) DEFAULT NULL,
  PRIMARY KEY (`comp_codigo`),
  UNIQUE KEY `comp_serial` (`comp_serial`),
  UNIQUE KEY `comp_biennac` (`comp_biennac`),
  KEY `FK_componente_tools_estatus` (`comp_estado`),
  CONSTRAINT `FK_componente_tools_estatus` FOREIGN KEY (`comp_estado`) REFERENCES `tools_estatus` (`est_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1;

-- Volcando datos para la tabla residnotas.componente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.evaluacion
CREATE TABLE IF NOT EXISTS `evaluacion` (
  `eval_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `eval_percodigo` int(11) NOT NULL DEFAULT '0',
  `eval_rescodigo` int(11) DEFAULT NULL,
  `eval_servicio` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `eval_anual` int(11) DEFAULT NULL,
  `eval_rotacion` decimal(10,0) DEFAULT NULL,
  `eval_examen` decimal(10,0) DEFAULT NULL,
  `eval_activi` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`eval_codigo`),
  UNIQUE KEY `eval_rescodigo` (`eval_anual`,`eval_servicio`,`eval_rescodigo`),
  KEY `FK_evaluacion_residente` (`eval_rescodigo`),
  KEY `FK_evaluacion_personal` (`eval_percodigo`),
  CONSTRAINT `FK_evaluacion_personal` FOREIGN KEY (`eval_percodigo`) REFERENCES `personal` (`per_codigo`),
  CONSTRAINT `FK_evaluacion_residente` FOREIGN KEY (`eval_rescodigo`) REFERENCES `residente` (`res_codigo`),
  CONSTRAINT `FK_evaluacion_tools_anual` FOREIGN KEY (`eval_anual`) REFERENCES `tools_anual` (`anual_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.evaluacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` (`eval_codigo`, `eval_percodigo`, `eval_rescodigo`, `eval_servicio`, `eval_anual`, `eval_rotacion`, `eval_examen`, `eval_activi`) VALUES
	(5, 11, 2, 'sdasd', 1, 19, 2, 15);
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `mov_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `mov_fecha` date NOT NULL,
  `mov_compcodigo` int(11) DEFAULT NULL,
  `mov_solicitante` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_solresp` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_motivo` text COLLATE utf8_bin,
  `mov_fechadev` date DEFAULT NULL,
  `mov_respdep` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_perresp` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mov_entrada` date DEFAULT NULL,
  `mov_salida` date DEFAULT NULL,
  PRIMARY KEY (`mov_codigo`),
  KEY `FK_movimientos_componente` (`mov_compcodigo`),
  CONSTRAINT `FK_movimientos_componente` FOREIGN KEY (`mov_compcodigo`) REFERENCES `componente` (`comp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.movimientos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.m_menu_emp_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ConexMenuMaster` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conex` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imagen` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ancho` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alto` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` text COLLATE utf8_unicode_ci,
  `CA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAdmin` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orden` (`orden`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla residnotas.m_menu_emp_menj: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `m_menu_emp_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_menj` (`id`, `ConexMenuMaster`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`) VALUES
	(54, NULL, 1, 'Administrador', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(78, NULL, 1, 'Doctores', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
	(79, NULL, 2, 'Residentes', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
	(80, NULL, 3, 'Reportes', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `m_menu_emp_menj` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.m_menu_emp_sub_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_sub_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enlace` int(11) NOT NULL DEFAULT '0',
  `enlacesub` char(3) DEFAULT NULL,
  `Act` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) DEFAULT NULL,
  `conex` varchar(250) DEFAULT NULL,
  `Url_1` varchar(100) NOT NULL,
  `Url_2` varchar(100) NOT NULL,
  `Url_3` varchar(100) NOT NULL,
  `Url_4` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url_5` varchar(100) NOT NULL,
  `Url_6` varchar(100) DEFAULT NULL,
  `Url_7` varchar(100) DEFAULT NULL,
  `Url_8` varchar(100) DEFAULT NULL,
  `Url_9` varchar(100) DEFAULT NULL,
  `Url_10` varchar(100) DEFAULT NULL,
  `Inserte` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Updated` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Deleted` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Acciones` varchar(80) NOT NULL,
  `Ejecutar` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conexd` varchar(200) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `nivel` text,
  `CA` char(2) DEFAULT NULL,
  `CAdmin` int(1) DEFAULT NULL,
  `CssColor` varchar(50) NOT NULL,
  `CssImagen` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enlace` (`enlace`),
  CONSTRAINT `m_menu_emp_sub_menj_ibfk_1` FOREIGN KEY (`enlace`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla residnotas.m_menu_emp_sub_menj: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_sub_menj` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
	(55, 54, NULL, NULL, NULL, 'Asignar Usuarios', 'menu.php', 'conf_usuario/crear_usuario.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(110, 54, NULL, NULL, NULL, 'Administrar Perfiles', 'menu.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(170, 78, NULL, NULL, 1, 'Nuevos registros', NULL, 'sistema/doctor/doctor.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(172, 79, NULL, NULL, 1, 'Nuevos registros', NULL, 'sistema/residente/residente.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(173, 79, NULL, NULL, 2, 'Evaluar', NULL, 'sistema/evaluacion/residente.php', 'sistema/evaluacion/evaluacion.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(174, 80, NULL, NULL, 1, 'Notas por Año', NULL, 'sistema/reporte/notas.php', 'sistema/reporte/pdf_notas.php', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `CodPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CodPerfil`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla residnotas.perfiles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` (`CodPerfil`, `Nombre`) VALUES
	(1, 'Administrador'),
	(2, 'god'),
	(3, 'operador');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.perfiles_det
CREATE TABLE IF NOT EXISTS `perfiles_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdPerfil` int(11) NOT NULL DEFAULT '0',
  `Submenu` int(11) NOT NULL DEFAULT '0',
  `Menu` int(11) NOT NULL DEFAULT '0',
  `S` tinyint(4) NOT NULL,
  `U` tinyint(4) NOT NULL,
  `D` tinyint(4) NOT NULL,
  `I` tinyint(4) NOT NULL,
  `P` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdPerfil_2` (`IdPerfil`,`Submenu`,`Menu`),
  KEY `IdPerfil` (`IdPerfil`),
  KEY `Submenu` (`Submenu`),
  KEY `Menu` (`Menu`),
  CONSTRAINT `FK_perfiles_det_perfiles` FOREIGN KEY (`IdPerfil`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_2` FOREIGN KEY (`Menu`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_3` FOREIGN KEY (`Submenu`) REFERENCES `m_menu_emp_sub_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla residnotas.perfiles_det: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `perfiles_det` DISABLE KEYS */;
INSERT INTO `perfiles_det` (`id`, `IdPerfil`, `Submenu`, `Menu`, `S`, `U`, `D`, `I`, `P`) VALUES
	(1, 1, 110, 54, 0, 1, 1, 1, 1),
	(113, 1, 55, 54, 1, 1, 1, 1, 1),
	(225, 2, 110, 54, 1, 1, 1, 1, 1),
	(226, 2, 55, 54, 1, 1, 1, 1, 1),
	(289, 1, 170, 78, 1, 0, 0, 0, 0),
	(290, 1, 174, 80, 1, 0, 0, 0, 0),
	(291, 1, 173, 79, 1, 0, 0, 0, 0),
	(292, 1, 172, 79, 1, 0, 0, 0, 0),
	(293, 3, 170, 78, 1, 0, 0, 0, 0),
	(294, 3, 174, 80, 1, 0, 0, 0, 0),
	(295, 3, 173, 79, 1, 0, 0, 0, 0),
	(296, 3, 172, 79, 1, 0, 0, 0, 0),
	(297, 2, 170, 78, 1, 0, 0, 0, 0),
	(298, 2, 174, 80, 1, 0, 0, 0, 0),
	(299, 2, 173, 79, 1, 0, 0, 0, 0),
	(300, 2, 172, 79, 1, 0, 0, 0, 0);
/*!40000 ALTER TABLE `perfiles_det` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `per_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `per_cedula` int(11) DEFAULT NULL,
  `per_nombres` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `per_apellidos` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `per_telefonos` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `per_correo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`per_codigo`),
  UNIQUE KEY `per_cedula` (`per_cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.personal: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` (`per_codigo`, `per_cedula`, `per_nombres`, `per_apellidos`, `per_telefonos`, `per_correo`) VALUES
	(11, 19191493, 'MARIO PERNIA', 'rojas', '04124289536', 'karpofv.89@gmail.com');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.recargar
CREATE TABLE IF NOT EXISTS `recargar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla residnotas.recargar: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `recargar` DISABLE KEYS */;
INSERT INTO `recargar` (`id`, `URL`, `actd`, `Accion`) VALUES
	(1, 'uploader/receiver.php', 0, ''),
	(2, 'recargar/recargar.php', 0, ''),
	(3, 'recargar/recargar.php', 0, ''),
	(4, 'sistema/documentos/selectorAnual.php', 0, ''),
	(5, 'sistema/documentos/selectorMes.php', 0, ''),
	(351, 'sistema/index.php', 0, ''),
	(352, 'recargar/recargar.php', 1, ''),
	(353, 'sistema/reportes/pdf_constancia.php', 0, '');
/*!40000 ALTER TABLE `recargar` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.registrados
CREATE TABLE IF NOT EXISTS `registrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Usuario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL DEFAULT '0',
  `Nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  CONSTRAINT `FK_registrados_usuarios` FOREIGN KEY (`cedula`) REFERENCES `usuarios` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla residnotas.registrados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
INSERT INTO `registrados` (`id`, `nacionalidad`, `Usuario`, `cedula`, `Nombres`, `Apellidos`, `sexo`, `correo`) VALUES
	(1, '', 0, 123321, 'admin', 'admin', '', ''),
	(2, '', 0, 123456, 'operador', 'operador', '', ''),
	(3, '', 0, 12345, 'GOD', 'GOD', '', '');
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.reparacion
CREATE TABLE IF NOT EXISTS `reparacion` (
  `rep_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `rep_fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `rep_equipo` int(11) DEFAULT NULL,
  `rep_motivo` text COLLATE utf8_bin,
  `rep_respuesta` text COLLATE utf8_bin,
  `rep_fecresp` date DEFAULT NULL,
  `rep_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`rep_codigo`),
  KEY `FK_reparacion_componente` (`rep_equipo`),
  CONSTRAINT `FK_reparacion_componente` FOREIGN KEY (`rep_equipo`) REFERENCES `componente` (`comp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.reparacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacion` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.residente
CREATE TABLE IF NOT EXISTS `residente` (
  `res_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `res_cedula` int(11) DEFAULT NULL,
  `res_nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `res_apellido` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `res_direccion` text COLLATE utf8_bin,
  `res_telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `res_anual` int(11) DEFAULT NULL,
  PRIMARY KEY (`res_codigo`),
  UNIQUE KEY `res_cedula` (`res_cedula`),
  KEY `FK_residente_tools_anual` (`res_anual`),
  CONSTRAINT `FK_residente_tools_anual` FOREIGN KEY (`res_anual`) REFERENCES `tools_anual` (`anual_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.residente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `residente` DISABLE KEYS */;
INSERT INTO `residente` (`res_codigo`, `res_cedula`, `res_nombre`, `res_apellido`, `res_direccion`, `res_telefono`, `res_anual`) VALUES
	(2, 19191493, 'MARIO PERNIA', 'rojas', 'BARRIO LA PAZ', '04124289536', 1);
/*!40000 ALTER TABLE `residente` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

-- Volcando datos para la tabla residnotas.sexo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` (`id`, `Nombre`) VALUES
	(1, 'Masculino'),
	(2, 'Femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.tools_anual
CREATE TABLE IF NOT EXISTS `tools_anual` (
  `anual_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `anual_descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`anual_codigo`),
  UNIQUE KEY `anual_descripcion` (`anual_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.tools_anual: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tools_anual` DISABLE KEYS */;
INSERT INTO `tools_anual` (`anual_codigo`, `anual_descripcion`) VALUES
	(4, 'CUARTO AÑO'),
	(1, 'PRIMER AÑO'),
	(5, 'QUINTO AÑO'),
	(2, 'SEGUNDO AÑO'),
	(3, 'TERCER AÑO');
/*!40000 ALTER TABLE `tools_anual` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.tools_estatus
CREATE TABLE IF NOT EXISTS `tools_estatus` (
  `est_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`est_codigo`),
  UNIQUE KEY `est_descripcion` (`est_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla residnotas.tools_estatus: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tools_estatus` DISABLE KEYS */;
INSERT INTO `tools_estatus` (`est_codigo`, `est_descripcion`) VALUES
	(2, 'ACTIVO'),
	(4, 'DAÑADO'),
	(3, 'EN MANTENIMIENTO'),
	(1, 'INACTIVO');
/*!40000 ALTER TABLE `tools_estatus` ENABLE KEYS */;


-- Volcando estructura para tabla residnotas.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL DEFAULT '0',
  `Usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasena` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `Codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Registro` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `Cedula_2` (`Tipo`,`Cedula`),
  KEY `Tipo` (`Cedula`,`Tipo`,`Usuario`),
  KEY `Cedula` (`Codigo`,`Usuario`,`Cedula`),
  KEY `Nivel` (`Nivel`),
  CONSTRAINT `FK_usuarios_perfiles` FOREIGN KEY (`Nivel`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1;

-- Volcando datos para la tabla residnotas.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `Cedula`, `Usuario`, `contrasena`, `Tipo`, `Nivel`, `Codigo`, `Registro`, `Fecha`, `Observacion`) VALUES
	(7, 123321, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Empleado', 1, NULL, NULL, '0000-00-00 00:00:00', NULL),
	(8, 123456, 'operador', '06d4f07c943a4da1c8bfe591abbc3579', 'Empleado', 3, '80c26', NULL, '0000-00-00 00:00:00', NULL),
	(9, 12345, 'GOD', 'a1b995eb2627f17bfd5fcb1de8533c62', 'Empleado', 2, 'b9fb2', NULL, '0000-00-00 00:00:00', NULL),
	(10, 12345, '', '', '', NULL, 'b9fb2', NULL, '0000-00-00 00:00:00', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
