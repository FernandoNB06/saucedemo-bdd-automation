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

 @smoke
  Scenario: Agregar un producto al carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    Then el contador del carrito debería mostrar "1"

  Scenario: Visualizar producto agregado en el carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el carrito de compras
    Then debería ver el producto "Sauce Labs Backpack" en el carrito
    And debería ver el precio "$29.99" en el carrito

  Scenario: Agregar dos productos al carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And agrego el producto "Sauce Labs Bike Light" al carrito
    Then el contador del carrito debería mostrar "2"

  Scenario: Remover producto desde el carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el carrito de compras
    And remuevo el producto "Sauce Labs Backpack" desde el carrito
    Then no debería ver el producto "Sauce Labs Backpack" en el carrito

  Scenario: Continuar comprando desde el carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And abro el carrito de compras
    And continúo comprando
    Then debería ver la página de productos

  Scenario: Remover un producto desde la página de productos
    When agrego el producto "Sauce Labs Backpack" al carrito
    And remuevo el producto "Sauce Labs Backpack" desde la página de productos
    Then el carrito debería quedar vacío

  Scenario: Visualizar múltiples productos en el carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And agrego el producto "Sauce Labs Bike Light" al carrito
    And abro el carrito de compras
    Then debería ver el producto "Sauce Labs Backpack" en el carrito
    And debería ver el producto "Sauce Labs Bike Light" en el carrito

  Scenario: Remover uno de varios productos del carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And agrego el producto "Sauce Labs Bike Light" al carrito
    And abro el carrito de compras
    And remuevo el producto "Sauce Labs Backpack" desde el carrito
    Then no debería ver el producto "Sauce Labs Backpack" en el carrito
    And debería ver el producto "Sauce Labs Bike Light" en el carrito

  Scenario: Actualizar contador al remover un producto
    When agrego el producto "Sauce Labs Backpack" al carrito
    And agrego el producto "Sauce Labs Bike Light" al carrito
    And abro el carrito de compras
    And remuevo el producto "Sauce Labs Backpack" desde el carrito
    Then el contador del carrito debería mostrar "1"

  Scenario: Remover producto desde el inventario
    When agrego el producto "Sauce Labs Backpack" al carrito
    And remuevo el producto "Sauce Labs Backpack" desde el inventario
    Then no debería existir contador del carrito