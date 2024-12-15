DROP DATABASE IF EXISTS YassMedical;
CREATE DATABASE YassMedical;
USE YassMedical;

CREATE TABLE Proveedor (
  rut varchar(12) unique,
  razon_social varchar(60) NOT NULL,
  direccion varchar(100) NOT NULL,
  telefono varchar(14) NOT NULL,
  email varchar(60) NOT NULL,
  PRIMARY KEY (rut)
);

CREATE TABLE suministra (
   id_suministra INT AUTO_INCREMENT,
   rut_proveedor varchar(12) NOT NULL,
   fecha_suministro date NOT NULL,
   codigo varchar(15) NOT NULL,
   PRIMARY KEY (id_suministra)
);

CREATE TABLE Productos (
  codigo varchar(15) unique,
  descripcion varchar(100) NOT NULL,
  stock INT NOT NULL,
  valor decimal(10,2),
  PRIMARY KEY (codigo)
);

CREATE TABLE Vendedores (
  rut varchar(12) unique,
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,  
  PRIMARY KEY (rut)
);
DROP TABLE IF EXISTS Facturas;
CREATE TABLE Facturas (
  numero_factura int NOT NULL auto_increment,
  rut_cliente varchar(12) NOT NULL,
  cod_producto varchar(15) NOT NULL ,
  valor_producto decimal(10, 2) NOT NULL,
  rut varchar(12) NOT NULL,
  cantidad INT NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (numero_factura)
);

CREATE TABLE Clientes (
  rut varchar(12) unique,
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,
  telefono varchar(14) NOT NULL,
  email varchar(60) NOT NULL,
  PRIMARY KEY (rut)
);

ALTER TABLE suministra ADD CONSTRAINT rut_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE suministra ADD CONSTRAINT cod_prod FOREIGN KEY (codigo) REFERENCES Productos(codigo);
ALTER TABLE Facturas ADD CONSTRAINT rut_vendedor FOREIGN KEY (rut) REFERENCES Vendedores(rut);
ALTER TABLE Facturas ADD CONSTRAINT client_rut FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut);
ALTER TABLE Facturas ADD CONSTRAINT product_ID FOREIGN KEY (cod_producto) REFERENCES Productos(codigo);

-- ###################################################### INSERSIONES ###################################################

INSERT INTO Proveedor (rut, razon_social, direccion, telefono, email) VALUES
('12345611-9', 'MedInsumos S.A.', 'Av. Salud 123, Santiago', '987654321', 'contacto@medinsumos.cl'),
('23456722-0', 'Farmacia Saludable', 'Calle Bienestar 456, Valparaíso', '912345678', 'info@farmaciasaludable.cl'),
('34567833-1', 'Insumos Médicos Ltda.', 'Ruta Médica 789, Concepción', '934567890', 'ventas@insumosmedicos.cl'),
('45678944-2', 'Salud y Vida', 'Paseo Salud 321, La Serena', '945678901', 'contacto@saludyvida.cl'),
('56789055-3', 'Medicina Pro', 'Calle Sanitaria 654, Temuco', '956789012', 'info@medicinapro.cl'),
('67890166-4', 'Proveedores Médicos', 'Av. Clínica 987, Antofagasta', '967890123', 'ventas@proveedoresmedicos.cl'),
('78901277-5', 'Salud Integral', 'Calle Bienestar 135, Iquique', '978901234', 'contacto@saludintegral.cl'),
('89012388-6', 'Insumos Vitales', 'Av. Vital 246, Rancagua', '989012345', 'info@insumosvitales.cl'),
('90123499-7', 'Medicamentos y Más', 'Calle Medicinal 357, Puerto Montt', '990123456', 'ventas@medicamentosymas.cl'),
('01234500-8', 'Salud y Bienestar', 'Paseo Médico 468, Osorno', '991234567', 'contacto@saludybienestar.cl');

-- INSERT INTO Productos (codigo, descripcion, stock, valor) VALUES ('541LK', 'jeringa 1ml 100u.', 20, 2590.00);
INSERT INTO Productos (codigo, descripcion, stock, valor) VALUES
('INSUMO001', 'Analgesico', 100, 15.50),
('INSUMO002', 'Antibiótico', 50, 25.00),
('INSUMO003', 'Desinfectante', 200, 10.75),
('INSUMO004', 'Termómetro Digital', 75, 30.00),
('INSUMO005', 'Guantes de Látex', 500, 5.00),
('INSUMO006', 'Mascarillas Quirúrgicas', 300, 1.50),
('INSUMO007', 'Jeringas Desechables', 150, 0.75),
('INSUMO008', 'Tiras Reactivas', 80, 20.00),
('INSUMO009', 'Sueros Hidratantes', 60, 12.00),
('INSUMO010', 'Vendas Adhesivas', 250, 2.50);

