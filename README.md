# Proyecto


# SmartLearn: Recomendador de Cursos Basado en Intereses y Compras

## Descripción del Proyecto

SmartLearn es una plataforma web desarrollada en PHP que recomienda cursos personalizados a los usuarios, según sus intereses seleccionados al registrarse y su historial de compras. Utiliza estructuras de datos como tablas hash y grafos, junto con algoritmos como MergeSort, QuickSort y BFS para generar recomendaciones eficientes.

---

## Características

- Registro de usuarios con intereses personalizados.
- Recomendaciones por intereses usando tabla hash (acceso O(1)).
- Recomendaciones por compras usando grafos con pesos (frecuencia de compra conjunta).
- Ordenamiento de resultados por precio o fecha.
- Interfaz limpia y adaptable.
- Código modular y estructurado para ampliación futura.

---

## Requisitos

- Servidor local (Apache o XAMPP)
- PHP 7.4 o superior
- MariaDB o MySQL
- Navegador web actualizado

---

## Estructura del Proyecto

```
/Proyecto
│
├── Carrito/               # Módulo de compras y carrito
├── Error/                 # Manejo de errores
├── Grafos/                # Visualización con Graphviz
├── includes/              # Archivos comunes reutilizables
├── Java/                  # Código JS y utilidades front-end
├── LandingPage/           # Página principal del sitio
├── Login/                 # Inicio de sesión
├── ProductoManager/       # Control y visualización de cursos
├── Reco/                  # Recomendación por compras (grafo)
├── RecoInt/               # Recomendación por intereses (tabla hash)
├── Register/              # Registro de nuevos usuarios
├── UsuarioManager/        # Edición de perfil y datos
├── vendor/                # Librerías externas
├── index.php              # Entrada principal del sistema
└── README.md              # Documentación del proyecto
```

---

## ¿Cómo utilizarlo?

1. Clona este repositorio en tu servidor local o carpeta de tu servidor Apache:

   ```bash
   git clone https://github.com/tuusuario/Proyecto.git
   ```

2. Importa la base de datos:

   - Abre la terminal.
   - Entra al directorio donde está el respaldo:

     ```bash
     cd Proyecto/base_datos
     ```

   - Restaura la base de datos ejecutando:

     ```bash
     mysql -u root -p proyecto < backup_smartlearn.sql
     ```

   - Si la base de datos no existe aún, primero créala así:

     ```bash
     mysql -u root -p -e "CREATE DATABASE proyecto"
     mysql -u root -p proyecto < backup_smartlearn.sql
     ```

3. Configura la conexión a la base de datos en el archivo:

   
   includes/conexion.php
   

   Asegúrate de que el usuario, contraseña y nombre de la base de datos coincidan.

   - Nota: Algunas carpetas del proyecto (como Reco, RecoInt, etc.) también contienen sus propios archivos que incluyen la conexión a la base de datos. Asegúrate de revisar y actualizar las credenciales de conexión en cada uno de esos archivos si es necesario.

4. Inicia el servidor local (XAMPP, MAMP o Apache), y abre en tu navegador:


   http://localhost/Proyecto/LandingPage/LandingPage.php
   

5. Regístrate como nuevo usuario, selecciona al menos 5 intereses y comienza a recibir recomendaciones personalizadas.

6. Desde el panel podrás:
   - Ver recomendaciones por intereses.
   - Realizar compras y ver recomendaciones basadas en comportamiento.
   - Cambiar el orden de visualización (precio o fecha).

7. Acceso como administrador:
   - Correo: admin@gmail.com
   - Contraseña: Aris
   - Permite registrar cursos desde el panel de administración.

---

## Autor

Claudio Aristóteles Rojas González  
Proyecto Final — Estructura de Datos  
CETI | Junio 2025