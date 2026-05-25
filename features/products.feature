Feature: Productos en SauceDemo

  Como usuario autenticado de SauceDemo
  Quiero visualizar los productos disponibles
  Para verificar que la página de inventario cargue correctamente

  Background:
    Given que estoy en la página de login de SauceDemo
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login

  Scenario: Validar información principal de un producto
    Then debería ver la página de productos
    And debería ver el producto "Sauce Labs Backpack"
    And debería ver la descripción "carry.allTheThings() with the sleek, streamlined Sly Pack"
    And debería ver el precio "$29.99"
    And debería ver el botón para agregar "Sauce Labs Backpack" al carrito