-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS juegaya_db;
USE juegaya_db;

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCompleto VARCHAR(100) NOT NULL,
    TipoCliente ENUM('P1', 'P2', 'S1', 'S2') NOT NULL,
    Telefono VARCHAR(15),
    Pais VARCHAR(50),
    FechaRegistro DATE NOT NULL DEFAULT CURRENT_DATE,
    Notas TEXT
);

-- Crear tabla de Cuentas
CREATE TABLE Cuentas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCuenta VARCHAR(50) NOT NULL,
    Detalles TEXT,
    Juegos TEXT, -- Puede ser JSON si el motor es InnoDB y la versión de MySQL lo soporta
    Disponibilidad BOOLEAN DEFAULT TRUE,
    Cantidad INT NOT NULL DEFAULT 0,
    PrecioIndividual DECIMAL(10, 2),
    ValorTotal DECIMAL(10, 2)
);

-- Crear tabla de Transacciones
CREATE TABLE Transacciones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT NOT NULL,
    Operacion ENUM('C1', 'C2', 'V1', 'V2') NOT NULL,
    CuentaID INT NOT NULL,
    Factura VARCHAR(50),
    CodigoTransaccion VARCHAR(50) NOT NULL UNIQUE,
    Fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(ID) ON DELETE CASCADE
);

-- Crear tabla de Finanzas
CREATE TABLE Finanzas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CuentaID INT NOT NULL,
    Ingreso DECIMAL(10, 2) NOT NULL DEFAULT 0,
    Inversion DECIMAL(10, 2) NOT NULL DEFAULT 0,
    Ganancia DECIMAL(10, 2) AS (Ingreso - Inversion) STORED,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(ID) ON DELETE CASCADE
);

-- Crear tabla de Credenciales
CREATE TABLE Credenciales (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CuentaID INT NOT NULL,
    Correo VARCHAR(100),
    Usuario VARCHAR(50),
    Contrasena1 VARCHAR(50),
    Contrasena2 VARCHAR(50),
    Juegos TEXT,
    Detalles TEXT,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(ID) ON DELETE CASCADE
);

-- Crear índices para mejorar rendimiento
CREATE INDEX idx_cliente_tipo ON Clientes(TipoCliente);
CREATE INDEX idx_transaccion_fecha ON Transacciones(Fecha);
CREATE INDEX idx_cuentas_disponibilidad ON Cuentas(Disponibilidad);

-- Insertar datos iniciales en Clientes
INSERT INTO Clientes (NombreCompleto, TipoCliente, Telefono, Pais, Notas) 
VALUES ('Juan Pérez', 'P1', '123456789', 'Panamá', 'Cliente principal con prioridad alta.');

-- Insertar datos iniciales en Cuentas
INSERT INTO Cuentas (NombreCuenta, Detalles, Juegos, Disponibilidad, Cantidad, PrecioIndividual, ValorTotal) 
VALUES ('CuentaEjemplo', 'Cuenta con varios juegos', '[\"Juego1\", \"Juego2\"]', TRUE, 1, 20.00, 20.00);

-- Insertar datos iniciales en Transacciones
INSERT INTO Transacciones (ClienteID, Operacion, CuentaID, CodigoTransaccion) 
VALUES (1, 'C1', 1, 'TRX123456');
