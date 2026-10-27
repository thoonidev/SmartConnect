-----ACTIVAR LA BASE MASTER
USE MASTER
GO

----CREANDO NUEVA BASE DE DATOS
----BD_SMARTCONNECT
IF DB_ID('BD_SMARTCONNECT')IS NOT NULL
BEGIN
DROP DATABASE BD_SMARTCONNECT
END
GO
CREATE DATABASE BD_SMARTCONNECT
GO

---ACTIVAR LA BASE DE DATOS CREADA
USE BD_SMARTCONNECT
GO

--CREANDO TABLAS Y VALIDANDO
--TABLA CARGO
	CREATE TABLE CARGO
	( 
	  ID_CARGO			CHAR		(3) 	NOT NULL PRIMARY KEY,
	  NOMBRE		   VARCHAR		(30) 	NOT NULL
	)
	GO

--TABLA PROVEEDOR
CREATE TABLE PROVEEDOR
( 
ID_PROVEEDOR		CHAR		(6) 	NOT NULL PRIMARY KEY,
NOMBRE		        VARCHAR		(100) 	NOT NULL,
DIRECCION         	VARCHAR		(255) 	NOT NULL,
EMAIL		        VARCHAR	(100) 	NOT NULL
)
GO

--TABLA MARCA_CELULAR

CREATE TABLE MARCA_CELULAR
( 
ID_MARCA			CHAR		(3) 	NOT NULL PRIMARY KEY,
NOMBRE				VARCHAR		(100) 	NOT NULL,
ORIGEN				VARCHAR		(50) 	NOT NULL
)
GO

--TABLA 
CREATE TABLE CLIENTE
( 
ID_CLIENTE			CHAR		(6) 	NOT NULL PRIMARY KEY,
NOMBRE				VARCHAR		(50) 	NOT NULL,
APELLIDO_PATERNO  VARCHAR		(50) 	NOT NULL,
APELLIDO_MATERNO  VARCHAR		(50) 	NOT NULL,
DIRECCION         VARCHAR     (100)   NOT NULL,
TELEFONO          VARCHAR		(20) 	NOT NULL,
EMAIL             VARCHAR     (100)   NOT NULL
)
GO

--TABLA EMPLEADO
CREATE TABLE EMPLEADO
( 
ID_EMPLEADO			CHAR		(6) 	NOT NULL PRIMARY KEY,
NOMBRE				VARCHAR		(50) 	NOT NULL,
APELLIDO_PATERNO	VARCHAR		(50) 	NOT NULL,
APELLIDO_MATERNO	VARCHAR		(50) 	NOT NULL,
TELEFONO			VARCHAR		(20) 	NOT NULL,
EMAIL				VARCHAR     (100)   NOT NULL,
ID_CARGO			CHAR		(3) 	NOT NULL REFERENCES CARGO         
 	)
	GO

--TABLA PRODUCTO
CREATE TABLE PRODUCTO
( 
ID_PRODDUCTO		CHAR		(6) 	NOT NULL PRIMARY KEY,
MODELO				VARCHAR		(50) 	NOT NULL,
PRECIO				MONEY        		NOT NULL,
STOCK        	 	INT				NULL,
ID_MARCA			CHAR		(3) 	NOT NULL REFERENCES MARCA_CELULAR,
ID_PROVEEDOR		CHAR		(6) 	NOT NULL REFERENCES PROVEEDOR         
)
	GO

--TABLA COMPRA
CREATE TABLE COMPRA
( 
ID_COMPRA 			CHAR		(6) 	NOT NULL PRIMARY KEY,
FECHA			    DATE	     		NOT NULL,
TOTAL			    MONEY	  			NOT NULL,
ID_CLIENTE			CHAR		(6) 	NOT NULL REFERENCES CLIENTE,
 ID_EMPLEADO		CHAR        (6)     NOT NULL REFERENCES EMPLEADO   
  	)
	GO

--TABLA DETALLE_COMPRA 
CREATE TABLE DETALLE_COMPRA
( 
ID_DETALLECOMPRA 	CHAR		(6) 	NOT NULL PRIMARY KEY,
CANTIDAD			INT	  				NOT NULL,
PREC_UNITARIO	    MONEY	  			NOT NULL,
ID_COMPRA		    CHAR		(6) 	NOT NULL REFERENCES COMPRA,
ID_PRODUCTO			CHAR		(6) 	NOT NULL REFERENCES PRODUCTO
)
GO

