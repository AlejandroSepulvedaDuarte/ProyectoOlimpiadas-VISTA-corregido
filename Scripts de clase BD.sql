CREATE DATABASE bdolimpiadas
USE bdolimpiadas

CREATE TABLE tblpaises(
idpais TINYINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombrepais VARCHAR(50) NOT NULL
)

CREATE TABLE tblparticipantes(
numerodocumento BIGINT PRIMARY KEY NOT NULL,
nombreparticipante VARCHAR(50) NOT NULL,
idpais TINYINT NOT NULL
)

ALTER TABLE tblparticipantes
ADD CONSTRAINT FK_tblparticipantes_tblpaises
FOREIGN KEY (idpais) 
REFERENCES tblpaises(idpais)

CREATE TABLE tblresultados(
numerodocumento BIGINT PRIMARY KEY NOT NULL,
nombreparticipante VARCHAR(50) NOT NULL,
idposicion TINYINT NOT NULL,
idpais TINYINT NOT NULL
)

CREATE TABLE tblposiciones(
idposicion TINYINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombreposicion VARCHAR(20)
)

ALTER TABLE tblposiciones
ALTER COLUMN nombreposicion VARCHAR(20) NOT NULL

ALTER TABLE tblresultados
ADD CONSTRAINT FK_tblpaises_tblresultados
FOREIGN KEY(idpais)
REFERENCES tblpaises(idpais)

ALTER TABLE tblresultados
ADD CONSTRAINT FK_tblparticipantes_tblresultados
FOREIGN KEY(numerodocumento)
REFERENCES tblparticipantes(numerodocumento)

ALTER TABLE tblresultados
ADD CONSTRAINT FK_tblposiciones_tblresultados
FOREIGN KEY(idposicion)
REFERENCES tblposiciones(idposicion)

INSERT INTO tblpaises
(nombrepais)
VALUES
('COLOMBIA'),
('BRASIL'),
('VENEZUELA')

SELECT * FROM dbo.tblpaises

INSERT INTO dbo.tblposiciones
(nombreposicion)
VALUES
('Primera posici�n'),
('Segunda posici�n'),
('Tercera posici�n')

SELECT * FROM dbo.tblposiciones

INSERT INTO dbo.tblparticipantes
(numerodocumento, nombreparticipante, idpais)
VALUES
(132456789, 'Kiko', 1),
(154784584, 'El Chavo', 3)

SELECT * FROM dbo.tblparticipantes

INSERT INTO dbo.tblresultados
(numerodocumento, nombreparticipante, idposicion, idpais)
VALUES
(154784584, 'El Chavo', 1, 3)

SELECT * FROM dbo.tblresultados


--24/09/2020

--Se crea procedimiento almacenado
--para listar los paises
CREATE PROC sppaises_listar
AS
BEGIN
SELECT * FROM dbo.tblpaises
END
GO


--Ejecutar procedimiento almacenado
exec sppaises_listar

--Crear procedimiento para guardar paises
CREATE PROC sppaises_guardar
@nombrepais VARCHAR(50)
AS
BEGIN
INSERT INTO dbo.tblpaises
(nombrepais)
VALUES
(@nombrepais)
END
GO


--Prueba de Eliminaci�n en Cascada de manera manual
SELECT * FROM dbo.tblparticipantes
SELECT * FROM dbo.tblpaises
SELECT * FROM dbo.tblresultados


INSERT INTO dbo.tblpaises
(nombrepais) 
VALUES
('PERU')

INSERT INTO dbo.tblparticipantes
(numerodocumento, nombreparticipante, idpais) 
VALUES
(22222222, 'Fulano', 5),
(33333333, '�o�o', 5)

INSERT INTO dbo.tblresultados
(numerodocumento, nombreparticipante, idposicion, idpais)
VALUES
(33333333, '�o�o', 2, 5)

SELECT res.numerodocumento, res.nombreparticipante, res.idposicion, pa.nombrepais 
FROM dbo.tblresultados res
INNER JOIN dbo.tblpaises pa
ON res.idpais = pa.idpais

DELETE FROM dbo.tblparticipantes
WHERE idpais = 5

