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


  Scenario: Validar consistencia de totales en checkout
    When inicio el checkout
    And ingreso los datos del comprador "Fernando" "Nogales" "0000"
    And continúo al resumen de compra
    Then el resumen debería mostrar subtotal, tax y total consistentes

  Scenario: Validar nombre obligatorio en checkout
    When inicio el checkout
    And ingreso los datos del comprador "" "Nogales" "0000"
    And continúo al resumen de compra
    Then debería ver el error de checkout "Error: First Name is required"

  Scenario: Validar apellido obligatorio en checkout
    When inicio el checkout
    And ingreso los datos del comprador "Fernando" "" "0000"
    And continúo al resumen de compra
    Then debería ver el error de checkout "Error: Last Name is required"

  Scenario: Validar código postal obligatorio en checkout
    When inicio el checkout
    And ingreso los datos del comprador "Fernando" "Nogales" ""
    And continúo al resumen de compra
    Then debería ver el error de checkout "Error: Postal Code is required"

  Scenario: Cancelar checkout desde la pantalla de información
    When inicio el checkout
    And cancelo el checkout desde información
    Then debería volver al carrito de compras

  Scenario: Cancelar checkout desde el resumen de compra
    When inicio el checkout
    And ingreso los datos del comprador "Fernando" "Nogales" "0000"
    And continúo al resumen de compra
    And cancelo el checkout desde resumen
    Then debería ver la página de productos