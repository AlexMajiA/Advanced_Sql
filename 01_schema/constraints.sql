ALTER TABLE h_ventas
ADD CONSTRAINT fk_h_ventas_categoria
FOREIGN KEY (id_categoria)
REFERENCES d_categoria (id_categoria);

ALTER TABLE h_ventas
ADD CONSTRAINT fk_h_ventas_fecha
FOREIGN KEY (id_fecha)
REFERENCES d_fecha (id_fecha);

ALTER TABLE h_ventas
ADD CONSTRAINT fk_h_ventas_pais
FOREIGN KEY (id_pais)
REFERENCES d_pais (id_pais);

ALTER TABLE h_ventas
ADD CONSTRAINT fk_h_ventas_tipo_tarjeta
FOREIGN KEY (id_tipo_tarjeta)
REFERENCES d_tipo_tarjeta (id_tipo_tarjeta);