--TABLA TELEFONO_PROVEEDOR
CREATE TABLE TELEFONO_PROVEEDOR
( 
ID_TELEFONO 	    CHAR		(3) 	NOT NULL PRIMARY KEY,
TELEFONO          VARCHAR		(20) 	NOT NULL,
ID_PROVEEDOR		CHAR		(6) 	NOT NULL REFERENCES PROVEEDOR
 )
GO


-- Insertar registros en la tabla CARGO
INSERT INTO CARGO (ID_CARGO, NOMBRE) VALUES
('001', 'Gerente'),
('002', 'Analista'),
('003', 'Desarrollador'),
('004', 'Vendedor'),
('005', 'Soporte'),
('006', 'Administrador'),
('007', 'Contador'),
('008', 'Diseñador'),
('009', 'Consultor'),
('010', 'Técnico')

-- Leer todos los datos de la tabla CARGO
SELECT * FROM CARGO

-- Insertar registros en la tabla PROVEEDOR
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL) VALUES
('P001', 'Proveedor Uno S.A.', 'Calle 123, Ciudad A', 'proveedor1@gmail.com'),
('P002', 'Proveedor Dos Ltda.', 'Avenida XYZ, Ciudad B', 'proveedor2@gmail.com'),
('P003', 'Comercio Tres S.A.C.', 'Calle Principal, Ciudad C', 'proveedor3@gmail.com'),
('P004', 'Importadora Cuatro S.A.', 'Avenida Central, Ciudad D', 'proveedor4@gmail.com'),
('P005', 'Distribuidora Cinco Ltda.', 'Calle Secundaria, Ciudad E', 'proveedor5@gmail.com'),
('P006', 'Suministros Seis S.A.', 'Avenida Principal, Ciudad F', 'proveedor6@gmail.com'),
('P007', 'Servicios Siete Ltda.', 'Calle de Servicios, Ciudad G', 'proveedor7@gmail.com'),
('P008', 'Inversiones Ocho S.A.', 'Avenida de Inversiones, Ciudad H', 'proveedor8@gmail.com'),
('P009', 'Productos Nueve Ltda.', 'Calle de Productos, Ciudad I', 'proveedor9@gmail.com'),
('P010', 'Exportadora Diez S.A.', 'Avenida de Exportación, Ciudad J', 'proveedor10@gmail.com'),
('P011', 'Industrias Once Ltda.', 'Calle Industrial, Ciudad K', 'proveedor11@gmail.com'),
('P012', 'Soluciones Doce S.A.', 'Avenida de Soluciones, Ciudad L', 'proveedor12@gmail.com'),
('P013', 'Construcciones Trece Ltda.', 'Calle de Construcciones, Ciudad M', 'proveedor13@gmail.com'),
('P014', 'Automotriz Catorce S.A.', 'Avenida Automotriz, Ciudad N', 'proveedor14@gmail.com'),
('P015', 'Logística Quince Ltda.', 'Calle de Logística, Ciudad O', 'proveedor15@gmail.com')

-- Leer todos los datos de la tabla PROVEEDOR
SELECT * FROM PROVEEDOR

-- Insertar registros en la tabla MARCA_CELULAR
INSERT INTO MARCA_CELULAR (ID_MARCA, NOMBRE, ORIGEN) VALUES
('M01', 'Samsung', 'Corea del Sur'),
('M02', 'Apple', 'Estados Unidos'),
('M03', 'Huawei', 'China'),
('M04', 'Xiaomi', 'China'),
('M05', 'Sony', 'Japón'),
('M06', 'LG', 'Corea del Sur'),
('M07', 'Motorola', 'Estados Unidos'),
('M08', 'Nokia', 'Finlandia'),
('M09', 'OnePlus', 'China'),
('M10', 'Google', 'Estados Unidos'),
('M11', 'OPPO', 'China'),
('M12', 'Vivo', 'China'),
('M13', 'Asus', 'Taiwán'),
('M14', 'HTC', 'Taiwán'),
('M15', 'Lenovo', 'China')

-- Leer todos los datos de la tabla MARCA_CELULAR
SELECT * FROM MARCA_CELULAR

