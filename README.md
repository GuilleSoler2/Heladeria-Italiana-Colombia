[README.md](https://github.com/user-attachments/files/30265249/README.md)
# 🍦 Viabilidad de una heladería artesanal italiana en Colombia

**Un proyecto de analítica de datos aplicado a un caso de negocio real, combinando experiencia profesional como maestro heladero con un flujo completo de SQL, Python y Tableau.**

🔗 **[Ver el dashboard interactivo en Tableau Public](https://public.tableau.com/views/HeladeriaArtesanalItaloColombiana/Dashboard1?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

---

## El origen del proyecto

Soy pastelero y heladero profesional, operador de [Giotto](#), una heladería artesanal en Blanes (Costa Brava), y estoy en transición hacia analítica de datos. En vez de trabajar con un dataset genérico, quise construir un proyecto de portfolio que uniera ambos mundos: aplicar mi experiencia real del sector a una decisión de negocio real, y responderla con datos, no con intuición.

**La pregunta central:** ¿sería viable abrir una heladería artesanal de estilo italiano en Colombia? Y si es así, ¿dónde, con qué producto, y a qué precio?

## Las 6 preguntas de negocio

El proyecto se organizó alrededor de seis preguntas concretas:

1. ¿Qué ciudad colombiana es la más rentable para el negocio?
2. ¿Es rentable el negocio en esa ciudad?
3. ¿Qué precio de venta es el adecuado?
4. ¿Qué sabores tendrían más demanda: europeos, colombianos, o híbridos?
5. ¿Quién es el cliente objetivo?
6. ¿Existe estacionalidad relevante en la demanda?

Las respuestas completas, con evidencia, están en [`Informe_Final_Heladeria_Colombia.docx`](./Informe_Final_Heladeria_Colombia.docx).

## El proceso — y por qué importa más que el resultado

### 1. Scorecard de ciudad (Excel → SQL)
Comparé 8 ciudades candidatas en 6 criterios ponderados (consumo de helado, clima, poder adquisitivo, turismo, costo de local, competencia), usando datos reales de DANE, IDEAM y MinCIT. **Medellín ganó** con un perfil equilibrado, no por destacar en un solo factor.

### 2. Modelo financiero — y un hallazgo que cambió el proyecto
La primera versión del modelo, construida asumiendo que toda la maquinaria se importaría directamente desde España, **inflaba la inversión inicial en más de 140 millones de COP** frente a los precios reales del mercado colombiano. Contrastar el modelo contra datos de mercado (en vez de quedarme con el primer supuesto) llevó el proyecto a una inversión mucho más realista y a un precio de venta validado contra la competencia real de Medellín — incluida Amor-Acuyá, heladería premiada en el ranking mundial del Gelato Festival.

### 3. Investigación de sabores
El patrón ganador en las heladerías mejor valoradas de Medellín no es gelato italiano puro ni carta 100% tropical — es fusión deliberada entre ambos. La carta final del proyecto refleja ese hallazgo.

### 4. Migración a SQL + Python + Tableau
Todo el análisis, inicialmente hecho en Excel, se migró a una base de datos SQL (13 tablas + una vista calculada con JOINs), se exploró con Python/pandas, y se visualizó en un dashboard interactivo en Tableau Public.

## Stack técnico

| Herramienta | Uso |
|---|---|
| Excel | Modelado financiero inicial y recolección de datos |
| SQL (SQLite) | Base de datos relacional + vista calculada del scorecard |
| Python (pandas, matplotlib) | Análisis y visualización sobre los datos de SQL |
| Tableau Public | Dashboard interactivo final |

## Estructura del repositorio

```
├── README.md                                  ← estás aquí
├── Informe_Final_Heladeria_Colombia.docx       ← las 6 preguntas respondidas
├── 01_alcance_proyecto.md                      ← documento de alcance inicial
├── plantilla_recoleccion_datos.xlsx            ← scorecard de ciudad (Excel)
├── modelo_financiero.xlsx                      ← modelo financiero (Excel)
├── Fase4_Investigacion_Sabores.docx            ← investigación de sabores
├── heladeria_colombia.db                       ← base de datos SQL (SQLite)
├── 01_schema_y_datos.sql                       ← script SQL reproducible
└── notebook_analisis.ipynb                     ← análisis en Python (Google Colab)
```

## Fuentes de datos

DANE (demografía, pobreza monetaria), IDEAM (clima), MinCIT / observatorios de turismo municipales, Google Maps / Tripadvisor (competencia), Fincaraíz / Properati / Metrocuadrado (costo de locales comerciales).

---

*Proyecto de portfolio — julio 2026*
