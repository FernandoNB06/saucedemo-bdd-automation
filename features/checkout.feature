Feature: Checkout en SauceDemo

  Como usuario autenticado de SauceDemo
  Quiero completar el proceso de compra
  Para validar que el flujo principal de compra funcione correctamente

  Background:
    Given que estoy en la página de login de SauceDemo
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el carrito de compras

  Scenario: Completar checkout básico con un producto
    When inicio el checkout
    And ingreso los datos del comprador "Fernando" "Nogales" "0000"
    And continúo al resumen de compra
    Then debería ver el producto "Sauce Labs Backpack" en el resumen
    And debería ver el precio "$29.99" en el resumen
    When finalizo la compra
    Then debería ver el mensaje de confirmación "Thank you for your order!"