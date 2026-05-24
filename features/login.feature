Feature: Login en SauceDemo

  Scenario: Iniciar sesión con credenciales válidas
    Given que estoy en la página de login de SauceDemo
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos