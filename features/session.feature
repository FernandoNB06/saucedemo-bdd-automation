Feature: Gestión de sesión en SauceDemo

  Como usuario autenticado de SauceDemo
  Quiero cerrar sesión correctamente
  Para proteger el acceso a mi cuenta después de usar la aplicación

  Background:
    Given que estoy autenticado como "standard_user"

 @smoke
  Scenario: Cerrar sesión correctamente
    When abro el menú lateral
    And selecciono la opción logout
    Then debería volver a la pantalla de login

  Scenario: Resetear estado de la aplicación
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el menú lateral
    And selecciono la opción reset app state
    Then el carrito debería quedar vacío

  Scenario: Validar opciones del menú lateral
    When abro el menú lateral
    Then debería ver las opciones principales del menú lateral

  Scenario: Agregar producto después de resetear el estado
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el menú lateral
    And selecciono la opción reset app state
    And agrego el producto "Sauce Labs Bike Light" al carrito
    Then el contador del carrito debería mostrar "1"