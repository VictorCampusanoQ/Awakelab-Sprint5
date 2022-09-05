/********** creación de tablas **********/

create table proveedores (
	rut_proveedor varchar(12),
    nombre_proveedor varchar(50),
    nomRepLegal_proveedor varchar(50),
    nombre_categoria varchar(20),
	numero1_telefono varchar(15), 
    numero2_telefono varchar(15), 
    ejecutivo_telefono varchar(50),
    correo_proveedor varchar(30),
    primary key (rut_proveedor)
);
    
create table categorias (
	id_categoria int not null auto_increment,
    nombre_categoria varchar(20),
    describe_categoria varchar(80),
    primary key (id_categoria)
);
    
create table clientes (
	rut_cliente varchar(15),
	nombre_cliente varchar(30), 
	apellido_cliente varchar(30),
    direccion_cliente varchar(70),   
    correo_cliente varchar(30),
    primary key (rut_cliente)
    );
    
create table productos (
	id_producto int not null auto_increment,
	precio_producto int, 
    inventario_producto int,
	idcategoria_producto int,
    nombre_producto varchar(50),
    unidad_producto varchar(10),
    rutproveedor_producto varchar(15),   
    color_producto varchar(10),
    primary key (id_producto),
    foreign key (rutproveedor_producto) references proveedores(rut_proveedor),
    foreign key (idcategoria_producto) references categorias(id_categoria)
    );

create table ventas (
	id_venta int not null auto_increment,
	vendedor varchar(50), 
    fecha_venta date,
	clientes_rutcliente varchar(15),
    primary key (id_venta),
    foreign key (clientes_rutcliente) references clientes(rut_cliente)
);

create table detalle_venta (
	idventa_detalle int not null,
    idproducto_detalle int not null,
    cantidad_detalle int ,
    subtotal_detalle int,
    impuesto_detalle int,
    total_detalle int,
    primary key (idventa_detalle, idproducto_detalle),
    foreign key (idproducto_detalle) references productos(id_producto),
    foreign key (idventa_detalle) references ventas(id_venta)
    );
    
/********** modificaciones a tablas **********/
alter table proveedores modify column nombre_categoria varchar(30);
alter table productos modify column inventario_producto int not null check (inventario_producto >= 0);
alter table categorias modify column nombre_categoria varchar(30);

    
/********** ingreso de datos **********/

insert into proveedores values("77777777-1", "Electrónica Comercial Buenas Peras", "Juan Carlos Morales", "Repuestos celulares", "224446467", "800373600", "Pilar Santelices Díaz", "pilar.satelices@gmail.com");
insert into proveedores values("77777777-2", "Comercial NewComputers Ltda", "Romina Rodriguez Roman", "Computadores ASUS", "911111111", "22567895", "Rocío Pereira Robles", "rocio.pereira@gmail.com");
insert into proveedores values("77777777-3", "Comercial FutureComputers ltda", "Roberto Gutierrez Altamirano", "Computadores, impresoras", "922222222", "221234566", "Rogelio Delgado Pérez", "rdelgado@gmail.com");
insert into proveedores values("77777777-4", "Comercial Todo TV S.A.", "Pedro Ramírez Brito", "Televisores AOC", "933333333", "227897899", "Roberto Rodríguez", "rrodriguez@gmail.com");
insert into proveedores values("77777777-5", "Importadora TodoPrint Ltda.", "Imprimiendo Impresora", "Todo impresoras", "944444444", "", "Irma Pérez González", "irma.p.gonzalez@gmail.com");
insert into proveedores values("77777777-6", "Comercial Impresoras Mundiales SA", "Juan Toledo Print", "Todo impresoras", "955555555", "222222222", "Eduardo palacios Roman", "ed.palacios@gmail.com");
insert into proveedores values("77777777-7", "Comercial Electrónica Chile SA", "Chian Ching Chung", "Teléfonos Celulares", "966666666", "223333333", "Bernardita Buenos Aíres", "ber.buenosaires@gmail.com");
insert into proveedores values("77777777-8", "Comercial teléfonos Chilenos SA", "Luis Concha Detumadre", "Teléfonos Celulares", "977777777", "224444444", "Rosario Fierro Melo", "rosamelofierro@gmail.com");
insert into proveedores values("77777777-9", "Electronica y Telefonía Las Cruces ltda", "Barbabás Collins", "Repuestos de todo", "988888888", "225555555", "Santino Santoro Solis", "santino.santoro@gmail.com");
insert into proveedores values("77777777-0", "Importadores Asociados Los Chupasangre", "Juan Carlos Latorre", "Computadores, accesorios", "999999999", "226666666", "Eulalia Caldera Caliente", "eul.caldera.caliente@gmail.com");
select * from proveedores;


