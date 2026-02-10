CREATE TABLE d_categoria (
    id_categoria INT PRIMARY KEY,
    desc_categoria VARCHAR(50)
);

CREATE TABLE d_fecha (
    id_fecha INT PRIMARY KEY,
    anyo INT NOT NULL,
    mes INT NOT NULL,
    desc_mes VARCHAR(50) NOT NULL,
    dia INT NOT NULL,
    fecha DATE,
    dia_semana VARCHAR(50)
);

CREATE TABLE d_pais (
    id_pais INT PRIMARY KEY,
    desc_pais VARCHAR(50)
);

CREATE TABLE d_tipo_tarjeta (
    id_tipo_tarjeta INT PRIMARY KEY,
    desc_tipo_tarjeta VARCHAR(50)
);

CREATE TABLE h_ventas(
	id_fecha int,
	id_categoria int,
	id_pais int,
	id_tipo_tarjeta int,
	ventas decimal (8, 2)
);

CREATE TABLE h_ventas_edit (
    id_fecha INT,
    id_categoria INT,
    id_pais INT,
    id_tipo_tarjeta INT,
    ventas DECIMAL(8,2),
    descuento VARCHAR(30)
);