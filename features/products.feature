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

  Scenario: Validar lista completa de productos
    Then debería ver los siguientes productos:
      | producto                            |
      | Sauce Labs Backpack                 |
      | Sauce Labs Bike Light               |
      | Sauce Labs Bolt T-Shirt             |
      | Sauce Labs Fleece Jacket            |
      | Sauce Labs Onesie                   |
      | Test.allTheThings() T-Shirt (Red)   |

  Scenario: Ordenar productos por nombre de A a Z
    When selecciono el ordenamiento "Name (A to Z)"
    Then el primer producto debería ser "Sauce Labs Backpack"

  Scenario: Ordenar productos por nombre de Z a A
    When selecciono el ordenamiento "Name (Z to A)"
    Then el primer producto debería ser "Test.allTheThings() T-Shirt (Red)"

  Scenario: Ordenar productos por precio de menor a mayor
    When selecciono el ordenamiento "Price (low to high)"
    Then el primer precio de producto debería ser "$7.99"

  Scenario: Ordenar productos por precio de mayor a menor
    When selecciono el ordenamiento "Price (high to low)"
    Then el primer precio de producto debería ser "$49.99"
   
  Scenario: Visualizar detalle de un producto
    When selecciono el producto "Sauce Labs Backpack"
    Then debería ver el detalle del producto "Sauce Labs Backpack"
    And debería ver la descripción del detalle "carry.allTheThings() with the sleek, streamlined Sly Pack"
    And debería ver el precio del detalle "$29.99"
   
  Scenario: Agregar al carrito después de ordenar por precio menor a mayor
    When selecciono el ordenamiento "Price (low to high)"
    Then el primer precio de producto debería ser "$7.99"
    When agrego el producto "Sauce Labs Onesie" al carrito
    Then el contador del carrito debería mostrar "1"
    
  Scenario: Agregar producto al carrito desde el detalle
    When selecciono el producto "Sauce Labs Backpack"
    And agrego el producto desde el detalle
    Then el contador del carrito debería mostrar "1"
    
  Scenario: Volver al listado desde el detalle del producto
    When selecciono el producto "Sauce Labs Backpack"
    And vuelvo al listado de productos
    Then debería ver la página de productos
    
  Scenario: Cambiar botón a Remove después de agregar un producto
    When agrego el producto "Sauce Labs Backpack" al carrito
    Then debería ver el botón "Remove" para el producto "Sauce Labs Backpack"
    
  Scenario: Mantener producto al navegar al detalle y regresar
    When agrego el producto "Sauce Labs Backpack" al carrito
    And selecciono el producto "Sauce Labs Backpack"
    And vuelvo al listado de productos
    Then el contador del carrito debería mostrar "1"