DELETE FROM dbo.tblresultados
WHERE idpais = 5

DELETE FROM dbo.tblpaises
WHERE idpais = 5

--Fin Prueba de eliminaci�n en Cascada de manera manual

--Crear procedimiento para guardar cambios paises
CREATE PROC sppaises_guardarcambios
@idpais TINYINT, 
@nombrepais VARCHAR(50)
AS
BEGIN
UPDATE dbo.tblpaises SET 
nombrepais = @nombrepais
WHERE idpais = @idpais
END
GO

--Se crea procedimiento para listar los participantes
CREATE PROC spparticipantes_listar
AS
BEGIN
SELECT * FROM dbo.tblparticipantes
END
GO

SELECT * FROM dbo.tblpaises
WHERE nombrepais LIKE '%uruguay%'




CREATE TABLE paises (
id int PRIMARY KEY NOT NULL,
iso char(2) NULL,
nombre varchar(80) NULL
)
 
INSERT INTO paises VALUES(1, 'AF', 'Afganist�n');
INSERT INTO paises VALUES(2, 'AX', 'Islas Gland');
INSERT INTO paises VALUES(3, 'AL', 'Albania');
INSERT INTO paises VALUES(4, 'DE', 'Alemania');
INSERT INTO paises VALUES(5, 'AD', 'Andorra');
INSERT INTO paises VALUES(6, 'AO', 'Angola');
INSERT INTO paises VALUES(7, 'AI', 'Anguilla');
INSERT INTO paises VALUES(8, 'AQ', 'Ant�rtida');
INSERT INTO paises VALUES(9, 'AG', 'Antigua y Barbuda');
INSERT INTO paises VALUES(10, 'AN', 'Antillas Holandesas');
INSERT INTO paises VALUES(11, 'SA', 'Arabia Saud�');
INSERT INTO paises VALUES(12, 'DZ', 'Argelia');
INSERT INTO paises VALUES(13, 'AR', 'Argentina');
INSERT INTO paises VALUES(14, 'AM', 'Armenia');
INSERT INTO paises VALUES(15, 'AW', 'Aruba');
INSERT INTO paises VALUES(16, 'AU', 'Australia');
INSERT INTO paises VALUES(17, 'AT', 'Austria');
INSERT INTO paises VALUES(18, 'AZ', 'Azerbaiy�n');
INSERT INTO paises VALUES(19, 'BS', 'Bahamas');
INSERT INTO paises VALUES(20, 'BH', 'Bahr�in');
INSERT INTO paises VALUES(21, 'BD', 'Bangladesh');
INSERT INTO paises VALUES(22, 'BB', 'Barbados');
INSERT INTO paises VALUES(23, 'BY', 'Bielorrusia');
INSERT INTO paises VALUES(24, 'BE', 'B�lgica');
INSERT INTO paises VALUES(25, 'BZ', 'Belice');
INSERT INTO paises VALUES(26, 'BJ', 'Benin');
INSERT INTO paises VALUES(27, 'BM', 'Bermudas');
INSERT INTO paises VALUES(28, 'BT', 'Bhut�n');
INSERT INTO paises VALUES(29, 'BO', 'Bolivia');
INSERT INTO paises VALUES(30, 'BA', 'Bosnia y Herzegovina');
INSERT INTO paises VALUES(31, 'BW', 'Botsuana');
INSERT INTO paises VALUES(32, 'BV', 'Isla Bouvet');
INSERT INTO paises VALUES(33, 'BR', 'Brasil');
INSERT INTO paises VALUES(34, 'BN', 'Brun�i');
INSERT INTO paises VALUES(35, 'BG', 'Bulgaria');
INSERT INTO paises VALUES(36, 'BF', 'Burkina Faso');
INSERT INTO paises VALUES(37, 'BI', 'Burundi');
INSERT INTO paises VALUES(38, 'CV', 'Cabo Verde');
INSERT INTO paises VALUES(39, 'KY', 'Islas Caim�n');
INSERT INTO paises VALUES(40, 'KH', 'Camboya');
INSERT INTO paises VALUES(41, 'CM', 'Camer�n');
INSERT INTO paises VALUES(42, 'CA', 'Canad�');
INSERT INTO paises VALUES(43, 'CF', 'Rep�blica Centroafricana');
INSERT INTO paises VALUES(44, 'TD', 'Chad');
INSERT INTO paises VALUES(45, 'CZ', 'Rep�blica Checa');
INSERT INTO paises VALUES(46, 'CL', 'Chile');
INSERT INTO paises VALUES(47, 'CN', 'China');
INSERT INTO paises VALUES(48, 'CY', 'Chipre');
INSERT INTO paises VALUES(49, 'CX', 'Isla de Navidad');
INSERT INTO paises VALUES(50, 'VA', 'Ciudad del Vaticano');
INSERT INTO paises VALUES(51, 'CC', 'Islas Cocos');
INSERT INTO paises VALUES(52, 'CO', 'Colombia');
INSERT INTO paises VALUES(53, 'KM', 'Comoras');
INSERT INTO paises VALUES(54, 'CD', 'Rep�blica Democr�tica del Congo');
INSERT INTO paises VALUES(55, 'CG', 'Congo');
INSERT INTO paises VALUES(56, 'CK', 'Islas Cook');
INSERT INTO paises VALUES(57, 'KP', 'Corea del Norte');
INSERT INTO paises VALUES(58, 'KR', 'Corea del Sur');
INSERT INTO paises VALUES(59, 'CI', 'Costa de Marfil');
INSERT INTO paises VALUES(60, 'CR', 'Costa Rica');
INSERT INTO paises VALUES(61, 'HR', 'Croacia');
INSERT INTO paises VALUES(62, 'CU', 'Cuba');
INSERT INTO paises VALUES(63, 'DK', 'Dinamarca');
INSERT INTO paises VALUES(64, 'DM', 'Dominica');
INSERT INTO paises VALUES(65, 'DO', 'Rep�blica Dominicana');
INSERT INTO paises VALUES(66, 'EC', 'Ecuador');
INSERT INTO paises VALUES(67, 'EG', 'Egipto');
INSERT INTO paises VALUES(68, 'SV', 'El Salvador');
INSERT INTO paises VALUES(69, 'AE', 'Emiratos �rabes Unidos');
INSERT INTO paises VALUES(70, 'ER', 'Eritrea');
INSERT INTO paises VALUES(71, 'SK', 'Eslovaquia');
INSERT INTO paises VALUES(72, 'SI', 'Eslovenia');
INSERT INTO paises VALUES(73, 'ES', 'Espa�a');
INSERT INTO paises VALUES(74, 'UM', 'Islas ultramarinas de Estados Unidos');
INSERT INTO paises VALUES(75, 'US', 'Estados Unidos');
INSERT INTO paises VALUES(76, 'EE', 'Estonia');
INSERT INTO paises VALUES(77, 'ET', 'Etiop�a');
INSERT INTO paises VALUES(78, 'FO', 'Islas Feroe');
INSERT INTO paises VALUES(79, 'PH', 'Filipinas');
INSERT INTO paises VALUES(80, 'FI', 'Finlandia');
INSERT INTO paises VALUES(81, 'FJ', 'Fiyi');
INSERT INTO paises VALUES(82, 'FR', 'Francia');
INSERT INTO paises VALUES(83, 'GA', 'Gab�n');
INSERT INTO paises VALUES(84, 'GM', 'Gambia');
INSERT INTO paises VALUES(85, 'GE', 'Georgia');
INSERT INTO paises VALUES(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur');
INSERT INTO paises VALUES(87, 'GH', 'Ghana');
INSERT INTO paises VALUES(88, 'GI', 'Gibraltar');
INSERT INTO paises VALUES(89, 'GD', 'Granada');
INSERT INTO paises VALUES(90, 'GR', 'Grecia');
INSERT INTO paises VALUES(91, 'GL', 'Groenlandia');
INSERT INTO paises VALUES(92, 'GP', 'Guadalupe');
INSERT INTO paises VALUES(93, 'GU', 'Guam');
INSERT INTO paises VALUES(94, 'GT', 'Guatemala');
INSERT INTO paises VALUES(95, 'GF', 'Guayana Francesa');
INSERT INTO paises VALUES(96, 'GN', 'Guinea');
INSERT INTO paises VALUES(97, 'GQ', 'Guinea Ecuatorial');
INSERT INTO paises VALUES(98, 'GW', 'Guinea-Bissau');
INSERT INTO paises VALUES(99, 'GY', 'Guyana');
INSERT INTO paises VALUES(100, 'HT', 'Hait�');
INSERT INTO paises VALUES(101, 'HM', 'Islas Heard y McDonald');
INSERT INTO paises VALUES(102, 'HN', 'Honduras');
INSERT INTO paises VALUES(103, 'HK', 'Hong Kong');
INSERT INTO paises VALUES(104, 'HU', 'Hungr�a');
INSERT INTO paises VALUES(105, 'IN', 'India');
INSERT INTO paises VALUES(106, 'ID', 'Indonesia');
INSERT INTO paises VALUES(107, 'IR', 'Ir�n');
INSERT INTO paises VALUES(108, 'IQ', 'Iraq');
INSERT INTO paises VALUES(109, 'IE', 'Irlanda');
INSERT INTO paises VALUES(110, 'IS', 'Islandia');
INSERT INTO paises VALUES(111, 'IL', 'Israel');
INSERT INTO paises VALUES(112, 'IT', 'Italia');
INSERT INTO paises VALUES(113, 'JM', 'Jamaica');
INSERT INTO paises VALUES(114, 'JP', 'Jap�n');
INSERT INTO paises VALUES(115, 'JO', 'Jordania');
INSERT INTO paises VALUES(116, 'KZ', 'Kazajst�n');
INSERT INTO paises VALUES(117, 'KE', 'Kenia');
INSERT INTO paises VALUES(118, 'KG', 'Kirguist�n');
INSERT INTO paises VALUES(119, 'KI', 'Kiribati');
INSERT INTO paises VALUES(120, 'KW', 'Kuwait');
INSERT INTO paises VALUES(121, 'LA', 'Laos');
INSERT INTO paises VALUES(122, 'LS', 'Lesotho');
INSERT INTO paises VALUES(123, 'LV', 'Letonia');
INSERT INTO paises VALUES(124, 'LB', 'L�bano');
INSERT INTO paises VALUES(125, 'LR', 'Liberia');
INSERT INTO paises VALUES(126, 'LY', 'Libia');
INSERT INTO paises VALUES(127, 'LI', 'Liechtenstein');
INSERT INTO paises VALUES(128, 'LT', 'Lituania');
INSERT INTO paises VALUES(129, 'LU', 'Luxemburgo');
INSERT INTO paises VALUES(130, 'MO', 'Macao');
INSERT INTO paises VALUES(131, 'MK', 'ARY Macedonia');
INSERT INTO paises VALUES(132, 'MG', 'Madagascar');
INSERT INTO paises VALUES(133, 'MY', 'Malasia');
INSERT INTO paises VALUES(134, 'MW', 'Malawi');
INSERT INTO paises VALUES(135, 'MV', 'Maldivas');
INSERT INTO paises VALUES(136, 'ML', 'Mal�');
INSERT INTO paises VALUES(137, 'MT', 'Malta');
INSERT INTO paises VALUES(138, 'FK', 'Islas Malvinas');
INSERT INTO paises VALUES(139, 'MP', 'Islas Marianas del Norte');
INSERT INTO paises VALUES(140, 'MA', 'Marruecos');
INSERT INTO paises VALUES(141, 'MH', 'Islas Marshall');
INSERT INTO paises VALUES(142, 'MQ', 'Martinica');
INSERT INTO paises VALUES(143, 'MU', 'Mauricio');
INSERT INTO paises VALUES(144, 'MR', 'Mauritania');
INSERT INTO paises VALUES(145, 'YT', 'Mayotte');
INSERT INTO paises VALUES(146, 'MX', 'M�xico');
INSERT INTO paises VALUES(147, 'FM', 'Micronesia');
INSERT INTO paises VALUES(148, 'MD', 'Moldavia');
INSERT INTO paises VALUES(149, 'MC', 'M�naco');
INSERT INTO paises VALUES(150, 'MN', 'Mongolia');
INSERT INTO paises VALUES(151, 'MS', 'Montserrat');
INSERT INTO paises VALUES(152, 'MZ', 'Mozambique');
INSERT INTO paises VALUES(153, 'MM', 'Myanmar');
INSERT INTO paises VALUES(154, 'NA', 'Namibia');
INSERT INTO paises VALUES(155, 'NR', 'Nauru');
INSERT INTO paises VALUES(156, 'NP', 'Nepal');
INSERT INTO paises VALUES(157, 'NI', 'Nicaragua');
INSERT INTO paises VALUES(158, 'NE', 'N�ger');
INSERT INTO paises VALUES(159, 'NG', 'Nigeria');
INSERT INTO paises VALUES(160, 'NU', 'Niue');
INSERT INTO paises VALUES(161, 'NF', 'Isla Norfolk');
INSERT INTO paises VALUES(162, 'NO', 'Noruega');
INSERT INTO paises VALUES(163, 'NC', 'Nueva Caledonia');
INSERT INTO paises VALUES(164, 'NZ', 'Nueva Zelanda');
INSERT INTO paises VALUES(165, 'OM', 'Om�n');
INSERT INTO paises VALUES(166, 'NL', 'Pa�ses Bajos');
INSERT INTO paises VALUES(167, 'PK', 'Pakist�n');
INSERT INTO paises VALUES(168, 'PW', 'Palau');
INSERT INTO paises VALUES(169, 'PS', 'Palestina');
INSERT INTO paises VALUES(170, 'PA', 'Panam�');
INSERT INTO paises VALUES(171, 'PG', 'Pap�a Nueva Guinea');
INSERT INTO paises VALUES(172, 'PY', 'Paraguay');
INSERT INTO paises VALUES(173, 'PE', 'Per�');
INSERT INTO paises VALUES(174, 'PN', 'Islas Pitcairn');
INSERT INTO paises VALUES(175, 'PF', 'Polinesia Francesa');
INSERT INTO paises VALUES(176, 'PL', 'Polonia');
INSERT INTO paises VALUES(177, 'PT', 'Portugal');
INSERT INTO paises VALUES(178, 'PR', 'Puerto Rico');
INSERT INTO paises VALUES(179, 'QA', 'Qatar');
INSERT INTO paises VALUES(180, 'GB', 'Reino Unido');
INSERT INTO paises VALUES(181, 'RE', 'Reuni�n');
INSERT INTO paises VALUES(182, 'RW', 'Ruanda');
INSERT INTO paises VALUES(183, 'RO', 'Rumania');
INSERT INTO paises VALUES(184, 'RU', 'Rusia');
INSERT INTO paises VALUES(185, 'EH', 'Sahara Occidental');
INSERT INTO paises VALUES(186, 'SB', 'Islas Salom�n');
INSERT INTO paises VALUES(187, 'WS', 'Samoa');
INSERT INTO paises VALUES(188, 'AS', 'Samoa Americana');
INSERT INTO paises VALUES(189, 'KN', 'San Crist�bal y Nevis');
INSERT INTO paises VALUES(190, 'SM', 'San Marino');
INSERT INTO paises VALUES(191, 'PM', 'San Pedro y Miquel�n');
INSERT INTO paises VALUES(192, 'VC', 'San Vicente y las Granadinas');
INSERT INTO paises VALUES(193, 'SH', 'Santa Helena');
INSERT INTO paises VALUES(194, 'LC', 'Santa Luc�a');
INSERT INTO paises VALUES(195, 'ST', 'Santo Tom� y Pr�ncipe');
INSERT INTO paises VALUES(196, 'SN', 'Senegal');
INSERT INTO paises VALUES(197, 'CS', 'Serbia y Montenegro');
INSERT INTO paises VALUES(198, 'SC', 'Seychelles');
INSERT INTO paises VALUES(199, 'SL', 'Sierra Leona');
INSERT INTO paises VALUES(200, 'SG', 'Singapur');
INSERT INTO paises VALUES(201, 'SY', 'Siria');
INSERT INTO paises VALUES(202, 'SO', 'Somalia');
INSERT INTO paises VALUES(203, 'LK', 'Sri Lanka');
INSERT INTO paises VALUES(204, 'SZ', 'Suazilandia');
INSERT INTO paises VALUES(205, 'ZA', 'Sud�frica');
INSERT INTO paises VALUES(206, 'SD', 'Sud�n');
INSERT INTO paises VALUES(207, 'SE', 'Suecia');
INSERT INTO paises VALUES(208, 'CH', 'Suiza');
INSERT INTO paises VALUES(209, 'SR', 'Surinam');
INSERT INTO paises VALUES(210, 'SJ', 'Svalbard y Jan Mayen');
INSERT INTO paises VALUES(211, 'TH', 'Tailandia');
INSERT INTO paises VALUES(212, 'TW', 'Taiw�n');
INSERT INTO paises VALUES(213, 'TZ', 'Tanzania');
INSERT INTO paises VALUES(214, 'TJ', 'Tayikist�n');
INSERT INTO paises VALUES(215, 'IO', 'Territorio Brit�nico del Oc�ano �ndico');
INSERT INTO paises VALUES(216, 'TF', 'Territorios Australes Franceses');
INSERT INTO paises VALUES(217, 'TL', 'Timor Oriental');
INSERT INTO paises VALUES(218, 'TG', 'Togo');
INSERT INTO paises VALUES(219, 'TK', 'Tokelau');
INSERT INTO paises VALUES(220, 'TO', 'Tonga');
INSERT INTO paises VALUES(221, 'TT', 'Trinidad y Tobago');
INSERT INTO paises VALUES(222, 'TN', 'T�nez');
INSERT INTO paises VALUES(223, 'TC', 'Islas Turcas y Caicos');
INSERT INTO paises VALUES(224, 'TM', 'Turkmenist�n');
INSERT INTO paises VALUES(225, 'TR', 'Turqu�a');
INSERT INTO paises VALUES(226, 'TV', 'Tuvalu');
INSERT INTO paises VALUES(227, 'UA', 'Ucrania');
INSERT INTO paises VALUES(228, 'UG', 'Uganda');
INSERT INTO paises VALUES(229, 'UY', 'Uruguay');
INSERT INTO paises VALUES(230, 'UZ', 'Uzbekist�n');
INSERT INTO paises VALUES(231, 'VU', 'Vanuatu');
INSERT INTO paises VALUES(232, 'VE', 'Venezuela');
INSERT INTO paises VALUES(233, 'VN', 'Vietnam');
INSERT INTO paises VALUES(234, 'VG', 'Islas V�rgenes Brit�nicas');
INSERT INTO paises VALUES(235, 'VI', 'Islas V�rgenes de los Estados Unidos');
INSERT INTO paises VALUES(236, 'WF', 'Wallis y Futuna');
INSERT INTO paises VALUES(237, 'YE', 'Yemen');
INSERT INTO paises VALUES(238, 'DJ', 'Yibuti');
INSERT INTO paises VALUES(239, 'ZM', 'Zambia');
INSERT INTO paises VALUES(240, 'ZW', 'Zimbabue');

SELECT * FROM dbo.paises


--01/10/2020

ALTER PROC spparticipantes_guardar
@numerodocumento BIGINT,
@nombreparticipante VARCHAR(50),
@idpais TINYINT
AS
BEGIN
INSERT INTO dbo.tblparticipantes
(numerodocumento, nombreparticipante, idpais)
VALUES
(@numerodocumento, @nombreparticipante, @idpais)
END
GO

--Se modifica procedimiento de listar paises para
--que se vea de manera ordenada el listado
ALTER PROC sppaises_listar
AS
BEGIN
SELECT * FROM dbo.tblpaises
ORDER BY nombrepais ASC
END
GO

--Se modifica procedimiento para listar los 
--participantes con paises legibles
ALTER PROC spparticipantes_listar
AS
BEGIN
SELECT par.numerodocumento, par.nombreparticipante,
pai.nombrepais 
FROM dbo.tblparticipantes par
INNER JOIN dbo.tblpaises pai
ON par.idpais = pai.idpais
END
GO

--Crear procedimiento para guardar cambios participantes
CREATE PROC spparticipantes_guardarcambios
@numerodocumento BIGINT,
@nombreparticipante VARCHAR(50),
@idpais TINYINT
AS
BEGIN
IF @idpais=0 
	UPDATE dbo.tblparticipantes SET 
	nombreparticipante = @nombreparticipante
	WHERE numerodocumento = @numerodocumento
ELSE
	UPDATE dbo.tblparticipantes SET 
	nombreparticipante = @nombreparticipante,
	idpais = @idpais
	WHERE numerodocumento = @numerodocumento
END
GO

--Crear procedimiento para guardar cambios posiciones
CREATE PROC spposiciones_guardarcambios
@idposicion TINYINT, 
@nombreposicion VARCHAR(50)
AS
BEGIN
UPDATE dbo.tblposiciones SET 
nombreposicion = @nombreposicion
WHERE idposicion = @idposicion
END
GO
--Se crea procedimiento almacenado
--para listar las posiciones
CREATE PROC spposiciones_listar
AS
BEGIN
SELECT * FROM dbo.tblposiciones
END
GO

--Crear procedimiento para guardar posiciones
CREATE PROC spposiciones_guardar
@nombreposicion VARCHAR(50)
AS
BEGIN
INSERT INTO dbo.tblposiciones
(nombreposicion)
VALUES
(@nombreposicion)
END
GO

--Se crea procedimiento almacenado
--para listar los resultados
CREATE PROC spresultados_listar
AS
BEGIN
SELECT * FROM dbo.tblresultados
END
GO

--Se modifica procedimiento almacenado
--para listar los resultados, en �ste caso
--para realizar consulta combinada
ALTER PROC spresultados_listar
AS
BEGIN
SELECT res.numerodocumento, res.nombreparticipante,
pos.nombreposicion, pai.nombrepais
FROM dbo.tblresultados res
INNER JOIN dbo.tblposiciones pos
ON res.idposicion = pos.idposicion
INNER JOIN dbo.tblpaises pai
ON res.idpais = pai.idpais
END
GO

--Crear procedimiento para guardar resultado
CREATE PROC spresultados_guardar
@numerodocumento BIGINT,
@nombreparticipante VARCHAR(50),
@idposicion TINYINT,
@idpais TINYINT
AS
BEGIN
INSERT INTO dbo.tblresultados
(numerodocumento, nombreparticipante, idposicion, idpais)
VALUES
(@numerodocumento, @nombreparticipante, @idposicion, @idpais)
END
GO

--Se modifica procedimiento para guardar resultado
--pero obteniendo el pais desde aqu�
ALTER PROC spresultados_guardar
@numerodocumento BIGINT,
@nombreparticipante VARCHAR(50),
@idposicion TINYINT
AS
BEGIN
INSERT INTO dbo.tblresultados
(numerodocumento, nombreparticipante, idposicion, idpais)
VALUES
(@numerodocumento, @nombreparticipante, @idposicion, 
(SELECT idpais FROM dbo.tblparticipantes
WHERE numerodocumento = @numerodocumento))
END
GO

--Se crea procedimiento almacenado
--para traer el pa�s del participante
ALTER PROC sptraerpaisparticipante_listar 
@numerodocumento BIGINT
AS
BEGIN
SELECT idpais FROM dbo.tblparticipantes
WHERE numerodocumento = @numerodocumento
END
GO

--Crear procedimiento para guardar cambios posiciones
CREATE PROC spresultados_guardarcambios
@numerodocumento BIGINT,
@idposicion TINYINT
AS
BEGIN
UPDATE dbo.tblresultados SET 
idposicion = @idposicion
WHERE numerodocumento = @numerodocumento
END
GO

--Modificar procedimiento para guardar cambios 
--posiciones 
ALTER PROC spresultados_guardarcambios
@numerodocumento BIGINT,
@idposicion TINYINT
AS
BEGIN
IF @idposicion <> 0 
	UPDATE dbo.tblresultados SET 
	idposicion = @idposicion
	WHERE numerodocumento = @numerodocumento
END
GO

--Crear procedimiento para eliminar cambios posiciones
CREATE PROC spresultados_eliminar
@numerodocumento BIGINT
AS
BEGIN
DELETE FROM dbo.tblresultados 
WHERE numerodocumento = @numerodocumento
END
GO