INSERT INTO Vendedores (rut, nombre, apellido) VALUES
('12345678-1', 'Pedro', 'González'),
('23456789-2', 'Ana', 'Martínez'),
('34567890-3', 'Luis', 'Pérez'),
('45678901-4', 'Sofía', 'López'),
('56789012-5', 'Javier', 'Ramírez'),
('67890123-6', 'Claudia', 'Torres');

INSERT INTO Clientes (rut, nombre, apellido, telefono, email) VALUES
('12345678-9', 'Juan', 'Pérez', '987654321', 'juan.perez@example.com'),
('23456789-0', 'María', 'González', '912345678', 'maria.gonzalez@example.com'),
('34567890-1', 'Carlos', 'López', '934567890', 'carlos.lopez@example.com'),
('45678901-2', 'Ana', 'Martínez', '945678901', 'ana.martinez@example.com'),
('56789012-3', 'Luis', 'Fernández', '956789012', 'luis.fernandez@example.com'),
('67890123-4', 'Sofía', 'Ramírez', '967890123', 'sofia.ramirez@example.com'),
('78901234-5', 'Diego', 'Torres', '978901234', 'diego.torres@example.com'),
('89012345-6', 'Laura', 'Hernández', '989012345', 'laura.hernandez@example.com'),
('90123456-7', 'Javier', 'Gutiérrez', '990123456', 'javier.gutierrez@example.com'),
('01234567-8', 'Claudia', 'Vásquez', '991234567', 'claudia.vasquez@example.com');

INSERT INTO suministra (rut_proveedor, fecha_suministro, codigo) VALUES
('89012388-6', '2023-08-30', 'INSUMO007'),
('89012388-6', '2022-05-13', 'INSUMO008'),
('12345611-9', '2023-01-15', 'INSUMO001'),
('23456722-0', '2023-02-20', 'INSUMO002'),
('34567833-1', '2023-03-10', 'INSUMO003'),
('45678944-2', '2023-04-05', 'INSUMO004'),
('56789055-3', '2023-05-12', 'INSUMO005'),
('67890166-4', '2023-06-18', 'INSUMO006'),
('78901277-5', '2023-07-25', 'INSUMO007'),
('89012388-6', '2023-08-30', 'INSUMO008'),
('90123499-7', '2023-09-15', 'INSUMO009'),
('01234500-8', '2023-10-22', 'INSUMO010'),
('78901277-5', '2023-10-21', 'INSUMO007'),
('23456722-0', '2024-11-01', 'INSUMO002'),
('23456722-0', '2024-11-01', 'INSUMO002');

INSERT INTO Facturas (rut_cliente, cod_producto, valor_producto, rut, cantidad, fecha) VALUES
('45678901-2', 'INSUMO005', 5.00, '23456789-2', 2, '2023-11-01'),
('45678901-2', 'INSUMO004', 30.00, '23456789-2', 5, '2024-09-01'),
('12345678-9', 'INSUMO007', 0.75, '12345678-1', 6, '2024-07-22'),
('90123456-7', 'INSUMO009', 90.00, '56789012-5', 4, '2024-06-14'),
('90123456-7', 'INSUMO008', 20.00, '56789012-5', 3, '2024-06-14'),
('89012345-6', 'INSUMO008', 175.50, '45678901-4', 3, '2024-05-12'),
('56789012-3', 'INSUMO005', 5.00, '34567890-3', 2, '2024-04-09'),
('12345678-9', 'INSUMO003', 150.00, '12345678-1', 2, '2024-03-22'),
('12345678-9', 'INSUMO001', 150.00, '12345678-1', 2, '2024-03-25'),
('12345678-9', 'INSUMO001', 150.00, '12345678-1', 2, '2024-03-22'),
('23456789-0', 'INSUMO002', 250.50, '12345678-1', 1, '2024-02-17'),
('34567890-1', 'INSUMO003', 10.75, '23456789-2', 7, '2024-02-14'),
('34567890-1', 'INSUMO003', 10.75, '23456789-2', 3, '2024-01-10'),
('45678901-2', 'INSUMO004', 120.00, '23456789-2', 5, '2023-11-01'),
('56789012-3', 'INSUMO002', 25.00, '34567890-3', 1, '2023-09-26'),
('56789012-3', 'INSUMO005', 5.00, '34567890-3', 1, '2023-07-15'),
('56789012-3', 'INSUMO005', 5.00, '34567890-3', 1, '2023-04-09'),
('67890123-4', 'INSUMO006', 1.50, '34567890-3', 4, '2023-04-03'),
('78901234-5', 'INSUMO007', 350.00, '45678901-4', 2, '2023-03-30'),
('89012345-6', 'INSUMO008', 175.50, '45678901-4', 3, '2022-08-12'),
('90123456-7', 'INSUMO009', 90.00, '56789012-5', 6, '2022-06-14'),
('01234567-8', 'INSUMO010', 600.00, '67890123-6', 1, '2022-06-10');

