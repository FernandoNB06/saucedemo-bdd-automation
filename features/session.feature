Feature: Gestión de sesión en SauceDemo

  Como usuario autenticado de SauceDemo
  Quiero cerrar sesión correctamente
  Para proteger el acceso a mi cuenta después de usar la aplicación

  Background:
    Given que estoy en la página de login de SauceDemo
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos

  Scenario: Cerrar sesión correctamente
    When abro el menú lateral
    And selecciono la opción logout
    Then debería volver a la pantalla de login