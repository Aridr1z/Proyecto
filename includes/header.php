<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>SkillUp</title>
  <link rel="stylesheet" href="/Proyecto/includes/header.css">
</head>
<body>

<header>
  <div class="logo">
    <img src="/Proyecto/includes/Logo.jpeg" alt="Logo de SkillUp">
    <h1>SkillUp</h1>
  </div>

  <nav>
  <ul>
    <?php
    /* 1. SIN sesión --------------------------------------------------- */
    if (!isset($_SESSION['rol'])): ?>
        <li><a href="/Proyecto/ProductoManager/User/ProductosUsuarios.php">Explorar</a></li>
        <li><a href="/Proyecto/Carrito/Carrito.php">Carrito</a></li>
        <li><a href="/Proyecto/LandingPage/LandingPage.php">Inicio</a></li>

        <li><a href="/Proyecto/Login/Login.html">Iniciar Sesión</a></li>
        <li><a href="/Proyecto/Register/Register.php">Registrarse</a></li>

    <?php
    /* 2. CLIENTE ------------------------------------------------------ */
    elseif ($_SESSION['rol'] === 'cliente'): ?>
        <li><a href="/Proyecto/ProductoManager/User/ProductosUsuarios.php">Explorar</a></li>
        <li><a href="/Proyecto/Carrito/Carrito.php">Carrito</a></li>
        <li><a href="/Proyecto/LandingPage/LandingPage.php">Inicio</a></li>

        <li><a href="/Proyecto/UsuarioManager/EditarUser.php">Bienvenido, <?= htmlspecialchars($_SESSION['user']) ?></a></li>
        <li><a href="/Proyecto/Login/logout.php">Cerrar sesión</a></li>

    <?php
    /* 3. ADMIN -------------------------------------------------------- */
    else:  // rol === 'admin' ?>
        <li><a href="/Proyecto/LandingPage/LandingPage.php">Inicio</a></li>

        <!-- Opciones exclusivas de admin -->
        <li><a href="/Proyecto/ProductoManager/Admin/bitacora.php">Bitácora</a></li>
        <li><a href="/Proyecto/ProductoManager/Admin/ProductosAdmin.php">Productos</a></li>
        <li><a href="/Proyecto/ProductoManager/Admin/RegistroProducto.php">Registrar</a></li>
        <li><a href="/Proyecto/UsuarioManager/UsuarioManager.php">Usuarios</a></li>
        <li><a href="/Proyecto/Grafos/VisualizarCompras.php">Grafo Compras</a></li>
        <li><a href="/Proyecto/Grafos/VisualizarIntereses.php">Grafo Intereses</a></li>



        <li><a href="#">Bienvenido, <?= htmlspecialchars($_SESSION['user']) ?></a></li>
        <li><a href="/Proyecto/Login/logout.php">Cerrar sesión</a></li>
    <?php endif; ?>
  </ul>
</nav>
</header>