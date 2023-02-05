create schema flota_vehiculos authorization kudwvevs;

create table flota_vehiculos.vehiculos(
	id_coche varchar(10) not null, --PK
	id_ge varchar(10) not null,
	id_marca varchar(10) not null,
	id_modelo varchar(10) not null,
	id_color varchar(10) not null,
	matricula varchar(12) not null,
	id_seguro varchar(10) not null,
	km numeric not null,
	fecha_compra date not null,
	numero_poliza varchar(20) not null
);

--Añadimos fecha de baja 

alter table flota_vehiculos.vehiculos
add column fecha_baja date null;

--Añadimos la PK

alter table flota_vehiculos.vehiculos
add constraint vehiculos_PK primary key (id_coche);

--Creamos tabla Grupo empresarial 

create table flota_vehiculos.grupo_empresarial(
	id_ge varchar(10) not null,  --PK
	nombre varchar(50) not null,
	constraint id_ge_PK primary key(id_ge)
);

--Creamos tabla Marcas

create table flota_vehiculos.marcas(
	id_ge varchar(10) not null, -- FK a grupo_empresarial
	id_marca varchar(10) not null,--Pk
	nombre varchar(50) not null
);

--Añadimos la PK

alter table flota_vehiculos.marcas
add constraint marcas_PK primary key (id_marca);

--Añadimos la FK

alter table flota_vehiculos.marcas
add constraint marcas_grupo_empresarial_FK foreign key(id_ge)
references flota_vehiculos.grupo_empresarial (id_ge);

--Creamos la tabla Modelos

create table flota_vehiculos.modelos(
	id_marca varchar(10) not null,  --FK a marcas
	id_modelo varchar(10) not null,   --PK
	nombre varchar(50) not null
);

--Añadimos la PK

alter table flota_vehiculos.modelos
add constraint modelos_PK primary key (id_modelo);

--Añadimos la FK

alter table flota_vehiculos.modelos
add constraint modelos_marcas_FK foreign key (id_marca)
references flota_vehiculos.marcas (id_marca);

--Creamos la tabla Colores

create table flota_vehiculos.colores(
	id_color varchar (10) not null,  --PK
	nombre varchar (25) not null,
	constraint id_color_PK primary key (id_color)
);	

--Creamos la tabla Seguros

create table flota_vehiculos.seguros(
	id_seguro varchar(10) not null,  --PK
	nombre varchar (50) not null,
	constraint seguros_PK primary key (id_seguro)
);

--añadimos las FK sobre la tabla Vehiculos

alter table flota_vehiculos.vehiculos
add constraint ge_Fk foreign key (id_ge)
references flota_vehiculos.grupo_empresarial (id_ge);

alter table flota_vehiculos.vehiculos
add constraint marca_FK foreign key (id_marca)
references flota_vehiculos.marcas (id_marca);

alter table flota_vehiculos.vehiculos
add constraint modelo_Fk foreign key (id_modelo)
references flota_vehiculos.modelos (id_modelo);

alter table flota_vehiculos.vehiculos
add constraint color_Fk foreign key (id_color)
references flota_vehiculos.colores (id_color);

alter table flota_vehiculos.vehiculos
add constraint seguro_Fk foreign key (id_seguro)
references flota_vehiculos.seguros(id_seguro);


--Creamos la tabla revisiones

create table flota_vehiculos.revisiones(
	id_coche varchar(10) not null,   --PK, FK a vehiculos
	num_revision integer not null,   --PK
	km_revision numeric not null,
	fecha_revision date not null,
	importe numeric not null,        
	id_moneda varchar(10) not null   --FK
);

--Añadimos PK multiples

alter table flota_vehiculos.revisiones
add constraint revisiones_PK primary key(id_coche, num_revision);

--Añadimos la FK

alter table flota_vehiculos.revisiones
add constraint revisiones_vehiculos_FK foreign key (id_coche)
references flota_vehiculos.vehiculos(id_coche);


--Creamos la tabla Moneda