-- ######################################################## VISTAS #######################################################

-- 1.Vista para ver todos los insumos recibidos en el año 2023
CREATE VIEW insumos_recibidos_2023 AS
SELECT rut_proveedor, fecha_suministro, codigo
FROM suministra
WHERE YEAR(fecha_suministro) = 2023;

SELECT * FROM  insumos_recibidos_2023;


-- 2.Vista de productos por rango de precio
CREATE VIEW vista_productos_rango_precio AS
SELECT codigo, descripcion, valor
FROM Productos
WHERE valor BETWEEN 0 AND 1000000.00;

SELECT * FROM  vista_productos_rango_precio;


-- 3.Vista para ver cantidad de facturas generadas por vendedores en orden descendente;
CREATE VIEW TotalFacturasPorVendedor AS
SELECT 
    v.rut AS rut_vendedor,
    CONCAT(v.nombre, ' ', v.apellido) AS Vendedor,
    COUNT(f.rut) AS Total
FROM 
    Vendedores v
LEFT JOIN 
    Facturas f ON v.rut = f.rut
GROUP BY 
    v.rut, v.nombre, v.apellido;

SELECT * FROM TotalFacturasPorVendedor;

-- 4.Vista para ver cuales han sido los productos mas vendidos;
CREATE VIEW ProductosMasVendidos AS
SELECT 
    p.codigo AS CodigoProducto,
    p.descripcion AS Producto,
    SUM(f.cantidad) AS Total,
    SUM(f.cantidad * f.valor_producto) AS TotalIngresos
FROM 
    Facturas f
JOIN 
    Productos p ON f.cod_producto = p.codigo
GROUP BY 
    p.codigo, p.descripcion
ORDER BY 
    Total DESC;

SELECT * FROM  ProductosMasVendidos;


-- 5.Vista para ver cuales han sido los productos mas vendidos;
CREATE VIEW ProveedoresMasSuministros AS
SELECT 
    p.rut AS RutProveedor,
    p.razon_social AS RazonSocial,
    COUNT(s.codigo) AS Total
FROM 
    Proveedor p
JOIN 
    suministra s ON p.rut = s.rut_proveedor
GROUP BY 
    p.rut, p.razon_social
ORDER BY 
    Total DESC;


SELECT * FROM ProveedoresMasSuministros;

-- 6.Vista de productos mas vendidos por cada mes durante el año 2024

CREATE VIEW ProductosVendidosPorMes AS
SELECT 
    MONTH(f.fecha) AS Mes,
    YEAR(f.fecha) AS Año,
    p.codigo AS CodigoProducto,
    p.descripcion AS Descripcion,
    SUM(f.cantidad) AS TotalUnidadesVendidas,
    SUM(f.cantidad * f.valor_producto) AS TotalIngresos
FROM 
    Facturas f
JOIN 
    Productos p ON f.cod_producto = p.codigo
GROUP BY 
    Año, Mes, p.codigo, p.descripcion
ORDER BY 
    Año, Mes, TotalUnidadesVendidas DESC;
    
SELECT * FROM ProductosVendidosPorMes WHERE Año = 2024;

-- 7. Vista para visualizar el total de facturacion anual

DROP VIEW IF exists TotalFacturacionAnual;
CREATE VIEW TotalFacturacionAnual AS
SELECT 
    YEAR(f.fecha) AS Año,
    SUM(f.valor_producto * f.cantidad) AS Total
FROM 
    Facturas f
GROUP BY 
    YEAR(f.fecha)
ORDER BY 
    año;

SELECT * FROM TotalFacturacionAnual;


-- 8. Vista para visualizar los clientes mas frecuentes

CREATE VIEW ClientesFrecuentes AS
SELECT 
    c.rut AS rut_cliente,
    CONCAT(c.nombre, ' ', c.apellido) AS Cliente,
    SUM(f.cantidad) AS Compras