insert into  categorias (nombre_categoria, describe_categoria ) values("Computadores y repuestos HP", " toooodo computadores, notebooks y respuestos HP" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Computadores y repuestos ASUS", " toooodo computadores, notebooks y respuestos ASUS" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Computadores y repuestos LENOVO", " toooodo computadores, notebooks y respuestos LENOVO" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Computadores y repuestos APPLE", " toooodo computadores, notebooks y respuestos APPLE" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Computadores y repuestos ACER", " toooodo computadores, notebooks y respuestos ACER" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Impresoras y otros HP", " toooodo impresoras, suministros HP" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Impresoras y otros Epson", " toooodo impresoras, suministros Epson" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Impresoras y otros Brother", " toooodo impresoras, suministros Brother"  );
insert into  categorias (nombre_categoria, describe_categoria ) values("Impresoras y otros Canon", " toooodo impresoras, suministros Canon"  );
insert into  categorias (nombre_categoria, describe_categoria ) values("Accesorios computación", " toooodo accesorios,  parlantes, etc, etc" );
insert into  categorias (nombre_categoria, describe_categoria ) values("Mubles computación", " toooodo sillas, escritorios, modulares, etc"  );
insert into  categorias (nombre_categoria, describe_categoria ) values("Televisores y pantallas", " toooodo televisores, pantallas, monitores, video"  );
select * from categorias;

insert into  clientes value("88888888-0", "Rubén ", "Hormazábal", "Sin camino, sin calle, sin número, Los Molles, V región", "ruben.hormazabal@gmail.com");
insert into  clientes value("88888888-1", "Víctor ", "Campusano", "En alguna parte de Coquimbo, IV región", "ruben.hormazabal@gmail.com");
insert into  clientes value("88888888-2", "Jorge", "Tapia", "Nunca visto s/n, sin ciudad, sin ley, V región", "jorge.tapia@gmail.com");
insert into  clientes value("88888888-3", "Cristian", "Matamala", "En algún garito clandestino de Villa Alemana, V región", "cristan.matamala@gmail.com");
insert into  clientes value("88888888-4", "Guillermo", "Ondarza", "El Manzano 3245, Miraflores, Viña del Mar, V región", "guillermo.ondarza@gmail.com");
insert into  clientes value("88888888-5", "Rubén ", "Hormazábal", "Sin camino, sin calle, sin número, Los Molles, V región", "ruben.hormazabal@gmail.com");
insert into  clientes value("88888888-6", "Víctor ", "Campusano", "En alguna parte de Coquimbo, IV región", "ruben.hormazabal@gmail.com");
insert into  clientes value("88888888-7", "Jorge", "Tapia", "Nunca visto s/n, sin ciudad, sin ley, V región", "jorge.tapia@gmail.com");
insert into  clientes value("88888888-8", "Cristian", "Matamala", "En algún garito clandestino de Villa Alemana, V región", "cristan.matamala@gmail.com");
insert into  clientes value("88888888-9", "Guillermo", "Ondarza", "El Manzano 3245, Miraflores, Viña del Mar, V región", "guillermo.ondarza@gmail.com");
select * from clientes;


insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(300000, 500, 1, "Notebook HP-240 g8", "c/u", "77777777-3", "azul");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(400000, 300, 1, "Notebook HP-240 g7", "c/u", "77777777-3", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(600000, 200, 1, "Notebook HP Pavilion x360 Convertible 14-dy0505la", "c/u", "77777777-3", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(900000 , 100, 1, "Notebook HP 15-dw1064la", "c/u", "77777777-3", "bicolor");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(1400000 , 50, 1, "Notebook HP Spectre x360 Convertible 14-ea0001la", "c/u", "77777777-3", "gris");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(320000, 100, 1, "Notebook HP-240 g8", "c/u", "77777777-0", "azul");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(440000, 100, 1, "Notebook HP-240 g7", "c/u", "77777777-0", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(700000, 20, 1, "Notebook HP Pavilion x360 Convertible 14-dy0505la", "c/u", "77777777-0", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(960000 , 50, 1, "Notebook HP 15-dw1064la", "c/u", "77777777-0", "bicolor");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(1300000 , 30, 1, "Notebook HP Spectre x360 Convertible 14-ea0001la", "c/u", "77777777-0", "gris");

insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(500000, 150, 2, "ASUS Vivobook 13 Slate OLED (T3300)", "c/u", "77777777-3", "azul");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(490000, 80, 2, "ASUS Vivobook 13 Slate OLED (T3300)", "c/u", "77777777-0", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(900000, 200, 2, "ASUS Zenbook 13 OLED (UX325, 11th Gen Intel)", "c/u", "77777777-3", "gris perla");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(930000 , 100, 2, "ASUS Zenbook 13 OLED (UX325, 11th Gen Intel)", "c/u", "77777777-0", "bicolor");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(4000000 , 20, 2, "ASUS Zenbook Pro Duo 15 OLED(UX582, 11 Intel)", "c/u", "77777777-3", "gris");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(3700000 , 30, 2, "ASUS Zenbook Pro Duo 15 OLED(UX582, 11 Intel)", "c/u", "77777777-0", "gris");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(120000, 40, 10, "SILLA GAMER - ROO AZUL", "c/u", "77777777-9", "azul");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(120000, 30, 10, "SILLA GAMER - ROO ROSADA", "c/u", "77777777-9", "rosada");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(280000, 40, 10, "SILLA GAMER HP OMEN GAMING-STUHL, 136KG", "c/u", "77777777-9", "azul");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(280000, 30, 10, "SILLA GAMER - ROO ROSADA", "c/u", "77777777-9", "rosada");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(180000, 40, 11, "MONITOR HP P22H G4, 21.5 FULL HD", "c/u", "77777777-4", "negro");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(160000, 250, 11, "MONITOR LED HP DE 21.5 RESOLUCIÓN 1920X1080", "c/u", "77777777-4", "negro");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(200000, 40, 11, "MONITOR 25 PULGADAS ULTRAWIDE", "c/u", "77777777-4", "negro");
insert into  productos (precio_producto, inventario_producto, idcategoria_producto, nombre_producto, unidad_producto, rutproveedor_producto, color_producto)
values(600000, 10, 11, "PANTALLA COMERCIAL LED 43 4K WIDESCREEN", "c/u", "77777777-4", "negro");
select * from productos;


insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220810, "88888888-0");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220811, "88888888-1");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220812, "88888888-2");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220813, "88888888-3");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220814, "88888888-4");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220815, "88888888-5");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220816, "88888888-6");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220817, "88888888-7");
insert into ventas (vendedor, fecha_venta, clientes_rutcliente) values ("Alice Vendora Estrella", 20220818, "88888888-8");
select * from ventas;

