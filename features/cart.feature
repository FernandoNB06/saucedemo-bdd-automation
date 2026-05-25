Feature: Carrito de compras en SauceDemo

  Como usuario autenticado de SauceDemo
  Quiero agregar productos al carrito
  Para iniciar el flujo de compra

  Background:
    Given que estoy en la página de login de SauceDemo
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos

  Scenario: Agregar un producto al carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    Then el contador del carrito debería mostrar "1"

  Scenario: Visualizar producto agregado en el carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el carrito de compras
    Then debería ver el producto "Sauce Labs Backpack" en el carrito
    And debería ver el precio "$29.99" en el carrito