create table flota_vehiculos.moneda(
	id_moneda varchar(10) not null,
	nombre varchar(50) not null
);

--Añadimos la PK

alter table flota_vehiculos.moneda
add constraint moneda_PK primary key(id_moneda);

--Añadimos la FK a Revisiones

alter table flota_vehiculos.revisiones
add constraint revisones_moneda_FK foreign key(id_moneda)
references flota_vehiculos.moneda(id_moneda);


--Añadimos datos en tabla Grupo empresarial

insert into flota_vehiculos.grupo_empresarial
(id_ge, nombre)
values('GE1', 'Grupo VAG');

insert into flota_vehiculos.grupo_empresarial
(id_ge, nombre)
values('GE2', 'Toyota Motor Corporation');

insert into flota_vehiculos.grupo_empresarial
(id_ge, nombre)
values('GE3', 'Hyundai');

--Añadimos datos en tabla marcas

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE1', 'SE', 'Seat');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE1', 'AU', 'Audi');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE1', 'VW', 'Volkswagen');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE2', 'TO', 'Toyota');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE2', 'LE', 'Lexus');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE3', 'KI', 'Kia');

insert into flota_vehiculos.marcas
(id_ge, id_marca, nombre)
values('GE3', 'HY', 'Hyundai');

--Añadimos datos en la tabla modelos

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('SE', 'IB1', 'Ibiza');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('SE', 'AL1', 'Altea');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('SE', 'LE1', 'Leon');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('VW', 'PO1', 'Polo');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('TO', 'YA1', 'Yaris');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('TO', 'HI1', 'Hiace');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('TO', 'CO1', 'Corolla');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('KI', 'NI1', 'Niro');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('KI', 'SP1', 'Sportage');

insert into flota_vehiculos.modelos
(id_marca, id_modelo, nombre)
values('KI', 'IC1', 'Iconic');

--Añadimos los colores

insert into flota_vehiculos.colores
(id_color, nombre)
values('001','Blanco');

insert into flota_vehiculos.colores
(id_color, nombre)
values('002', 'Negro');

insert into flota_vehiculos.colores
(id_color, nombre)
values('003', 'Azul oscuro');

insert into flota_vehiculos.colores
(id_color, nombre)
values('004', 'Celeste');

insert into flota_vehiculos.colores
(id_color, nombre)
values('005', 'Rojo');

insert into flota_vehiculos.colores
(id_color, nombre)
values('006', 'Vino');

insert into flota_vehiculos.colores
(id_color, nombre)
values('007', 'Plateado');

insert into flota_vehiculos.colores
(id_color, nombre)
values('008', 'Amarillo');

insert into flota_vehiculos.colores
(id_color, nombre)
values('009', 'Verde oscuro');

insert into flota_vehiculos.colores
(id_color, nombre)
values('010', 'Verde');

--Añadimos los seguros

insert into flota_vehiculos.seguros
(id_seguro, nombre)
values('SEG01', 'Axa');

insert into flota_vehiculos.seguros
(id_seguro, nombre)
values('SEG02','Reale');

insert into flota_vehiculos.seguros
(id_seguro, nombre)
values('SEG03', 'Allianz');

insert into flota_vehiculos.seguros
(id_seguro, nombre)
values('SEG04', 'Mapfre');


insert into flota_vehiculos.seguros
(id_seguro, nombre)
values('SEG05', 'Linea Directa');


--Añadimos datos a la tabla Moneda

insert into flota_vehiculos.moneda
(id_moneda, nombre)
values('01', 'Euro');

insert into flota_vehiculos.moneda
(id_moneda, nombre)
values('02', 'Dolar');

