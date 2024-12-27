# JUEGAYA-Admin

## Optimización de Negocio - Sitio Web para Administración de Ventas de Juegos Digitales

## Descripción del Proyecto

Este proyecto tiene como objetivo optimizar la gestión de un negocio de venta de juegos digitales mediante la migración de un sistema basado en Excel a una aplicación web moderna y eficiente. Se implementará un panel administrativo robusto que permitirá una mejor gestión de clientes, transacciones, cuentas, y finanzas.

## Objetivos

- Migrar la base de datos de Excel a una base de datos relacional (MySQL o PostgreSQL).
- Desarrollar un panel administrativo con PHP (Laravel) y una API REST.
- Crear una interfaz de usuario interactiva y moderna con React, TailwindCSS o Bootstrap.
- Mejorar la eficiencia en la búsqueda y gestión de la información.
- Generar reportes automáticos y escalables para la toma de decisiones.

## Tecnologías Utilizadas

- **Backend:**
  - PHP con Laravel Framework
  - API RESTful
- **Frontend:**
  - React
  - TailwindCSS / Bootstrap
- **Base de Datos:**
  - MySQL / PostgreSQL
- **Servidor:**
  - Apache (XAMPP para desarrollo local)
- **Control de Versiones:**
  - Git y GitHub
- **Otros:**
  - JSP, Java (para posibles integraciones o funcionalidades específicas)

## Estructura de la Base de Datos

La base de datos ha sido diseñada para optimizar la gestión de la información, mejorando la estructura existente que se manejaba en Excel. A continuación, se detallan las tablas principales:

### Tabla de Clientes

Almacena la información de los clientes.

| Campo           | Tipo de Dato             | Descripción                                                 |
| :-------------- | :----------------------- | :---------------------------------------------------------- |
| `ID`            | `INT` (PK)               | Identificador único del cliente (Autoincremental).          |
| `NombreCompleto` | `VARCHAR(100)`            | Nombre completo del cliente.                               |
| `TipoCliente`   | `ENUM('P1', 'P2', 'S1', 'S2')` | Tipo de cliente (Principal Play 4/5, Secundaria Play 4/5). |
| `Telefono`      | `VARCHAR(15)`             | Número de teléfono del cliente.                             |
| `Pais`          | `VARCHAR(50)`             | País de residencia del cliente.                             |
| `FechaRegistro` | `DATE`                  | Fecha de registro del cliente.                             |
| `Notas`         | `TEXT`                  | Notas o comentarios adicionales sobre el cliente.           |

### Tabla de Transacciones

Registra las transacciones realizadas por los clientes.

| Campo             | Tipo de Dato             | Descripción                                                     |
| :---------------- | :----------------------- | :-------------------------------------------------------------- |
| `ID`              | `INT` (PK)               | Identificador único de la transacción (Autoincremental).       |
| `ClienteID`       | `INT` (FK)               | ID del cliente que realizó la transacción.                     |
| `Operacion`       | `ENUM('C1', 'C2', 'V1', 'V2')` | Tipo de operación (Compra/Venta Digital/Física).               |
| `CuentaID`        | `INT` (FK)               | ID de la cuenta involucrada en la transacción.                 |
| `Factura`         | `VARCHAR(50)`            | Número de factura (si aplica).                                  |
| `CodigoTransaccion` | `VARCHAR(50)`            | Código único de la transacción.                                |
| `Fecha`           | `DATE`                  | Fecha de la transacción.                                       |

### Tabla de Cuentas

Contiene información detallada de las cuentas de juegos.

| Campo            | Tipo de Dato    | Descripción                                                        |
| :--------------- | :-------------- | :----------------------------------------------------------------- |
| `ID`             | `INT` (PK)      | Identificador único de la cuenta (Autoincremental).               |
| `NombreCuenta`   | `VARCHAR(50)` | Nombre de la cuenta.                                              |
| `Detalles`       | `TEXT`         | Detalles adicionales de la cuenta.                               |
| `Juegos`         | `TEXT`         | Lista de juegos en la cuenta (puede ser un JSON o tabla separada). |
| `Disponibilidad` | `BOOLEAN`      | Indica si la cuenta está disponible.                             |
| `Cantidad`        | `INT`          | Cantidad disponible.                                              |
| `PrecioIndividual` | `DECIMAL(10, 2)` | Precio individual por juego (si aplica).                         |
| `ValorTotal`      | `DECIMAL(10, 2)` | Valor total de la cuenta.                                        |

### Tabla de Finanzas

Registra los datos financieros relacionados con las cuentas.

