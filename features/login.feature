Feature: Login en SauceDemo

  Como usuario de SauceDemo
  Quiero iniciar sesión con diferentes tipos de credenciales
  Para validar el acceso correcto y el control de errores del sistema

  Background:
    Given que estoy en la página de login de SauceDemo

  
  Scenario: Iniciar sesión con credenciales válidas
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos

  Scenario Outline: Intentar iniciar sesión con credenciales no válidas
    When ingreso el usuario "<usuario>"
    And ingreso la contraseña "<password>"
    And hago clic en el botón de login
    Then debería ver el mensaje "<mensaje>"

    Examples:
      | usuario             | password     | mensaje                                                                     |
      | locked_out_user     | secret_sauce | Epic sadface: Sorry, this user has been locked out.                         |
      | usuario_inexistente | secret_sauce | Epic sadface: Username and password do not match any user in this service   |
      |                     | secret_sauce | Epic sadface: Username is required                                          |
      | standard_user       |              | Epic sadface: Password is required                                          |