-- Insertar registros en la tabla CLIENTE
INSERT INTO CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, DIRECCION, TELEFONO, EMAIL) VALUES
('C001', 'Juan', 'Gómez', 'López', 'Calle 123, Ciudad A', '123456789', 'juan@gmail.com'),
('C002', 'María', 'Hernández', 'Pérez', 'Avenida XYZ, Ciudad B', '987654321', 'maria@gmail.com'),
('C003', 'Carlos', 'Martínez', 'García', 'Calle Principal, Ciudad C', '456789123', 'carlos@gmail.com'),
('C004', 'Ana', 'Rodríguez', 'Fernández', 'Avenida Central, Ciudad D', '321654987', 'ana@gmail.com'),
('C005', 'Pedro', 'López', 'Sánchez', 'Calle Secundaria, Ciudad E', '789123456', 'pedro@gmail.com'),
('C006', 'Laura', 'Díaz', 'Gómez', 'Avenida Principal, Ciudad F', '654321789', 'laura@gmail.com'),
('C007', 'Daniel', 'Fernández', 'Hernández', 'Calle de Servicios, Ciudad G', '147258369', 'daniel@gmail.com'),
('C008', 'Sofía', 'Sánchez', 'Martínez', 'Avenida de Inversiones, Ciudad H', '258369147', 'sofia@gmail.com'),
('C009', 'Javier', 'Pérez', 'Díaz', 'Calle de Productos, Ciudad I', '369147258', 'javier@gmail.com'),
('C010', 'Isabel', 'García', 'Rodríguez', 'Avenida de Exportación, Ciudad J', '147369258', 'isabel@gmail.com'),
('C011', 'Ricardo', 'Gómez', 'Sánchez', 'Calle Industrial, Ciudad K', '369258147', 'ricardo@gmail.com'),
('C012', 'Elena', 'Hernández', 'Martínez', 'Avenida de Soluciones, Ciudad L', '258147369', 'elena@gmail.com'),
('C013', 'Alberto', 'Martínez', 'Gómez', 'Calle de Construcciones, Ciudad M', '147369852', 'alberto@gmail.com'),
('C014', 'Clara', 'Rodríguez', 'Pérez', 'Avenida Automotriz, Ciudad N', '369852147', 'clara@gmail.com'),
('C015', 'Francisco', 'Sánchez', 'García', 'Calle de Logística, Ciudad O', '852147369', 'francisco@gmail.com')

SELECT * FROM CLIENTE

-- Insertar registros en la tabla EMPLEADO
INSERT INTO EMPLEADO (ID_EMPLEADO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, TELEFONO, EMAIL, ID_CARGO) VALUES
('E001', 'Carlos', 'Gómez', 'López', '123456789', 'carlos@gmail.com', '001'),
('E002', 'Ana', 'Hernández', 'Pérez', '987654321', 'ana@gmail.com', '002'),
('E003', 'Pedro', 'Martínez', 'García', '456789123', 'pedro@gmail.com', '003'),
('E004', 'Laura', 'Rodríguez', 'Fernández', '321654987', 'laura@gmail.com', '004'),
('E005', 'Daniel', 'López', 'Sánchez', '789123456', 'daniel@gmail.com', '005'),
('E006', 'Sofía', 'Díaz', 'Gómez', '654321789', 'sofia@gmail.com', '006'),
('E007', 'Javier', 'Fernández', 'Hernández', '147258369', 'javier@gmail.com', '007'),
('E008', 'Isabel', 'Sánchez', 'Martínez', '258369147', 'isabel@gmail.com', '008'),
('E009', 'Ricardo', 'Pérez', 'Díaz', '369147258', 'ricardo@gmail.com', '009'),
('E010', 'Elena', 'García', 'Rodríguez', '147369258', 'elena@gmail.com', '010'),
('E011', 'Alberto', 'Gómez', 'Sánchez', '369258147', 'alberto@gmail.com', '001'),
('E012', 'Clara', 'Hernández', 'Martínez', '258147369', 'clara@gmail.com', '002'),
('E013', 'Francisco', 'Martínez', 'Gómez', '147369852', 'francisco@gmail.com', '003'),
('E014', 'María', 'Rodríguez', 'Pérez', '369852147', 'maria@gmail.com', '004'),
('E015', 'José', 'Sánchez', 'García', '852147369', 'jose@gmail.com', '005')

-- Leer todos los datos de la tabla CLIENTE
SELECT * FROM EMPLEADO

