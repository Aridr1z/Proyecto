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

1. Clona el repositorio en tu servidor local.
2. Configura la base de datos en `conexion.php`.
3. Abre `index.php` desde tu navegador.
4. Regístrate como usuario y selecciona tus intereses.
5. Comienza a recibir recomendaciones personalizadas.

---

## Autor

Claudio Aristóteles Rojas González  
Proyecto Final — Estructura de Datos  
CETI | Junio 2025