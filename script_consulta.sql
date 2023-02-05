select a.id_coche, b.nombre, c.nombre, d.nombre, e.nombre, a.fecha_compra, a.matricula, a.km, a.numero_poliza, f.nombre
from flota_vehiculos.vehiculos a inner join flota_vehiculos.modelos b on a.id_modelo = b.id_modelo
inner join flota_vehiculos.marcas c on a.id_marca = c.id_marca
inner join flota_vehiculos.grupo_empresarial d on a.id_ge = d.id_ge
inner join flota_vehiculos.colores e on a.id_color = e.id_color
inner join flota_vehiculos.seguros f on a.id_seguro = f.id_seguro
where fecha_baja is null;
