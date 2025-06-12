<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Página de Registro</title>
  <link rel="stylesheet" href="RegisterStyle.css" />
</head>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const checkboxes = document.querySelectorAll('input[name="intereses[]"]');
  const maxSeleccion = 5;

  checkboxes.forEach(chk => {
    chk.addEventListener('change', () => {
      const seleccionados = Array.from(checkboxes).filter(i => i.checked);
      if (seleccionados.length > maxSeleccion) {
        chk.checked = false;
        alert("Solo puedes seleccionar un máximo de 5 intereses.");
      }
    });
  });

  document.querySelector("form").addEventListener("submit", function (e) {
    const seleccionados = Array.from(checkboxes).filter(i => i.checked);
    if (seleccionados.length < 5) {
      e.preventDefault();
      alert("Debes seleccionar al menos 5 intereses.");
    }
  });
});
</script>

<body>

<div class="container">
  <div class="right-section">
    <img src="FondoReg.jpeg" alt="Ilustración 3D" />
  </div>

  <div class="left-section">
    <div class="logo">
      <img src="Logo.jpeg" alt="Logo de SkillUp">
    </div>

    <h2>Registro</h2>

    <form method="POST" action="Registro.php" name="signin-form">
      <div class="form-element">
        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre" placeholder="Ingresa tu nombre" required />
      </div>

      <div class="form-element">
        <label for="correo">Correo</label>
        <input type="text" id="correo" name="correo" placeholder="Ingresa tu correo" required />
      </div>

      <div class="form-element">
        <label for="contrasena">Contraseña</label>
        <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required />
      </div>

      <!-- Intereses -->
      <div class="form-element">
        <label>Selecciona al menos 5 intereses</label>
        <div class="checkbox-group">
          <?php
            $interesesDisponibles = [
              "Salud mental", "Tecnología", "Negocios", "Arte", "Música",
              "Idiomas", "Cocina", "Programación", "Desarrollo personal", "Finanzas",
              "Deportes", "Psicología", "Diseño", "Marketing", "Emprendimiento"
            ];

            foreach ($interesesDisponibles as $interes) {
              echo "
                <label>
                  <input type='checkbox' name='intereses[]' value='$interes'>
                  $interes
                </label><br>
              ";
            }
          ?>
        </div>
      </div>

      <button type="submit" name="login" value="login">Registro</button>
    </form>

    <div class="social-login">
      <span>o continuar con</span>
      <div class="social-icons">
        <a href="#" class="facebook">F</a>
        <a href="#" class="google">G</a>
        <a href="#" class="twitter">T</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>