FROM 
    Clientes c
JOIN 
    Facturas f ON c.rut = f.rut_cliente
GROUP BY 
    c.rut, c.nombre, c.apellido
ORDER BY 
    Compras DESC;

SELECT * FROM ClientesFrecuentes;


-- ################################################# FUNCIONES ALMACENADAS ################################################

-- 1- FUNCION PARA CALCULAR EL IVA DE UNA FACTURA

DELIMITER //
CREATE FUNCTION CalcularIVA(
    monto_bruto DECIMAL(10, 2)
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN monto_bruto * 1.19; 
END //
DELIMITER ;


SELECT numero_factura AS factura, fecha, valor_producto AS subtotal, CalcularIVA(valor_producto) AS total
FROM Facturas;


-- 2. FUNCION PARA MOSTRAR EL NOMBRE DE UN CLIENTE INGRESANDO SU NUMERO DE RUT

DELIMITER //
CREATE FUNCTION ObtenerNombreCliente(
    p_rut_cliente VARCHAR(12)
) RETURNS VARCHAR(50)
NO SQL 
BEGIN
    DECLARE v_nombre VARCHAR(20);
    DECLARE v_apellido VARCHAR(20);
    SELECT apellido, nombre INTO v_apellido, v_nombre FROM Clientes WHERE p_rut_cliente = rut;
    RETURN CONCAT(v_nombre, ' ', v_apellido) ;
END //
DELIMITER ;

SELECT ObtenerNombreCliente('12345678-9') AS nombre_cliente;


-- ################################################# STORED PROCEDURE ################################################

-- 1. PROCEDIMIENTO PARA ACTUALIZAR EL STOCK DE PRODUCTOS
DELIMITER //
CREATE PROCEDURE UpdateStock(
    IN p_codigo VARCHAR(15),
    IN p_cant INT
)
BEGIN
    UPDATE Productos
    SET stock = stock + p_cant
    WHERE codigo = p_codigo;
END //
DELIMITER ;

CALL UpdateStock('INSUMO002', 30);

SELECT * FROM Productos;

-- 2. PROCEDIMIENTO PARA GENERAR FACTURA
DELIMITER //
CREATE PROCEDURE AddBill(
    IN p_ClientRut VARCHAR(12),
    IN p_cod_product VARCHAR(15),
    IN p_SellerRut VARCHAR(12),
    IN p_amount INT,
    IN p_date DATE
)
BEGIN
    DECLARE p_price DECIMAL(10, 2);

    SELECT valor INTO p_price
    FROM Productos
    WHERE codigo = p_cod_product;  
    
    INSERT INTO Facturas (rut_cliente, cod_producto, valor_producto, rut, cantidad, fecha)
    VALUES (p_ClientRut, p_cod_product, p_price, p_SellerRut, p_amount, p_date);
END //
DELIMITER ;

CALL AddBill('01234567-8', 'INSUMO002', '12345678-1', 20, NOW());

SELECT * FROM Facturas;

-- ################################################# TRIGGERS ################################################

-- 1. TRIGGER PARA AUDITAR CAMBIOS EN PRODUCTOS

CREATE TABLE AuditoriaProductos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_producto VARCHAR(15),
    descripcion_anterior VARCHAR(100),
    descripcion_nueva VARCHAR(100),
    stock_anterior INT,
    stock_nuevo INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_products_update
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaProductos (codigo_producto, descripcion_anterior, descripcion_nueva, stock_anterior, stock_nuevo)
    VALUES (OLD.codigo, OLD.descripcion, NEW.descripcion, OLD.stock, NEW.stock);
END;

//

DELIMITER ;

UPDATE Productos
SET descripcion = 'gerdex', stock = 15
WHERE codigo = 'INSUMO003';



-- 2. TRIGGER PARA EVITAR GENERAR FACTURAS CON STOCK NEGATIVO

DELIMITER //
CREATE TRIGGER before_facturas_insert
BEFORE INSERT ON Facturas
FOR EACH ROW
BEGIN
    DECLARE stock_Actual INT;

    SELECT stock INTO stock_actual
    FROM Productos
    WHERE codigo = NEW.cod_producto;

    IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock para completar la factura.';
    END IF;
END;

//

DELIMITER ;

INSERT INTO Facturas (rut_cliente, cod_producto, valor_producto, rut, cantidad, fecha) 
VALUES ('23456789-0', 'INSUMO002', 250.50, '12345678-1', 81, '2024-02-17');



