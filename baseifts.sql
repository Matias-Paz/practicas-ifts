-- Borrar y crear la base de datos
DROP DATABASE IF EXISTS hospitalBase;
CREATE DATABASE IF NOT EXISTS hospitalBase;
use hospitalBase;

-- Borrar y crear la base de datos
DROP DATABASE IF EXISTS hospitalBase;
CREATE DATABASE IF NOT EXISTS hospitalBase;
USE hospitalBase;

-- Tabla de habitantes
CREATE TABLE habitantes (
    dni INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    sexo CHAR(1),
    estudios VARCHAR(50),
    edad INT,
    domicilio VARCHAR(100)
);

-- Tabla de empleados municipales
CREATE TABLE empleados_municipales (
    id_empleado INT PRIMARY KEY,
    puesto VARCHAR(50),
    sexo CHAR(1),
    orientacion_politica VARCHAR(50),
    dni_habitante INT, -- Cambio: dni_habitante para referenciar a habitantes
    num_tarjeta_sube VARCHAR(20),
    saldo_tarjeta_sube DECIMAL(10, 2),
    FOREIGN KEY (dni_habitante) REFERENCES habitantes(dni) -- Referencia al DNI de habitantes
);

-- Tabla de empleados del hospital
CREATE TABLE empleados_hospital (
    id_empleado INT PRIMARY KEY,
    id_empleado_municipal INT UNIQUE, -- Nuevo campo: identificador del empleado municipal
    domicilio VARCHAR(100),
    telefono VARCHAR(15),
    FOREIGN KEY (id_empleado_municipal) REFERENCES empleados_municipales(id_empleado)
);

-- Tabla de cirujanos
CREATE TABLE cirujanos (
    id_empleado INT PRIMARY KEY,
    dni INT,
    titulo VARCHAR(50),
    especialidad VARCHAR(50),
    FOREIGN KEY (id_empleado) REFERENCES empleados_hospital(id_empleado)
);

-- Tabla de pediatras
CREATE TABLE pediatras (
    id_empleado INT PRIMARY KEY,
    titulo VARCHAR(50),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    FOREIGN KEY (id_empleado) REFERENCES empleados_hospital(id_empleado)
);

-- Tabla de enfermeros
CREATE TABLE enfermeros (
    id_empleado INT PRIMARY KEY,
    titulo VARCHAR(50),
    cantidad_horas INT,
    telefono VARCHAR(15),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    FOREIGN KEY (id_empleado) REFERENCES empleados_hospital(id_empleado)
);

-- Tabla de planes sociales
CREATE TABLE planes_sociales (
    id_plan INT PRIMARY KEY,
    fecha_otorgamiento DATE,
    monto DECIMAL(10, 2),
    dni_beneficiario INT,
    FOREIGN KEY (dni_beneficiario) REFERENCES habitantes(dni)
);

-- Insertar datos en la tabla habitantes
INSERT INTO habitantes (dni, nombre, apellido, sexo, estudios, edad, domicilio) VALUES
(11111111, 'Matías', 'Paz', 'M', 'Informática', 30, 'Calle Principal 123'),
(22222222, 'Jessica', 'Tapia', 'F', 'Medicina', 35, 'Avenida Central 456'),
(33333333, 'Uriel', 'Herrera', 'M', 'Derecho', 40, 'Plaza Mayor 789'),
(44444444, 'Juan Ignacio', 'Lozano', 'M', 'Economía', 28, 'Calle Secundaria 321'),
(55555555, 'Gustavo', 'Virtos', 'M', 'Biología', 32, 'Avenida Secundaria 654'),
(66666666, 'Alicia', 'Piñeiro', 'F', 'Arquitectura', 38, 'Paseo de la Reforma 987'),
(77777777, 'Fernando', 'Melissani', 'M', 'Psicología', 45, 'Carrera 10 654'),
(88888888, 'Ludmila', 'Alvarenga', 'F', 'Historia', 33, 'Calle Principal 456'),
(99999999, 'Luis', 'Ojeda', 'M', 'Matemáticas', 29, 'Avenida Central 123'),
(10101010, 'Gabriela', 'Ovelar', 'F', 'Física', 31, 'Calle Secundaria 789');


INSERT INTO empleados_municipales (id_empleado, puesto, sexo, orientacion_politica, dni_habitante, num_tarjeta_sube, saldo_tarjeta_sube) VALUES
(1, 'Administrativo', 'M', 'Liberal', 11111111, '1234567890', 500.00),
(2, 'Técnico', 'F', 'Conservador', 22222222, '0987654321', 300.00),
(3, 'Asistente', 'M', 'Progresista', 33333333, '1357924680', 700.00),
(4, 'Analista', 'M', 'Liberal', 44444444, '2468013579', 450.00),
(5, 'Secretaria', 'M', 'Conservador', 55555555, '9876543210', 600.00);

-- Insertar datos en la tabla empleados_hospital con identificadores únicos distintos de los empleados municipales
INSERT INTO empleados_hospital (id_empleado, id_empleado_municipal, domicilio, telefono) VALUES
(1, 1, 'Calle Principal 123', '+1234567890'),
(2, 2, 'Avenida Central 456', '+0987654321'),
(3, 3, 'Plaza Mayor 789', '+1357924680'),
(4, 4, 'Calle Secundaria 321', '+2468013579'),
(5, 5, 'Avenida Secundaria 654', '+9876543210');

INSERT INTO planes_sociales (id_plan, fecha_otorgamiento, monto, dni_beneficiario) VALUES
(1, '2023-01-15', 200.00, 11111111),
(2, '2022-12-20', 150.00, 22222222),
(3, '2023-02-28', 300.00, 33333333),
(4, '2023-03-10', 250.00, 44444444),
(5, '2023-04-05', 180.00, 55555555);

INSERT INTO cirujanos (id_empleado, dni, titulo, especialidad) VALUES
(1, 66666666, 'Dr.', 'Cirugía Cardiovascular'),
(2, 77777777, 'Dra.', 'Cirugía Plástica'),
(3, 88888888, 'Dr.', 'Cirugía General');

INSERT INTO pediatras (id_empleado, titulo, fecha_nacimiento, nacionalidad) VALUES
(3, 'Dr.', '1980-05-10', 'Argentino'),
(4, 'Dra.', '1975-08-20', 'Chilena'),
(5, 'Dr.', '1988-11-15', 'Uruguayo');

INSERT INTO enfermeros (id_empleado, titulo, cantidad_horas, telefono, nombre, apellido) VALUES
(1, 'Lic.', 40, '+5432156789', 'Lucía', 'Martínez'),
(2, 'Lic.', 36, '+5411223344', 'Javier', 'González');
