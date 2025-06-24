# POS Base de Datos

Este repositorio contiene los archivos necesarios para levantar un contenedor MySQL con la estructura y datos simulados de un sistema de Punto de Venta (POS).

## Archivos

- `docker-compose.yml`: Levanta MySQL con configuración predefinida.
- `init/pos_limpio_completo.sql`: Estructura completa de la base de datos.
- `init/pos_datos_basicos.sql`: Provincias, ciudades, monedas, IVA, roles.
- `init/pos_datos_simulados.sql`: Datos de prueba de los últimos 3 meses.

## Instrucciones

1. Clona el repositorio y ubícate en la raíz:
   ```bash
   git clone <repo-url>
   cd <repo>
   ```

2. Crea una carpeta `init/` y copia los archivos SQL dentro.

3. Levanta el contenedor:
   ```bash
   docker-compose up -d
   ```

4. MySQL estará corriendo en `localhost:3306` con:
   - **Usuario root**: `rootpassword`
   - **Base de datos**: `pos`
   - **Usuario**: `posuser` / `pospassword`

Los archivos SQL en `init/` se ejecutarán automáticamente al iniciar el contenedor por primera vez.

