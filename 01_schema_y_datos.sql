BEGIN TRANSACTION;
CREATE TABLE capex (
    concepto TEXT PRIMARY KEY,
    costo_cop REAL,
    nota TEXT
);
INSERT INTO "capex" VALUES('Mantecadora profesional (batch freezer)',28000000.0,'Vía distribuidor regional (Coldelite/similares), no importación directa desde España');
INSERT INTO "capex" VALUES('Abatidor de temperatura',7851000.0,NULL);
INSERT INTO "capex" VALUES('Vitrina expositora (pozzetti)',22000000.0,'Vía distribuidor regional');
INSERT INTO "capex" VALUES('Pasteurizadora',13000000.0,'Vía distribuidor regional');
INSERT INTO "capex" VALUES('Cámara de conservación / congelador',14000000.0,'Fabricación local en Colombia');
INSERT INTO "capex" VALUES('Acondicionamiento de local (obra + mobiliario)',130000000.0,'65 m² x ~2.000.000 COP/m²');
INSERT INTO "capex" VALUES('Licencias y trámites de apertura en Colombia',3000000.0,NULL);
INSERT INTO "capex" VALUES('Capital de trabajo inicial (imprevistos, 1er mes)',15500000.0,'1 mes de OPEX total');
CREATE TABLE ciudades (
    ciudad_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);