| Campo       | Tipo de Dato    | Descripción                                  |
| :---------- | :-------------- | :------------------------------------------- |
| `ID`        | `INT` (PK)      | Identificador único del registro (Autoincremental). |
| `CuentaID`  | `INT` (FK)      | ID de la cuenta relacionada.                |
| `Ingreso`   | `DECIMAL(10, 2)` | Ingresos generados por la cuenta.           |
| `Inversion` | `DECIMAL(10, 2)` | Inversión realizada en la cuenta.           |
| `Ganancia`  | `DECIMAL(10, 2)` | Ganancia neta de la cuenta.                 |

### Tabla de Credenciales

Almacena las credenciales de acceso a las cuentas.

| Campo         | Tipo de Dato    | Descripción                                  |
| :------------ | :-------------- | :------------------------------------------- |
| `ID`          | `INT` (PK)      | Identificador único del registro (Autoincremental). |
| `CuentaID`    | `INT` (FK)      | ID de la cuenta relacionada.                |
| `Correo`      | `VARCHAR(100)` | Correo electrónico de la cuenta.            |
| `Usuario`     | `VARCHAR(50)` | Nombre de usuario de la cuenta.              |
| `Contrasena1` | `VARCHAR(50)` | Primera contraseña de la cuenta.             |
| `Contrasena2` | `VARCHAR(50)` | Segunda contraseña de la cuenta.             |
| `Juegos`      | `TEXT`         | Lista de juegos (puede ser un JSON o tabla separada). |
| `Detalles`    | `TEXT`         | Detalles adicionales de las credenciales.     |

## Funcionalidades del Panel Administrativo

El panel administrativo permitirá realizar las siguientes operaciones:

### Gestión de Clientes

- Agregar, modificar y eliminar clientes.
- Consultar historial de transacciones por cliente.

### Gestión de Transacciones

- Visualizar todas las operaciones por cliente o cuenta.
- Filtrar transacciones por tipo de operación.

### Gestión de Cuentas

- Registrar, modificar y eliminar cuentas.
- Monitorear la disponibilidad y detalles de las cuentas.

### Reportes Financieros

- Generar resumen de ingresos, inversiones y ganancias.
- Exportar reportes a Excel o PDF.

### Seguridad

- Autenticación y autorización por roles (administrador/usuario).
- Encriptación de contraseñas.

## Proceso de Desarrollo

### Requerimientos

- Definición de casos de uso.
- Priorización de funcionalidades.
- Diseño de diagramas de Entidad-Relación (ER) y de flujo.

### Diseño

- Creación de prototipos de interfaz de usuario (Figma/Adobe XD).
- Diseño de la arquitectura del sistema.

### Implementación

- Configuración del entorno de desarrollo (XAMPP, VS Code).
- Desarrollo del backend y la API REST con PHP (Laravel).
- Desarrollo del frontend con React y TailwindCSS/Bootstrap.

### Pruebas

- Pruebas unitarias para el backend.
- Pruebas de interfaz de usuario para el frontend.
- Pruebas de integración para validar el sistema completo.

### Despliegue

- Configuración del servidor de producción (AWS, DigitalOcean, etc.).
- Implementación de HTTPS para seguridad.
- Configuración de backups automáticos de la base de datos.

## Instalación y Configuración

1. **Clonar el repositorio:**

    ```
    git clone URL_DEL_REPOSITORIO
    ```

2. **Configurar la base de datos:**
    - Importar el archivo SQL inicial a su gestor de base de datos (MySQL/PostgreSQL).
    - Actualizar las credenciales de la base de datos en el archivo de configuración de Laravel (`.env`).
3. **Instalar dependencias del backend:**

    ```
    cd backend
    composer install
    ```

4. **Instalar dependencias del frontend:**

    ```
    cd frontend
    npm install
    ```

5. **Ejecutar migraciones y seeders (si es necesario):**

    ```
    php artisan migrate
    php artisan db:seed
    ```

6. **Iniciar el servidor de desarrollo de Laravel:**

    ```
    php artisan serve
    ```

7. **Iniciar el servidor de desarrollo de React:**

    ```
    npm start
    ```

## Contribuciones

Las contribuciones son bienvenidas. Si deseas colaborar en este proyecto, por favor sigue los siguientes pasos:

1. Realiza un fork del repositorio.
2. Crea una nueva rama con la funcionalidad o corrección (`git checkout -b featureueva-funcionalidad`).
3. Realiza los cambios y commits necesarios.
4. Envía un pull request a la rama principal (`main` o `master`).

## Contacto

Para cualquier duda o sugerencia sobre el proyecto, puedes contactarme a través de mi correo electrónico:

- **Email:**  \[<gabriel.ruiz.student@gmail.com>]
- **GitHub:**  [Gabiru05](https://github.com/gabiru05)