-- Insertar registros en la tabla PRODUCTO
INSERT INTO PRODUCTO (ID_PRODDUCTO, MODELO, PRECIO, STOCK, ID_MARCA, ID_PROVEEDOR) VALUES
('P001', 'Samsung Galaxy S21', 750.00, 50, 'M01', 'P001'),
('P002', 'iPhone 13', 1100.25, 30, 'M02', 'P002'),
('P003', 'Huawei P40 Pro', 600.25, 20, 'M03', 'P003'),
('P004', 'Xiaomi Mi 11',  650.10, 15, 'M04', 'P004'),
('P005', 'Sony Xperia 5 II', 600.08, 25, 'M05', 'P005'),
('P006', 'LG Velvet', 990.30, 10, 'M06', 'P006'),
('P007', 'Motorola Moto G Power', 350.20, 40, 'M07', 'P007'),
('P008', 'Nokia 8.3', 925.45, 5, 'M08', 'P008'),
('P009', 'OnePlus 9', 320.05, 12, 'M09', 'P009'),
('P010', 'Google Pixel 6', 1050.40, 18, 'M10', 'P010'),
('P011', 'OPPO Find X3 Pro', 875.60, 22, 'M11', 'P011'),
('P012', 'Vivo X60 Pro',  975.20, 8, 'M12', 'P012'),
('P013', 'Asus ROG Phone 5', 350.50, 14, 'M13', 'P013'),
('P014', 'HTC U20 5G', 1125.75, 35, 'M14', 'P014'),
('P015', 'Lenovo Legion Phone Duel 2', 800.30, 28, 'M15', 'P015')

-- Leer todos los datos de la tabla PRODUCTO
SELECT * FROM PRODUCTO

-- Insertar registros en la tabla COMPRA
INSERT INTO COMPRA (ID_COMPRA, FECHA, TOTAL, ID_CLIENTE, ID_EMPLEADO) VALUES
('C001', '2023-04-01', 1500.00, 'C001', 'E001'),
('C002', '2023-06-02', 2200.50, 'C002', 'E002'),
('C003', '2023-08-03', 1800.75, 'C003', 'E003'),
('C004', '2023-10-04', 1300.20, 'C004', 'E004'),
('C005', '2023-11-05', 2400.30, 'C005', 'E005'),
('C006', '2023-11-06', 1980.60, 'C006', 'E006'),
('C007', '2023-11-07', 1050.40, 'C007', 'E007'),
('C008', '2023-11-08', 1850.90, 'C008', 'E008'),
('C009', '2023-11-09', 1600.25, 'C009', 'E009'),
('C010', '2023-11-10', 2100.80, 'C010', 'E010'),
('C011', '2023-11-11', 1750.30, 'C011', 'E011'),
('C012', '2023-11-12', 1950.60, 'C012', 'E012'),
('C013', '2023-11-13', 1400.80, 'C013', 'E013'),
('C014', '2023-11-14', 2250.45, 'C014', 'E014'),
('C015', '2023-11-15', 2000.10, 'C015', 'E015')

-- Leer todos los datos de la tabla COMPRA
SELECT * FROM COMPRA


-- Insertar registros en la tabla DETALLE_COMPRA
INSERT INTO DETALLE_COMPRA (ID_DETALLECOMPRA, CANTIDAD, PREC_UNITARIO, ID_COMPRA, ID_PRODUCTO) VALUES
('DC001', 2, 750.00, 'C001', 'P001'),
('DC002', 1, 1100.25, 'C002', 'P002'),
('DC003', 3, 600.25, 'C003', 'P003'),
('DC004', 2, 650.10, 'C004', 'P004'),
('DC005', 4, 600.08, 'C005', 'P005'),
('DC006', 1, 990.30, 'C006', 'P006'),
('DC007', 3, 350.20, 'C007', 'P007'),
('DC008', 2, 925.45, 'C008', 'P008'),
('DC009', 5, 320.05, 'C009', 'P009'),
('DC010', 2, 1050.40, 'C010', 'P010'),
('DC011', 3, 875.60, 'C011', 'P011'),
('DC012', 1, 975.20, 'C012', 'P012'),
('DC013', 4, 350.50, 'C013', 'P013'),
('DC014', 2, 1125.75, 'C014', 'P014'),
('DC015', 3, 800.30, 'C015', 'P015')

-- Leer todos los datos de la tabla DETALLE_COMPRA
SELECT * FROM DETALLE_COMPRA

-- Insertar registros en la tabla TELEFONO_PROVEEDOR
INSERT INTO TELEFONO_PROVEEDOR (ID_TELEFONO, TELEFONO, ID_PROVEEDOR) VALUES
('T01', '123456789', 'P001'),
('T02', '987654321', 'P002'),
('T03', '456789123', 'P003'),
('T04', '321654987', 'P004'),
('T05', '789123456', 'P005'),
('T06', '654321789', 'P006'),
('T07', '147258369', 'P007'),
('T08', '258369147', 'P008'),
('T09', '369147258', 'P009'),
('T10', '147369258', 'P010'),
('T11', '369258147', 'P011'),
('T12', '258147369', 'P012'),
('T13', '147369852', 'P013'),
('T14', '369852147', 'P014'),
('T15', '852147369', 'P015')