INSERT INTO "ciudades" VALUES(1,'Bogotá');
INSERT INTO "ciudades" VALUES(2,'Medellín');
INSERT INTO "ciudades" VALUES(3,'Cali');
INSERT INTO "ciudades" VALUES(4,'Barranquilla');
INSERT INTO "ciudades" VALUES(5,'Cartagena');
INSERT INTO "ciudades" VALUES(6,'Bucaramanga');
INSERT INTO "ciudades" VALUES(7,'Pereira');
INSERT INTO "ciudades" VALUES(8,'Santa Marta');
CREATE TABLE clima (
    ciudad_id INTEGER PRIMARY KEY,
    temp_media_anual_c REAL,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "clima" VALUES(1,13.1,1.0,'IDEAM (via bogota.gov.co)');
INSERT INTO "clima" VALUES(2,22.0,4.5,'Weather Spark (rango 16-26°C)');
INSERT INTO "clima" VALUES(3,24.0,4.0,'Clasificación climática MinVivienda (cálido seco)');
INSERT INTO "clima" VALUES(4,28.0,3.5,'clima.com / clasificación cálido húmedo');
INSERT INTO "clima" VALUES(5,27.5,3.5,'clima.com / clasificación cálido húmedo');
INSERT INTO "clima" VALUES(6,23.0,4.5,'clima.com / clasificación cálido seco');
INSERT INTO "clima" VALUES(7,21.0,4.5,'Clasificación climática MinVivienda (templado)');
INSERT INTO "clima" VALUES(8,28.0,3.5,'clima.com / clasificación cálido húmedo');
CREATE TABLE competencia (
    ciudad_id INTEGER PRIMARY KEY,
    num_heladerias_artesanales INTEGER,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "competencia" VALUES(1,25,1.0,'tripadvisor.es');
INSERT INTO "competencia" VALUES(2,6,4.454545455,NULL);
INSERT INTO "competencia" VALUES(3,11,3.545454545,'tripadvisor.es');
INSERT INTO "competencia" VALUES(4,3,5.0,'tripadvisor.es');
INSERT INTO "competencia" VALUES(5,10,3.727272727,'tripadvisor.co');
INSERT INTO "competencia" VALUES(6,5,4.636363636,'tripadvisor.es');
INSERT INTO "competencia" VALUES(7,3,5.0,'tripadvisor.es');
INSERT INTO "competencia" VALUES(8,7,4.272727273,'tripadvisor.es');
CREATE TABLE consumo_helado (
    ciudad_id INTEGER PRIMARY KEY,
    proxy_puntos_venta REAL,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "consumo_helado" VALUES(1,40000.0,5.0,'portafolio.co');
INSERT INTO "consumo_helado" VALUES(2,34000.0,2.6,'bibliotecadigital.udea.edu.co');
INSERT INTO "consumo_helado" VALUES(3,31000.0,1.4,'msd-salud-animal.com.co');
INSERT INTO "consumo_helado" VALUES(4,34000.0,2.6,'editorial.goula.lat');
INSERT INTO "consumo_helado" VALUES(5,31000.0,1.4,'msd-salud-animal.com.co');
INSERT INTO "consumo_helado" VALUES(6,30000.0,1.0,'estimado, sin fuente específica por ciudad');
INSERT INTO "consumo_helado" VALUES(7,35000.0,3.0,'msd-salud-animal.com.co');
INSERT INTO "consumo_helado" VALUES(8,30000.0,1.0,'infobae.com');
CREATE TABLE costo_local (
    ciudad_id INTEGER PRIMARY KEY,
    precio_arriendo_cop_m2 REAL,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "costo_local" VALUES(1,100000.0,3.909090909,'fincaraiz.com.co');
INSERT INTO "costo_local" VALUES(2,110000.0,3.545454545,'properati.com.co');
INSERT INTO "costo_local" VALUES(3,75000.0,4.818181818,'fincaraiz.com.co');
INSERT INTO "costo_local" VALUES(4,70000.0,5.0,'properati.com.co');
INSERT INTO "costo_local" VALUES(5,180000.0,1.0,'properati.com.co');
INSERT INTO "costo_local" VALUES(6,94000.0,4.127272727,'fincaraiz.com.co');
INSERT INTO "costo_local" VALUES(7,115000.0,3.363636364,'metrocuadrado.com');
INSERT INTO "costo_local" VALUES(8,90000.0,4.272727273,'properati.com.co');
CREATE TABLE costo_materia_prima (
    parametro TEXT PRIMARY KEY,
    valor REAL,
    unidad TEXT
);
INSERT INTO "costo_materia_prima" VALUES('coste_giotto_espana',4.0,'EUR/litro');
INSERT INTO "costo_materia_prima" VALUES('tipo_cambio_eur_cop',3700.0,'COP/EUR');
INSERT INTO "costo_materia_prima" VALUES('coste_base_cop_litro',14800.0,'COP/litro');
INSERT INTO "costo_materia_prima" VALUES('ajuste_sabores_locales_pct',-15.0,'%');
INSERT INTO "costo_materia_prima" VALUES('ajuste_sabores_premium_pct',30.0,'%');
INSERT INTO "costo_materia_prima" VALUES('coste_sabores_locales_cop_litro',12580.0,'COP/litro');
INSERT INTO "costo_materia_prima" VALUES('coste_sabores_premium_cop_litro',19240.0,'COP/litro');
INSERT INTO "costo_materia_prima" VALUES('mix_ventas_locales_pct',60.0,'%');
INSERT INTO "costo_materia_prima" VALUES('mix_ventas_premium_pct',40.0,'%');
INSERT INTO "costo_materia_prima" VALUES('coste_ponderado_promedio_cop_litro',15244.0,'COP/litro');
CREATE TABLE opex_mensual (
    concepto TEXT PRIMARY KEY,
    costo_mensual_cop REAL,
    nota TEXT
);
INSERT INTO "opex_mensual" VALUES('Alquiler del local (Medellín)',4000000.0,NULL);
INSERT INTO "opex_mensual" VALUES('Personal (nº empleados x salario + prestaciones)',6000000.0,NULL);
INSERT INTO "opex_mensual" VALUES('Servicios (agua, luz, gas)',3000000.0,NULL);
INSERT INTO "opex_mensual" VALUES('Marketing y redes sociales',0.0,NULL);
INSERT INTO "opex_mensual" VALUES('Insumos no alimentarios (vasos, cucharitas, servilletas)',2000000.0,NULL);
INSERT INTO "opex_mensual" VALUES('Otros gastos fijos (seguros, contabilidad, software)',500000.0,NULL);
CREATE TABLE pesos_scorecard (
    criterio TEXT PRIMARY KEY,
    peso REAL
);
INSERT INTO "pesos_scorecard" VALUES('consumo_helado',0.3);
INSERT INTO "pesos_scorecard" VALUES('clima',0.2);
INSERT INTO "pesos_scorecard" VALUES('poder_adquisitivo',0.2);
INSERT INTO "pesos_scorecard" VALUES('turismo',0.15);
INSERT INTO "pesos_scorecard" VALUES('costo_local',0.1);
INSERT INTO "pesos_scorecard" VALUES('competencia',0.05);
CREATE TABLE poder_adquisitivo (
    ciudad_id INTEGER PRIMARY KEY,
    pct_pobreza_monetaria_2025 REAL,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "poder_adquisitivo" VALUES(1,17.8,4.754189944,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(2,16.7,5.0,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(3,19.7,4.329608939,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(4,23.4,3.502793296,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(5,34.6,1.0,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(6,28.4,2.38547486,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(7,21.2,3.994413408,'DANE, Boletín Pobreza Monetaria 2025');
INSERT INTO "poder_adquisitivo" VALUES(8,28.6,2.340782123,'DANE, Boletín Pobreza Monetaria 2025');
CREATE TABLE pricing_punto_equilibrio (
    parametro TEXT PRIMARY KEY,
    valor REAL,
    unidad TEXT
);
INSERT INTO "pricing_punto_equilibrio" VALUES('litros_por_bola',0.08,'litros');
INSERT INTO "pricing_punto_equilibrio" VALUES('coste_materia_prima_por_bola',1219.52,'COP');
INSERT INTO "pricing_punto_equilibrio" VALUES('pvp_por_bola',9000.0,'COP');
INSERT INTO "pricing_punto_equilibrio" VALUES('margen_bruto_por_bola',7780.48,'COP');
INSERT INTO "pricing_punto_equilibrio" VALUES('food_cost_pct',13.55,'%');
INSERT INTO "pricing_punto_equilibrio" VALUES('costos_fijos_mensuales',15500000.0,'COP');
INSERT INTO "pricing_punto_equilibrio" VALUES('punto_equilibrio_bolas_mes',1992.17,'bolas');
INSERT INTO "pricing_punto_equilibrio" VALUES('punto_equilibrio_bolas_dia',66.41,'bolas');
CREATE TABLE sabores (
    sabor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria TEXT NOT NULL,
    sabor TEXT NOT NULL,
    pct_carta REAL
);
INSERT INTO "sabores" VALUES(1,'Clásicos italianos','Pistacho',35.0);
INSERT INTO "sabores" VALUES(2,'Clásicos italianos','Avellana (Gianduja)',35.0);
INSERT INTO "sabores" VALUES(3,'Clásicos italianos','Stracciatella',35.0);
INSERT INTO "sabores" VALUES(4,'Clásicos italianos','Fior di Latte',35.0);
INSERT INTO "sabores" VALUES(5,'Clásicos italianos','Chocolate fondente',35.0);
INSERT INTO "sabores" VALUES(6,'Fusión italo-colombiana','Maracuyá con chocolate amargo',40.0);
INSERT INTO "sabores" VALUES(7,'Fusión italo-colombiana','Mango biche con albahaca',40.0);
INSERT INTO "sabores" VALUES(8,'Fusión italo-colombiana','Guanábana',40.0);
INSERT INTO "sabores" VALUES(9,'Fusión italo-colombiana','Lulo con menta',40.0);
INSERT INTO "sabores" VALUES(10,'Frutales colombianos puros','Mora',25.0);
INSERT INTO "sabores" VALUES(11,'Frutales colombianos puros','Coco',25.0);
INSERT INTO "sabores" VALUES(12,'Frutales colombianos puros','Chontaduro',25.0);
CREATE TABLE turismo (
    ciudad_id INTEGER PRIMARY KEY,
    turistas_extranjeros_anio INTEGER,
    puntuacion REAL,
    fuente TEXT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
);
INSERT INTO "turismo" VALUES(1,1975000,2.412844037,'observatorio.idt.gov.co - Investigación viajeros en Bogotá 2025');
INSERT INTO "turismo" VALUES(2,1200000,1.844036697,'turismomde.gov.co');
INSERT INTO "turismo" VALUES(3,300000,1.183486239,'SITUR Valle del Cauca - Cali Tourism Observatory 2026');
INSERT INTO "turismo" VALUES(4,1600000,2.137614679,'Instagram (fuente secundaria, verificar)');
INSERT INTO "turismo" VALUES(5,5500000,5.0,'cartagena.gov.co - Corpoturismo balance 2025');
INSERT INTO "turismo" VALUES(6,400000,1.256880734,NULL);
INSERT INTO "turismo" VALUES(7,50000,1.0,NULL);
INSERT INTO "turismo" VALUES(8,72000,1.016146789,NULL);
CREATE VIEW v_scorecard AS
SELECT
    c.nombre AS ciudad,
    ROUND(ch.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='consumo_helado'), 3) AS pts_consumo_helado,
    ROUND(cl.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='clima'), 3) AS pts_clima,
    ROUND(pa.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='poder_adquisitivo'), 3) AS pts_poder_adq,
    ROUND(tu.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='turismo'), 3) AS pts_turismo,
    ROUND(co.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='costo_local'), 3) AS pts_costo_local,
    ROUND(cm.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='competencia'), 3) AS pts_competencia,
    ROUND(
        ch.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='consumo_helado') +
        cl.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='clima') +
        pa.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='poder_adquisitivo') +
        tu.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='turismo') +
        co.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='costo_local') +
        cm.puntuacion * (SELECT peso FROM pesos_scorecard WHERE criterio='competencia')
    , 3) AS score_total
FROM ciudades c
JOIN consumo_helado ch ON ch.ciudad_id = c.ciudad_id
JOIN clima cl ON cl.ciudad_id = c.ciudad_id
JOIN poder_adquisitivo pa ON pa.ciudad_id = c.ciudad_id
JOIN turismo tu ON tu.ciudad_id = c.ciudad_id
JOIN costo_local co ON co.ciudad_id = c.ciudad_id
JOIN competencia cm ON cm.ciudad_id = c.ciudad_id
ORDER BY score_total DESC;
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('sabores',12);
COMMIT;
