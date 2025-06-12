<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>SkillUp - Landing Page</title>

  <!-- Estilo propio de la landing -->
  <link rel="stylesheet" href="LandingStyle.css">

  <!-- Estilos del header -->
</head>
<body>

<!-- ✅ Aquí insertamos automáticamente el header global -->
<?php include($_SERVER['DOCUMENT_ROOT']."/Proyecto/includes/header.php"); ?>


<section class="hero">
  <img src="Imagenes/Fondo.jpeg" alt="Imagen de fondo">
  <div class="hero-text">
    <h2>Cada amanecer es una nueva oportunidad para alcanzar tus sueños. ¡Sigue adelante!</h2>
  </div>
</section>

<?php


if (isset($_SESSION['correo']) && $_SESSION['rol'] === 'cliente') {
  include $_SERVER['DOCUMENT_ROOT']."/Proyecto/Reco/RelacionesCursos.php";
  include $_SERVER['DOCUMENT_ROOT']."/Proyecto/RecoInt/RelacionesIntereses.php";
} else {
  echo "<p style='text-align:center; margin: 2rem;'>Inicia sesión como cliente para ver recomendaciones.</p>";
}
?>


<!-- sección de “Nosotros” -->
<section class="nosotros">
  <h2>¿Quiénes Somos?</h2>
  <div class="nosotros-content">
    <div class="nosotros-image">
      <img src="Imagenes/Nosotros.png" alt="Equipo SkillUp" />
    </div>

    <div class="nosotros-text">
      <p>
        En SkillUp somos una comunidad apasionada por el crecimiento personal.
        Nuestra misión es ofrecer cursos prácticos y motivacionales
        impartidos por expertos, para que descubras tu potencial, desarrolles
        nuevas habilidades y te inspires a transformar tu vida día a día.
      </p>
    </div>

    
  </div>  <!-- ─── aquí cerramos .nosotros-content ─── -->

</section>  <!-- ─── y aquí cerramos la sección ─── -->

<section class="mision">
  <h2>MISIÓN</h2>
  <div class="mision-content">
    <div class="mision-text">
      <p>
        Inspirar y empoderar a cada persona para alcanzar su máximo potencial, proporcionándoles
        herramientas prácticas y conocimientos sólidos a través de cursos motivacionales que fomenten
        el autodescubrimiento, la confianza en sí mismos y el crecimiento continuo.
      </p>
    </div>
    <div class="mision-image">
      <img src="Imagenes/Mision.jpeg" alt="Imagen de Misión">
    </div>
  </div>
</section>

<section class="vision">
  <h2>VISIÓN</h2>
  <div class="vision-content">
    <div class="vision-image">
      <img src="Imagenes/Vision.jpeg" alt="Imagen de Visión">
    </div>
    <div class="vision-text">
      <p>
        Convertirnos en la plataforma líder en formación motivacional de habla hispana,
        reconocida por impactar positivamente la vida de millones de personas, creando
        una comunidad global de aprendizaje y transformación que promueva el bienestar,
        la resiliencia y el éxito a largo plazo.
      </p>
    </div>
  </div>
</section>

<section class="ubicacion">
  <h2>NOS UBICAMOS</h2>
  <div class="ubicacion-content">
    <div class="ubicacion-text">
      <p>
        Calle de la Amistad 276, Colonia Mirador,<br>
        Zapopan, Jalisco, C.P. 45123, México.
      </p>
    </div>
    <div class="ubicacion-image">
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d26973.898294954222!2d-103.39852178565785!3d20.688180664506017!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sgoogle%20maps!5e0!3m2!1ses-419!2smx!4v1747276244361!5m2!1ses-419!2smx"
        frameborder="0"
        allowfullscreen=""
        loading="lazy"
      ></iframe>
    </div>
  </div>
</section>

<footer>
  <div class="footer-container">

    <div class="footer-column footer-social">
      <a href="#" aria-label="YouTube">
        <img src="Imagenes/youtube-icon.jpg" alt="YouTube">
      </a>
      <a href="#" aria-label="Instagram">
        <img src="Imagenes/instagram-icon.jpg" alt="Instagram">
      </a>
      <a href="#" aria-label="Twitter">
        <img src="Imagenes/twitter-icon.jpg" alt="Twitter">
      </a>
      <a href="#" aria-label="Facebook">
        <img src="Imagenes/facebook-icon.jpg" alt="Facebook">
      </a>
    </div>

    <div class="footer-column">
      <h3>Use cases</h3>
      <ul>
        <li><a href="#">UI design</a></li>
        <li><a href="#">UX design</a></li>
        <li><a href="#">Wireframing</a></li>
        <li><a href="#">Brainstorming</a></li>
        <li><a href="#">Online whiteboard</a></li>
        <li><a href="#">Team collaboration</a></li>
      </ul>
    </div>

    <div class="footer-column">
      <h3>Explore</h3>
      <ul>
        <li><a href="#">Design</a></li>
        <li><a href="#">Prototyping</a></li>
        <li><a href="#">Development features</a></li>
        <li><a href="#">Design systems</a></li>
        <li><a href="#">Collaboration features</a></li>
        <li><a href="#">Design process</a></li>
        <li><a href="#">FigJam</a></li>
      </ul>
    </div>

    <div class="footer-column">
      <h3>Resources</h3>
      <ul>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Best practices</a></li>
        <li><a href="#">Colors</a></li>
        <li><a href="#">Color wheel</a></li>
        <li><a href="#">Support</a></li>
        <li><a href="#">Developers</a></li>
        <li><a href="#">Resource library</a></li>
      </ul>
    </div>

  </div>
</footer>

</body>
</html>