-- Leer todos los datos de la tabla TELEFONO_PROVEEDOR
SELECT * FROM TELEFONO_PROVEEDOR

--Obtener detalles de un cliente en particular donde puedes cambiar el ID_CLIENTE y obtener del cliente que desees
SELECT * FROM CLIENTE WHERE ID_CLIENTE = 'C001';

-- Actualizamos la tabla PRODUCTO, y sus precios multiplicandolos por 1.1 osea aumentandole el 10% de su precio
UPDATE PRODUCTO
SET PRECIO = PRECIO * 1.1;

-- Cambiar el correo electrónico de los empleados que tienen '@gmail.com' a '@company.com' de la tabla EMPLEADO
UPDATE EMPLEADO
SET EMAIL = REPLACE(EMAIL, '@gmail.com', '@company.com')
WHERE EMAIL LIKE '%@gmail.com%';


-- Eliminar los productos con un stock igual a 0 de la tabla PRODUCTO
DELETE FROM PRODUCTO
WHERE STOCK = 0;


-- Consulta que lista las ventas del mes deseado, utilizando alias y demas
SELECT
    P.ID_PRODDUCTO AS 'ID Producto',
    P.MODELO AS 'Modelo',
    P.PRECIO AS 'Precio Unitario',
    SUM(DC.CANTIDAD) AS 'Cantidad Total Vendida',
    C.FECHA AS 'Fecha de Venta'
FROM
    DETALLE_COMPRA DC
JOIN
    PRODUCTO P ON DC.ID_PRODUCTO = P.ID_PRODDUCTO
JOIN
    COMPRA C ON DC.ID_COMPRA = C.ID_COMPRA
WHERE
    MONTH(C.FECHA) = 11 -- Reemplaza '11' con el mes deseado
    AND YEAR(C.FECHA) = 2023 -- Reemplaza '2023' con el año deseado
GROUP BY
    P.ID_PRODDUCTO, P.MODELO, P.PRECIO, C.FECHA
ORDER BY
    P.PRECIO DESC;



-- procedimiento almacenado CREATE para la tabla CLIENTE

-- Crear procedimiento almacenado para insertar un nuevo cliente
CREATE PROCEDURE sp_InsertarCliente
    @ID_CLIENTE CHAR(6),
    @NOMBRE VARCHAR(50),
    @APELLIDO_PATERNO VARCHAR(50),
    @APELLIDO_MATERNO VARCHAR(50),
    @DIRECCION VARCHAR(100),
    @TELEFONO VARCHAR(20),
    @EMAIL VARCHAR(100)
AS
BEGIN
    INSERT INTO CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, DIRECCION, TELEFONO, EMAIL)
    VALUES (@ID_CLIENTE, @NOMBRE, @APELLIDO_PATERNO, @APELLIDO_MATERNO, @DIRECCION, @TELEFONO, @EMAIL);
END;
-- Probando el procedimiento
EXEC sp_InsertarCliente
    @ID_CLIENTE = 'C016',
    @NOMBRE = 'Nuevo',
    @APELLIDO_PATERNO = 'Cliente',
    @APELLIDO_MATERNO = 'Prueba',
    @DIRECCION = 'Calle de Prueba, Ciudad P',
    @TELEFONO = '1234567890',
    @EMAIL = 'nuevo.cliente@gmail.com';



-- Procedimiento almacenado para insertar un nuevo producto

-- Crear el procedimiento almacenado
CREATE PROCEDURE sp_InsertarProducto
    @NuevoIDProducto CHAR(6),
    @MODELO VARCHAR(50),
    @PRECIO MONEY,
    @STOCK INT,
    @ID_MARCA CHAR(3),
    @ID_PROVEEDOR CHAR(6)
AS
BEGIN
    -- Sentencia INSERT para agregar un nuevo producto
    INSERT INTO PRODUCTO (ID_PRODDUCTO, MODELO, PRECIO, STOCK, ID_MARCA, ID_PROVEEDOR)
    VALUES (@NuevoIDProducto, @MODELO, @PRECIO, @STOCK, @ID_MARCA, @ID_PROVEEDOR);
END;


-- Ejecutar el procedimiento almacenado
EXEC sp_InsertarProducto
    @NuevoIDProducto = 'P016',
    @MODELO = 'Nuevo Modelo',
    @PRECIO = 1200.50,
    @STOCK = 10,
    @ID_MARCA = 'M01',
    @ID_PROVEEDOR = 'P001';


