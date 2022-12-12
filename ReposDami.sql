Use master;
		DROP DATABASE IF EXISTS ReposDami

		
/*Crear base de datos ReposDami */
CREATE DATABASE ReposDami;
GO

/* Poner en uso la base de datos */
USE ReposDami;
GO


-- Table: VENTA_DETALLE
DROP TABLE IF EXISTS VENTA_DETALLE ;
CREATE TABLE VENTA_DETALLE (
    IDVENDET int IDENTITY(1,1) NOT NULL,
	CANVENDET INT CHECK(CANVENDET LIKE '%[0-9]%'),
	SUBVENDET DECIMAL(8,2) NOT NULL,
	IDPRO int CHECK(IDPRO LIKE '%[0-9]%'),
    IDVEN int CHECK(IDVEN LIKE '%[0-9]%'),
    CONSTRAINT IDVENDET_pk PRIMARY KEY (IDVENDET)
);
GO

select * from cliente

-- Table: VENTA
DROP TABLE IF EXISTS VENTA;
CREATE TABLE VENTA (
    IDVEN int IDENTITY(1,1) NOT NULL,
    FECVEN date DEFAULT GETDATE() NOT NULL,
    IDUSU int CHECK(IDUSU LIKE '%[0-9]%'),
    IDCLI int CHECK(IDCLI LIKE '%[0-9]%'),
	TOTVEN DECIMAL(5,2) NOT NULL,
    CONSTRAINT IDVEN_pk PRIMARY KEY (IDVEN)
);
GO	


-- Table: COMPRA_DETALLE
	DROP TABLE IF EXISTS COMPRA_DETALLE ;
CREATE TABLE COMPRA_DETALLE (
    IDCOMDET int IDENTITY(1,1) NOT NULL, 
	CANCOMDET int CHECK(CANCOMDET LIKE '%[0-9]%'),
	SUBCOMDET int NOT NULL,
	IDCOM int CHECK(IDCOM LIKE '%[0-9]%'),
    IDPRO int CHECK(IDPRO LIKE '%[0-9]%'),
    CONSTRAINT IDCOMDET_PK PRIMARY KEY (IDCOMDET)
);
GO


-- Table: COMPRA
	DROP TABLE IF EXISTS COMPRA ;
CREATE TABLE COMPRA (
    IDCOM int IDENTITY(1,1) NOT NULL,
	FECCOM date NOT NULL,
	TIPCOM char(1) NOT NULL,
	IDPROV int  CHECK(IDPROV LIKE '%[0-9]%'),   
	IDUSU int  CHECK(IDUSU LIKE '%[0-9]%'),    	
    TOTCOM decimal(5,2) NOT NULL,	
    CONSTRAINT IDCOM_PK PRIMARY KEY (IDCOM)
);
GO

-- Table: CLIENTE
	DROP TABLE IF EXISTS CLIENTE;
