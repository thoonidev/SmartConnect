# SmartConnect

Proyecto de diseño e implementación de una base de datos para una tienda de celulares. Incluye diagramas normalizados, scripts SQL y ejercicios de consulta y manipulación de datos.

## Contenido

- Modelo de clientes, empleados, cargos, proveedores y teléfonos de proveedores.
- Productos relacionados con marcas de celulares y proveedores.
- Registro de compras y detalle de productos, cantidades y precios.
- Claves primarias y relaciones entre las tablas.
- Datos de ejemplo, consultas, actualizaciones y eliminaciones.
- Procedimientos almacenados para insertar clientes y productos.

## Herramientas

**SQL Server y T-SQL** para la base de datos, **SQL Server Management Studio (SSMS)** para ejecutar los scripts y **yEd** para abrir los diagramas `.graphml`.

## Estructura

| Archivo o carpeta | Contenido |
| --- | --- |
| `SQL/BD_SMARTCONNECT_01_SQLQuery1.sql` | Script de creación de la base y sus tablas. |
| `SQL/BD_SMARTCONNECT_02_SQLQuery1.sql` | Creación, datos de ejemplo, consultas y procedimientos. |
| `SQL/VENTAS2017(7).sql` | Script adicional para una base independiente llamada `VENTAS2017`. |
| `DER_NORMALIZADO.graphml` | Diagrama entidad-relación normalizado. |
| `DIAGRAMA_LOGICO_NORMALIZADO.graphml` | Diagrama lógico normalizado. |
| `Capturas/Diagrama_fisico.JPG` | Imagen del diagrama físico. |
| `Apuntes/` | Notas de tablas, relaciones y normalización. |

## Cómo utilizarlo

```bash
git clone https://github.com/thoonidev/SmartConnect.git
cd SmartConnect
```

1. Conéctate a una instancia de SQL Server desde SSMS con permisos para crear bases de datos.
2. Abre uno de los scripts `BD_SMARTCONNECT_01_SQLQuery1.sql` o `BD_SMARTCONNECT_02_SQLQuery1.sql`. Ambos crean `BD_SMARTCONNECT`; son alternativas y no deben ejecutarse como migraciones consecutivas.
3. Revisa y ejecuta las secciones necesarias. **Ambos scripts eliminan la base `BD_SMARTCONNECT` si ya existe**; el segundo también contiene ejercicios que actualizan y eliminan registros.
4. Para crear los procedimientos del segundo script, ejecuta cada bloque `CREATE PROCEDURE` por separado o delimítalo con `GO`, separándolo de las llamadas `EXEC` de prueba.
5. Abre los archivos `.graphml` en yEd para explorar los modelos y compáralos con la captura del diagrama físico.

El script `VENTAS2017(7).sql` se utiliza por separado y también elimina su base de datos homónima antes de crearla.

## Alcance

El repositorio contiene modelos y scripts de base de datos. No incluye una interfaz de usuario ni un servidor de aplicación.
