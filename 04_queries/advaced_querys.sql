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


-- Windows Functions
-- 9. Top 3 países por ventas para cada año (con subconsulta)
SELECT *
FROM (
    SELECT
        f.anyo,
        p.desc_pais,
        SUM(v.ventas) AS total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY f.anyo
            ORDER BY SUM(v.ventas) DESC
        ) AS ranking
    FROM h_ventas v

    LEFT JOIN d_fecha f
        ON v.id_fecha = f.id_fecha
    LEFT JOIN d_pais p
        ON v.id_pais = p.id_pais
    GROUP BY f.anyo, p.desc_pais

) t
WHERE ranking <= 3;


-- 9. Top 3 países por ventas para cada año (con CTE)
with ranking_table as (
    SELECT
        f.anyo,
        p.desc_pais,
        sum(v.ventas) as total_sales,
        row_number() over(
            partition by f.anyo
            order by sum(v.ventas) DESC
        ) as ranking
    FROM
        h_ventas v

    LEFT JOIN d_fecha f
        ON v.id_fecha = f.id_fecha

    LEFT JOIN d_pais p
        ON v.id_pais = p.id_pais
    GROUP BY f.anyo, p.desc_pais
) 

SELECT *
FROM ranking_table
WHERE
    ranking <=3;


-- 10. Obtener el país con más ventas para cada año, mostrando:
-- año, país, ventas totales y porcentaje que representa sobre el total de ventas de ese año.
with base as (
    SELECT
        f.anyo,
        p.desc_pais,
        sum(v.ventas) as total_sales,
        row_number() OVER(
            partition by f.anyo
            order by sum(v.ventas) DESC
        ) as ranking,
            count(ventas) as number_sales,
        SUM(sum(v.ventas)) OVER( PARTITION BY f.anyo) as total_year_sales
    FROM
        h_ventas v

    LEFT JOIN d_fecha f
        ON v.id_fecha = f.id_fecha

    LEFT JOIN d_pais p
        ON v.id_pais = p.id_pais
    
    GROUP BY f.anyo, p.desc_pais
)
select 
    anyo,
    desc_pais,
    total_sales,
    total_sales/total_year_sales AS porcentaje
from base
where ranking = 1;