--Añadimos datos a la tabla vehiculos

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH01', 'GE1', 'SE', 'IB1', '001', '1234ABC', 'SEG02', '130000', '2009/10/10', '002536');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH02', 'GE2', 'TO', 'CO1', '003', '2345DEF', 'SEG04', '102000', '2004/07/07', '896532');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH03', 'GE2', 'TO', 'YA1', '004', '3456GHI', 'SEG05', '98000', '2018/02/02', '5514396');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH04', 'GE1', 'VW', 'PO1', '007', '4567JKL', 'SEG01', '163000', '2000/05/05', '42536');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH05', 'GE1', 'SE', 'LE1', '008', '5678MNO', 'SEG02', '150000', '2011/05/08', '1326551');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH06', 'GE2', 'TO', 'HI1', '001', '6789PQR', 'SEG02', '189000', '2002/01/03', '15498451');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH07', 'GE3', 'KI', 'NI1', '006', '7890STU', 'SEG03', '20000', '2022/08/08', '622455');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH08', 'GE1', 'SE', 'AL1', '007', '8901VWX', 'SEG04', '145000', '2015/09/09', '7785469');

insert into flota_vehiculos.vehiculos
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza)
values('VEH09', 'GE3', 'KI', 'SP1', '002', '9012YZA', 'SEG05', '1000', '2022/12/02', '56121554');

insert into flota_vehiculos.vehiculos 
(id_coche, id_ge, id_marca, id_modelo, id_color, matricula, id_seguro, km, fecha_compra, numero_poliza, fecha_baja)
values('VEH10', 'GE1', 'VW', 'PO1', '008', '3554LKJ', 'SEG04', '205000', '1999/05/02', '6322984', '2022/05/12');


--Añadimos datos en la tabla revisiones
insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '001', '1000', '2010/02/02', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '002', '20000', '2012/03/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '003', '40000', '2014/05/05', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '004', '60000', '2016/06/06', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '005', '80000', '2018/01/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '006', '100000', '2020/08/08', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH01', '007', '120000', '2022/12/11', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '001', '1000', '2004/12/11', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '002', '20000', '2007/05/05', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '003', '40000', '2011/03/06', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '004', '60000', '2015/08/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '005', '80000', '2018/07/04', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH02', '006', '100000', '2022/01/08', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH03', '001', '60000', '2018/02/02', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH03', '002', '80000', '2021/03/06', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '001', '1000', '2000/10/10', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '002', '20000', '2003/08/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '003', '40000', '2006/07/05', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '004', '60000', '2009/07/04', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '005', '80000', '2012/05/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '006', '100000', '2015/12/02', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '007', '120000', '2018/11/04', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '008', '140000', '2020/08/08', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH04', '009', '160000', '2023/02/02', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '001', '50000', '2011/05/08', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '002', '70000', '2013/07/12', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '003', '90000', '2015/12/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '004', '110000', '2017/08/07', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '005', '130000', '2019/02/04', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH05', '006', '150000', '2022/12/12', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '001', '1000', '2002/05/06', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '002', '20000', '2004/07/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '003', '40000', '2006/08/12','45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '004', '60000', '2008/04/05', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '005', '80000', '2010/03/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '006', '100000', '2012/06/08', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '007', '120000', '2014/07/11', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '008', '140000', '2016/12/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '009', '160000', '2018/03/02', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH06', '010', '180000', '2020/08/08', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH07', '001', '1000', '2022/09/09', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH07', '002', '20000', '2023/01/02', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH08', '001', '80000', '2015/09/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH08', '002', '100000', '2017/04/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH08', '003', '120000', '2019/04/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH08', '004', '140000', '2022/12/12', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH09', '001', '10000', '2023/01/02', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '001', '1000', '1999/10/11', '0', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '002', '20000', '2001/09/08', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '003', '40000', '2004/09/05', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '004', '60000', '2007/12/15', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '005', '80000', '2010/05/19', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '006', '100000', '2012/03/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '007', '120000', '2014/08/09', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '008', '140000', '2016/01/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '009', '160000', '2018/01/03', '45', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '010', '180000', '2020/08/08', '50', '01');

insert into flota_vehiculos.revisiones
(id_coche, num_revision, km_revision , fecha_revision , importe, id_moneda)
values('VEH10', '011', '200000', '2022/04/04', '50', '01');