CREATE TABLE CLIENTE (
    IDCLI int IDENTITY(1,1) NOT NULL,
    NOMCLI varchar(50)  CHECK(LEN (NOMCLI) >= 3   AND NOMCLI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    APEPATCLI varchar(50)  CHECK(LEN (APEPATCLI) >= 3   AND APEPATCLI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    APEMATCLI varchar(50)  CHECK(LEN (APEMATCLI) >= 3   AND APEMATCLI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    DNICLI char(8)  UNIQUE CHECK(LEN (DNICLI) = 8   AND DNICLI LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 8 CARACTERES OBLIGATORIOS
    EMACLI varchar(50)  UNIQUE CHECK(EMACLI LIKE '%@%._%'), -- VALIDACIÒN DE QUE EL CORREO TENGA EL FORMATO "GMAIL.COM"
    CELCLI char(9)UNIQUE CHECK(CELCLI LIKE '%[9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'),--VALIDACION PRIMER NUMERO DEBE SER 9 Y SOLO NUMEROS
    DOMCLI varchar(50)  CHECK(LEN (DOMCLI) >= 3   AND DOMCLI LIKE '%[a-zA-z ]%'),  --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	CODUBI char(6) CHECK(LEN (CODUBI) = 6   AND CODUBI LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 6 CARACTERES OBLIGATORIOS
    ESTCLI char(1) DEFAULT 'A' CHECK(ESTCLI='A' OR ESTCLI='I'), -- VALIDACIÒN DE QUE SOLO PERMITA "A" de activos o "I" de inactivos
    CONSTRAINT IDCLI_pk PRIMARY KEY (IDCLI)
);
GO


-- Table: PRODUCTO
	DROP TABLE IF EXISTS PRODUCTO ;
CREATE TABLE PRODUCTO (
    IDPRO int IDENTITY(1,1) NOT NULL,
    NOMPRO varchar(100)  UNIQUE CHECK(LEN (NOMPRO) >= 3   AND NOMPRO LIKE '%[a-zA-z 0-9/]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    DESCPRO varchar(100)  CHECK(LEN (DESCPRO) >= 3   AND DESCPRO LIKE '%[a-zA-z 0-9/]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    PREPRO	 decimal(8,2)  NOT NULL,
    STOCKPRO int  NOT NULL,
    ESTPRO char(1)  DEFAULT 'A' CHECK(ESTPRO='A' OR ESTPRO='I'), -- VALIDACIÒN DE QUE SOLO PERMITA "A" de activos o "I" de inactivos
    CONSTRAINT IDPRO_PK PRIMARY KEY (IDPRO)
);
GO



-- Table: UBIGEO
	DROP TABLE IF EXISTS UBIGEO ;
CREATE TABLE UBIGEO (
    CODUBI char(6) CHECK(LEN (CODUBI) = 6   AND CODUBI LIKE '%[0-9]%'), --VALIDACIÓN DE QUE SEAN 6 CARACTERES OBLIGATORIOS
    DEPUBI varchar(50) CHECK(LEN (DEPUBI) >= 3   AND DEPUBI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	PROUBI varchar(50) CHECK(LEN (PROUBI) >= 3   AND PROUBI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	DISUBI varchar(50) CHECK(LEN (DISUBI) >= 3   AND DISUBI LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    CONSTRAINT CODUBI_pk PRIMARY KEY (CODUBI)
);
GO

-- Table: USUARIO
	DROP TABLE IF EXISTS USUARIO ;
CREATE TABLE USUARIO (
    IDUSU int IDENTITY(1,1) NOT NULL,
    NOMUSU varchar(50)  CHECK(LEN (NOMUSU) >= 3   AND NOMUSU LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    APEUSU varchar(50)  CHECK(LEN (APEUSU) >= 3   AND APEUSU LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
    CELUSU char(9)  UNIQUE CHECK(CELUSU LIKE '%[9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'),--VALIDACION PRIMER NUMERO DEBE SER 9 Y SOLO NUMEROS
	DNIUSU char(8) UNIQUE CHECK(LEN (DNIUSU) = 8   AND DNIUSU LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 8 CARACTERES OBLIGATORIOS
	EMAUSU varchar(50) UNIQUE CHECK(EMAUSU LIKE '%@%._%'), -- VALIDACIÒN DE QUE EL CORREO TENGA EL FORMATO "GMAIL.COM"
	DOMUSU varchar(50) CHECK(LEN (DOMUSU) >= 3   AND DOMUSU LIKE '%[a-zA-z ]%'),  --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	CODUBI char(6) CHECK(LEN (CODUBI) = 6   AND CODUBI LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 6 CARACTERES OBLIGATORIOS
	ESTUSU char(1) DEFAULT 'A' CHECK(ESTUSU='A' OR ESTUSU='I'), -- VALIDACIÒN DE QUE SOLO PERMITA "A" de activos o "I" de inactivos
    CONSTRAINT IDUSU_PK PRIMARY KEY (IDUSU)
);
GO

select * from USUARIO

-- Table: PROVEEDOR
	DROP TABLE IF EXISTS PROVEEDOR ;			
CREATE TABLE PROVEEDOR (
    IDPROV int IDENTITY(1,1) NOT NULL,
	RUCPROV char(10) UNIQUE CHECK(LEN (RUCPROV) = 10   AND RUCPROV LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 10 CARACTERES OBLIGATORIOS
    RAZSOPROV varchar(50)  CHECK(LEN (RAZSOPROV) >= 3   AND RAZSOPROV LIKE '%[a-zA-z ]%'), --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	EMAPROV varchar(50) UNIQUE CHECK(EMAPROV LIKE '%@%._%'), -- VALIDACIÒN DE QUE EL CORREO TENGA EL FORMATO "GMAIL.COM"
    CELPROV char(9)  UNIQUE CHECK(CELPROV LIKE '%[9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'),--VALIDACION PRIMER NUMERO DEBE SER 9 Y SOLO NUMEROS
	DIRPROV varchar(50) CHECK(LEN (DIRPROV) >= 3   AND DIRPROV LIKE '%[a-zA-z ]%'),  --VALIDACIÓN DE QUE MINIMO SE ESCRIBA 3 CARACTERES
	CODUBI char(6) CHECK(LEN (CODUBI) = 6   AND CODUBI LIKE '%[0-9%]'), --VALIDACIÓN DE QUE SEAN 6 CARACTERES OBLIGATORIOS
	ESTPROV char(1) DEFAULT 'A' CHECK(ESTPROV='A' OR ESTPROV='I'), -- VALIDACIÒN DE QUE SOLO PERMITA "A" de activos o "I" de inactivos
    CONSTRAINT IDPROV_PK PRIMARY KEY (IDPROV)
);
GO

-- foreign keys
--1
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI) 
GO


--2
-- Reference: USUARIO_UBIGEO (table: USUARIO)
ALTER TABLE USUARIO ADD CONSTRAINT USUARIO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI) 
GO

--3
-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI) 
GO

--4
-- Reference: VENTA_USUARIO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_USUARIO
    FOREIGN KEY (IDUSU)
    REFERENCES USUARIO (IDUSU) 
GO

--5
-- Reference: VENTA_DETALLE_PRODUCTO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO)
GO

--6
-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVEN)
    REFERENCES VENTA (IDVEN)
GO

--7
-- Reference: COMPRA_PROVEEDOR (table: COMPRA)
ALTER TABLE COMPRA 
ADD CONSTRAINT COMPRA_PROVEEDOR
FOREIGN KEY (IDPROV) REFERENCES PROVEEDOR (IDPROV) 
GO

--8
-- Reference: COMPRA_DETALLE_PRODUCTO (table: COMPRA_DETALLE)   
ALTER TABLE COMPRA_DETALLE 
ADD CONSTRAINT COMPRA_DETALLE_PRODUCTO
FOREIGN KEY (IDPRO) REFERENCES PRODUCTO (IDPRO)
GO

--9
-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE COMPRA_DETALLE 
ADD CONSTRAINT COMPRA_DETALLE_COMPRA
FOREIGN KEY (IDCOM) REFERENCES COMPRA (IDCOM)
GO



--Insertamos datos a la tabla UBIGEO
INSERT INTO UBIGEO
(CODUBI, DEPUBI, PROUBI, DISUBI)
VALUES
('150501','LIMA','CAÑETE','SAN VICENTE'),
('150502','LIMA','CAÑETE','ASIA'),
('150503','LIMA','CAÑETE','CALANGO'),
('150504','LIMA','CAÑETE','CERRO AZUL'),
('150505','LIMA','CAÑETE','CHILCA'),
('150506','LIMA','CAÑETE','COAYLLO'),
('150507','LIMA','CAÑETE','IMPERIAL'),
('150508','LIMA','CAÑETE','LUNAHUANA'),
('150509','LIMA','CAÑETE','MALA'),
('150510','LIMA','CAÑETE','NUEVO IMPERIAL'),
('150511','LIMA','CAÑETE','PACARAN'),
('150512','LIMA','CAÑETE','QUILMANA'),
('150513','LIMA','CAÑETE','SAN ANTONIO'),
('150514','LIMA','CAÑETE','SAN LUIS'),
('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),
('150516','LIMA','CAÑETE','ZUÑIGA');
GO

-- Listar registro de UBIGEO

Select * from UBIGEO
GO


--Insertamos datos a la tabla CLIENTE
INSERT INTO CLIENTE
(NOMCLI, APEPATCLI, APEMATCLI, DNICLI, EMACLI, CELCLI, DOMCLI, CODUBI, ESTCLI)
VALUES
('Juan','Fajardo','Carriles','74140385','juan@gmail.com','974862456','2 de mayo','150504','A'),
('Angie','Alcala','Solorzano', '75412634','angie@gmail.com', '912364828', 'La Mar', '150506', 'A'),
('Eduardo','Ruiz', 'Villa', '15266739', 'eduardo@gmail.com', '924856021', 'Malvinas', '150506', 'A'),
('Juan','Sanches','Flores', '15738410', 'juan@hotmail.com', '912485039', '28 de Julio', '150506', 'A'),
('Luis','Fernandez','Cubillas', '71284509', 'luis@gmail.com', '923567489', 'Sucre', '150506', 'A'),
('Pedro','Ordoñez','Huaman', '16473980', 'pedro@hotmail.com', '915473976', '13 de Noviembre', '150506', 'A'),
('Esmeralda','Canales','Rojas', '71849029', 'esmeralda@hotmail.com', '926489187', 'Santa Rosa', '150501', 'A'),
('Cecilio','Sanchez','Lara', '72839024', 'cecilio@gmail.com', '934827156', 'Las Palmas', '150501', 'A'),
('Mario','Sanchez','Alcala', '14780924', 'mario@gmail.com', '932984563', '2 de Mayo', '150506', 'A'),
('Cristhian','Suarez', 'Frances','15238976', 'cristhian@hotmail.com', '965374821', 'Caltopilla', '150507', 'A'),
('Gustavo','Ormeño', 'Perales','71256309', 'gustavo@gmail.com', '952839812', 'Ramos Larrea', '150506', 'A'),
('Jose','Rivas','Escribá', '71839273', 'jose.ignacio@hotmail.com', '923519649', '13 de Noviembre', '150506', 'A'),
('Valerio','Santiago','Garcia', '72735095', 'valerio.santiago@hotmail.com', '913354032', 'Santa Rosa', '150501', 'A'),
('Teodoro','Velázquez','Caballero', '72585674', 'teodoro.velazquez@gmail.com', '914739273', 'Las Palmas', '150501', 'A'),
('Porfirio','León', 'Rivero','15728342', 'porfirio.leon@gmail.com', '942761039', '2 de Mayo', '150506', 'A'),
('Jordana','Blasco','Soteldo', '71382462', 'jordana.blasco@hotmail.com', '921056093', 'Caltopilla', '150507', 'A'),
('Soledad','Casanova','Gaya', '72639451', 'soledad.casanova@gmail.com', '972961350', 'Ramos Larrea', '150506', 'A');
GO


-- Listar registro de CLIENTE

Select * from CLIENTE
GO



--Insertamos datos a la tabla USUARIO
INSERT INTO USUARIO
(NOMUSU, APEUSU, CELUSU, DNIUSU, EMAUSU, DOMUSU, CODUBI, ESTUSU)
VALUES

('Jhianpol','Ramos','945643535','73423424','jhianpol.ramos@vallegrande.edu.pe','Av Los Laureles','150516','A'),
('Sofia Inés', 'Bolaños Velázquez', '910007822','07750457', 'sofia.bolaños@gmail.com', 'Jiron O Higgins', '150501', 'A'),
('Estefany Elisabeth', 'Romero Villa', '915647761', '25735046', 'estefany.romero@gmail.com', 'Santa Maria Alta', '150509', 'A'),
('Juana Edelmira', 'Galván Pascual', '914575236', '21261108', 'juana.galván@gmail.com', 'Av 28 de Julio', '150506', 'A'),
('Luciano Dafne', 'Rivera Campo', '915908420', '46967914', 'luciano.rivera@gmail.com', 'Av 2 de Mayo', '150506', 'A'),
('Angela Estrella', 'Rodriguez León', '921367745', '07756532', 'angela.rodriguez@gmail.com', 'Cerro Libre', '150509', 'A'),
('Rocio Jessica', 'Sotelo Lara', '916156023', '45055499', 'rocio.sotelo@gmail.com', 'Av Ayacucho', '150506', 'A'),
('Felix Renato', 'Cruz Santiago', '913881305', '06224656', 'felix.cruz@gmail.com', 'Cementerio', '150506', 'A'),
('Paul Donato', 'Ramos Roda', '925829547', '15448909', 'paul.ramos@gmail.com', 'Caltopilla', '150507', 'A'),
('Emma Rosario', 'Redondo Abascal', '923547549', '16458936', 'emma.redondo@gmail.com', 'Urb. Mariscal Ramon Castilla', '150513', 'A'),
('Bruno Julio', 'Robles Saavedra', '917420895', '12569827', 'bruno.robles@gmail.com', 'Jirón Junín', '150511', 'A'),
('Reina Manuela', 'Cáceres Tejada', '927672301', '12673920', 'reina.caceres@gmail.com', 'Carmen Alto', '150509', 'A'),
('Valerio Isaías', 'Ojeda Cárdenas', '910588801', '22378967', 'valerio.ojeda@gmail.com', 'Nuevo imperial', '150509', 'A'),
('Jenaro Bautista', 'Acosta Menendez', '923883907', '45678017', 'jenaro.acosta@gmail.com', 'C. Miraflores', '150501', 'A'),
('Cristhian Paco', 'Gámez Rodriguez', '922156180', '76890278', 'cristhian.gamez@gmail.com', 'Los Leones', '150503', 'A'),
('Agustín Manu', 'Carrillo Navarro', '921451567', '12799398', 'agustin.carrillo@gmail.com', 'Av. Arequipa', '150511', 'A'),
('Jimena Ale', 'Delgado Montoya', '910244145', '13578997', 'jimena.delgado@gmail.com', 'Asunción 8', '150506', 'I'),
('Maxi Victor', 'Torres Quintanilla', '910411462', '79628176', 'maxi.torres@gmail.com', 'Calles los claveles', '150503', 'A'),
('Pedro Max', 'Quispe Avalos', '921381283', '76223469', 'pedro.quispe@gmail.com', 'Calle las Violetas', '150503', 'A'),
('Xiomara Valentina', 'Brañes Torres', '912383824', '15467831', 'xiomara.brañes@vallegrande.edu.pe', 'Santa Maria Alta', '150509', 'A');
GO

-- Listar registro de USUARIO

Select * from USUARIO
GO




--Insertamos datos a la tabla PROVEEDOR
INSERT INTO PROVEEDOR
(RUCPROV, RAZSOPROV, EMAPROV, CELPROV, DIRPROV, CODUBI, ESTPROV)
VALUES

('7473423424','Leche Gloria','gloria@gmail.com','945456535','Gamarra','150101','A'),
('7446448444','Blanca Flor','Blanca.Flor@gmail.com','945747474','Gamarra','150101','A'),
('7783636424','La Calera','La.Calera@gmail.com','922222535','Exportacion','150101','A'),
('7121423424','Costeño','Costeño@gmail.com','999922535','Gamarra','150101','A');

GO

-- Listar registro de PROVEEDOR

Select * from PROVEEDOR
GO


 
--Insertamos datos a la tabla PRODUCTO
INSERT INTO PRODUCTO
(NOMPRO, DESCPRO, PREPRO, STOCKPRO, ESTPRO)
VALUES
('Tortas', 'Ofrecemos tortas de tres leches, de chocolate', '70.00','20','A'),
('Alfajores', 'Dulces de casa', '15.50','30','A'),
('Milonjas', 'Buen sabor y precio', '10.80','10','A'),
('Budin', 'Sabores de pasas de uva', '5.00','15','A'),
('Pay', 'Sabores de maracuyá, limón, gelatina', '3.50','30','A'),
('Gelatinas', 'Elaborados en casa', '2.50','17','A'),
('Mazamorras', 'Dulces para alegrar el día', '2.00','12','A');
GO

-- Listar registro de PRODUCTO

Select * from PRODUCTO
GO

--Insertamos datos a la tabla VENTA

INSERT INTO VENTA
(IDUSU,IDCLI,TOTVEN)
VALUES
('1','1','20.00'),
('2','2','15.50'),
('3','3','25.00'),
('4','4','30.00'),
('5','5','12.00'),
('6','6','10.00'),
('7','7','7.00');
GO

-- Listar registro de VENTA

Select * from VENTA
GO



-- Insertamos datos a VENTA_DETALLE

INSERT INTO VENTA_DETALLE
(CANVENDET,SUBVENDET,IDPRO,IDVEN)
VALUES
('12','10.20','1','1'),
('10','12.10','2','2'),
('2','5.30','2','3'),
('4','15.50','3','4'),
('3','20.00','1','5'),
('5','7.30','3','6'),
('5','5.80','3','6');
GO

-- Listar registro de VENTA_DETALLE

Select * from VENTA_DETALLE
GO




--vista para Cliente
DROP view IF EXISTS vCliente ;
GO

CREATE VIEW vCliente AS
SELECT
     C.IDCLI AS IDCLI, 
     C.NOMCLI AS NOMCLI,
     C.APEPATCLI AS APEPATCLI,
	 C.APEMATCLI AS APEMATCLI,
	 C.DNICLI AS DNICLI,
	 C.EMACLI AS EMACLI, 
     C.CELCLI AS CELCLI,
	 C.DOMCLI AS DOMCLI,
     U.CODUBI AS CODUBI,
	 U.DISUBI AS DISUBI, 
	 U.PROUBI AS PROUBI,
	 U.DEPUBI AS DEPUBI,
	 C.ESTCLI AS ESTCLI,
	 ROW_NUMBER() OVER (ORDER BY C.IDCLI DESC) AS ORDEN
FROM 
     CLIENTE C
 INNER JOIN UBIGEO U ON
	 C.CODUBI = U.CODUBI
GO

select * from vCliente


--vista para Usuario/Vendedor
DROP view IF EXISTS vUsuario ;
GO

CREATE VIEW vUsuario AS
SELECT
     US.IDUSU AS IDUSU, 
     US.NOMUSU AS NOMUSU,
     US.APEUSU AS APEUSU,
	 US.CELUSU AS CELUSU,
	 US.DNIUSU AS DNIUSU, 
     US.EMAUSU AS EMAUSU,
	 US.DOMUSU AS DOMUSU,
     US.CODUBI AS CODUBI,
	 U.DISUBI AS DISUBI, 
	 U.PROUBI AS PROUBI,
	 U.DEPUBI AS DEPUBI,
	 US.ESTUSU AS ESTUSU,
	 ROW_NUMBER() OVER (ORDER BY US.IDUSU DESC) AS ORDEN
FROM 
     USUARIO US
 INNER JOIN UBIGEO U ON
	 US.CODUBI = U.CODUBI
GO

select * from vUsuario



-- Vista usada en Venta
DROP view IF EXISTS vVenta ;
GO

CREATE VIEW vVenta
AS
SELECT
    V.IDVEN AS IDVEN,
    C.DNICLI AS DNICLI,
	C.IDCLI AS IDCLI,
	UPPER(CONCAT(C.APEPATCLI, C.APEMATCLI,' ',C.NOMCLI)) AS NOMCLI,
    V.FECVEN AS FECVEN,
    V.TOTVEN AS TOTVEN
FROM VENTA AS V
    INNER JOIN CLIENTE AS C
    ON V.IDCLI = C.IDCLI
GO



--vista para producto
DROP view IF EXISTS vProducto ;
GO

CREATE VIEW vProducto
AS
SELECT 
	P.IDPRO AS IDPRO,
	P.NOMPRO AS NOMPRO,
	P.DESCPRO AS DESCPRO,
	P.PREPRO AS PREPRO,
	P.STOCKPRO AS STOCKPRO,
	P.ESTPRO AS ESTPRO,

	ROW_NUMBER() OVER (ORDER BY P.IDPRO DESC) AS ORDEN
FROM PRODUCTO AS P 

GO

select * from vProducto




-- Vista para COMPRA
--DROP view IF EXISTS vCOMPRA ;
--GO

--CREATE VIEW vCOMPRA
--AS
--SELECT
 --   C.IDCOM AS IDCOM,
 --   C.FECCOM AS FECCOM,
 --   P.IDPRO AS IDPRO,
 --   P.RUCPRO AS RUCPRO,
--	P.NOMPRO AS NOMPRO,
--	P.NCOPRO AS NCOPRO,
 --   C.TOTCOM AS TOTCOM
--FROM COMPRA AS C
--    INNER JOIN PROVEEDOR AS P
 --   ON C.IDPRO = P.IDPRO
--GO



-- Vista reporte de venta
--DROP view IF EXISTS vReporte ;
--GO

--CREATE VIEW vReporte
--AS
--SELECT 
--	V.IDVEN,
--	V.FECVEN,
--	(UPPER(C.APECLI) + ', ' + C.NOMCLI) AS CLIENTE,
--	C.DNICLI AS DNI_CLIENTE,
--	(U.DISUBI + ' | ' + U.PROUBI + ' | ' + U.DEPUBI) AS UBICACION,
--	VD.CANVENDET,
--	P.NOMPRE AS PRENDA,
--	P.PRECPRE AS PRECIO,
--	(P.PRECPRE * VD.CANVENDET) AS SUBTOTAL
-- FROM VENTA AS V INNER JOIN CLIENTE AS C
--	ON V.IDCLI = C.IDCLI
--	INNER JOIN UBIGEO AS U
--	ON C.CODUBI = U.CODUBI
--	INNER JOIN VENTA_DETALLE AS VD
--	ON V.IDVEN = VD.IDVEN
--	INNER JOIN PRENDA AS P
--	ON VD.IDPRE = P.IDPRE
-- GO

-- select * from CLIENTE
