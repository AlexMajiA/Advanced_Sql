-- 2. Mostrar ventas con país + categoría
select
    p.desc_pais,
    c.desc_categoria,
    v.ventas
from
    h_ventas v

left join d_pais p
on v.id_pais = p.id_pais

left join d_categoria c
on v.id_categoria = c.id_categoria

order by 1;


-- 3. Mostrar ventas con: país, categoría y tipo de tarjeta
select
    p.desc_pais,
    c.desc_categoria,
    v.ventas,
    tt.desc_tipo_tarjeta
from
    h_ventas v

left join d_pais p
on v.id_pais = p.id_pais

left join d_categoria c
on v.id_categoria = c.id_categoria

left join d_tipo_tarjeta tt
on v.id_tipo_tarjeta = tt.id_tipo_tarjeta

order by 1;


-- 4. Total ventas por país
select
    p.desc_pais,
    sum(v.ventas) as total_sales
from
    h_ventas v

left join d_pais p
on v.id_pais = p.id_pais

group by 1;


-- 5. Total ventas por país y categoría
select
    p.desc_pais,
    c.desc_categoria,
    sum(v.ventas) as total_sales
from
    h_ventas v

left join d_pais p
on v.id_pais = p.id_pais

left join d_categoria c
on v.id_categoria = c.id_categoria

group by 1,2
order by 1;


-- 6. Total ventas por año
SELECT
    f.anyo,
    sum(v.ventas) as total_sales

FROM
    h_ventas v

LEFT JOIN d_fecha f
ON v.id_fecha = f.id_fecha

GROUP BY 1
order by 1;


-- 7. Total ventas por año y país
SELECT
    f.anyo,
    p.desc_pais,
    sum(v.ventas) as total_sales

FROM
    h_ventas v

LEFT JOIN d_fecha f
ON v.id_fecha = f.id_fecha

left join d_pais p
ON v.id_pais = p.id_pais

GROUP BY 1,2
ORDER BY f.anyo, total_sales DESC;


-- 8. Top 5 países por ventas
select
    p.desc_pais,
    sum(v.ventas) as total_sales
from
    h_ventas v

left join d_pais p
on v.id_pais = p.id_pais

group by 1
order by total_sales DESC
Limit 5;