insert into detalle_venta value(1, 1, 1, 300000, 57000, 357000);
insert into detalle_venta value(2, 2, 1, 400000, 76000, 476000);
insert into detalle_venta value(3, 3, 1, 600000, 114000, 724000);
insert into detalle_venta value(4, 8, 1, 1300000, 247000, 1547000);
insert into detalle_venta value(5, 10, 1, 960000, 182400, 1142400);
insert into detalle_venta value(6, 7, 1, 700000, 133000, 833000);
insert into detalle_venta value(6, 23, 2, 400000, 76000, 476000);
insert into detalle_venta value(7, 11, 1, 500000, 95000, 595000);
insert into detalle_venta value(7, 21, 1, 180000, 34200, 214200);
insert into detalle_venta value(8, 5, 1, 320000, 60800, 388000);
insert into detalle_venta value(8, 17, 2, 240000, 45600, 285600);
insert into detalle_venta value(9, 4, 1, 1400000, 266000, 1666000);
insert into detalle_venta value(9, 19, 2, 560000, 106400, 666400);
insert into detalle_venta value(9, 23, 3, 600000, 114000, 724000);
select * from detalle_venta;


/********** consultas a la base de datos *********
- Cuál es la categoría de productos que más se repite.
- Cuáles son los productos con mayor stock
- Qué color de producto es más común en nuestra tienda.
- Cual o cuales son los proveedores con menor stock de productos.
- Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/


/* Cuál es la categoría de productos que más se repite.*/
/*******************************************************/
select categorias.nombre_categoria, categorias.id_categoria, count(productos.idcategoria_producto), productos.id_producto  from productos
inner join detalle_venta on (productos.id_producto = detalle_venta.idproducto_detalle)
inner join categorias on (categorias.id_categoria = productos.idcategoria_producto)
where productos.id_producto = detalle_venta.idproducto_detalle
group by productos.id_producto;


/* Cuáles son los productos con mayor stock */
/********************************************/
SELECT id_producto, max(inventario_producto) as mx_stock, SUM(precio_producto * inventario_producto) AS inventario_financiero
FROM productos
GROUP BY  id_producto
order by inventario_producto desc ;


/* Qué color de producto es más común en nuestra tienda.*/
/*******************************************************/
SELECT color_producto, count(color_producto) as cuenta   FROM productos
GROUP BY color_producto
order by cuenta desc;


/* Cual o cuales son los proveedores con menor stock de productos.*/
/****************************************************************/
SELECT proveedores.nombre_proveedor, productos.inventario_producto FROM productos
inner join proveedores
where productos.rutproveedor_producto = proveedores.rut_proveedor
GROUP BY  proveedores.nombre_proveedor
order by productos.inventario_producto asc ;


/* Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/
/*********************************************************************************/

/* esta query hace lo mismo que el siguiente, cambian el nombre de la categoria, 
pero de todas las categorías asociadas a: produtos que se han vendido 
no logro enganchar a la categoria que más productos ha vendido*/
update categorias 
inner join productos on (productos.idcategoria_producto = categorias.id_categoria)
set categorias.nombre_categoria = "Electrónica y computación"
where 
	(select max(productos.idcategoria_producto) from productos where productos.idcategoria_producto = categorias.id_categoria );

/* esta query hace lo mismo que el arriba */
update categorias, productos
set categorias.nombre_categoria = "Electrónica y computación"
where 
	(select max(productos.idcategoria_producto) from productos where productos.idcategoria_producto = categorias.id_categoria );
    
    




