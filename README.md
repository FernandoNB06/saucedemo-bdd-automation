# SauceDemo BDD Automation

Proyecto de automatización de pruebas funcionales tipo **Smoke Test** para la aplicación **SauceDemo**, utilizando el enfoque **BDD** con **Cucumber, Ruby, Capybara y Selenium WebDriver**.

## AUT

La aplicación bajo prueba es:

https://www.saucedemo.com/

SauceDemo es una aplicación web de ejemplo que simula un flujo de compra en línea. Permite validar funcionalidades como inicio de sesión, visualización de productos, carrito de compras y checkout.

## Objetivo del proyecto

El objetivo del proyecto es construir un framework automatizado que permita ejecutar pruebas Smoke Test sobre el flujo principal de SauceDemo, validando que las funcionalidades críticas de la aplicación estén disponibles y funcionen correctamente.

## Tecnologías utilizadas

- Ruby
- Cucumber
- Gherkin
- Capybara
- Selenium WebDriver
- RSpec
- ChromeDriver
- Git y GitHub
- Trello para la gestión del sprint

## Enfoque BDD

El proyecto utiliza BDD porque permite escribir escenarios en lenguaje natural mediante Gherkin, facilitando la comunicación entre perfiles técnicos y no técnicos.

Ejemplo de estructura utilizada:

    Feature: Login en SauceDemo

      Background:
        Given que estoy en la página de login de SauceDemo

      Scenario: Iniciar sesión con credenciales válidas
        When ingreso el usuario "standard_user"
        And ingreso la contraseña "secret_sauce"
        And hago clic en el botón de login
        Then debería ver la página de productos

## Criterios de selección del Smoke Test

Los escenarios automatizados fueron seleccionados tomando en cuenta el flujo mínimo crítico de la aplicación.

Los criterios utilizados fueron:

1. La funcionalidad debe pertenecer al flujo principal de compra.
2. La falla de la funcionalidad debe impedir o afectar el uso básico de la aplicación.
3. El escenario debe validar comportamiento visible desde el punto de vista del usuario.
4. El escenario debe ser repetible y automatizable.
5. El conjunto de pruebas debe permitir confirmar rápidamente si la aplicación está estable para pruebas más profundas.

Con base en estos criterios, se seleccionaron los siguientes módulos:

- Login
- Productos
- Carrito de compras
- Checkout

## Escenarios automatizados

### Login

Archivo:

    features/login.feature

Cubre:

- Inicio de sesión con credenciales válidas.
- Inicio de sesión con usuario bloqueado.
- Inicio de sesión con usuario inexistente.
- Uso de Background para evitar repetir el paso de navegación.
- Uso de Scenario Outline para validar credenciales no válidas mediante una tabla de Examples.

### Productos

Archivo:

    features/products.feature

Cubre:

- Validación de la página Products.
- Validación del producto Sauce Labs Backpack.
- Validación de nombre, descripción, precio y botón Add to cart.

### Carrito

Archivo:

    features/cart.feature

Cubre:

- Agregar un producto al carrito.
- Validar el contador del carrito.
- Abrir el carrito de compras.
- Verificar que el producto agregado aparezca en el carrito.
- Verificar que el precio del producto aparezca en el carrito.

### Checkout

Archivo:

    features/checkout.feature

Cubre:

- Inicio del checkout.
- Ingreso de datos del comprador.
- Continuación al resumen de compra.
- Validación de producto y precio en el resumen.
- Finalización de compra.
- Validación del mensaje de confirmación.

## Estructura del proyecto

    ProyectoBDD/
    ├── README.md
    ├── features/
    │   ├── login.feature
    │   ├── products.feature
    │   ├── cart.feature
    │   ├── checkout.feature
    │   ├── step_definitions/
    │   │   ├── login_steps.rb
    │   │   ├── products_steps.rb
    │   │   ├── cart_steps.rb
    │   │   └── checkout_steps.rb
    │   └── support/
    │       ├── env.rb
    │       └── hooks.rb
    └── screenshots/

## Archivos principales

### env.rb

Configura el ambiente de ejecución de pruebas.

Incluye:

- Carga de Capybara y Selenium WebDriver.
- URL base de SauceDemo.
- Configuración del navegador Chrome.
- Preferencias para reducir avisos externos del navegador.
- Tiempo máximo de espera para encontrar elementos.

### hooks.rb

Contiene hooks de Cucumber.

Se utiliza:

- `Before` para limpiar la sesión antes de cada escenario.
- `After` para guardar captura de pantalla si un escenario falla.

## Localizadores utilizados

En el proyecto se utilizan diferentes formas de localización de elementos.

### Localizadores de Capybara

Ejemplo:

    fill_in "user-name", with: usuario
    click_button "Login"

### Selectores CSS

Ejemplo:

    find("#add-to-cart-sauce-labs-backpack").click
    expect(page).to have_css(".shopping_cart_badge", text: "1")

### XPath

Ejemplo:

    find(:xpath, "//button[@id='checkout']").click
    find(:xpath, "//button[@id='finish']").click

El uso combinado de localizadores permite aplicar diferentes estrategias de identificación de elementos dentro de la interfaz.

## Comandos de ejecución

Para ejecutar todos los escenarios:

    cucumber --publish-quiet

Para ejecutar un feature específico:

    cucumber features/login.feature --publish-quiet

    cucumber features/products.feature --publish-quiet

    cucumber features/cart.feature --publish-quiet

    cucumber features/checkout.feature --publish-quiet

## Reporte HTML

Para generar un reporte HTML local:

    mkdir reports
    cucumber features --format html --out reports/reporte.html --publish-quiet

El reporte se genera en:

    reports/reporte.html

## Estado actual

El framework cuenta con escenarios automatizados para el flujo principal de Smoke Test:

- Login
- Productos
- Carrito
- Checkout

Las pruebas se ejecutan con Cucumber y validan comportamiento visible desde la perspectiva del usuario final.

## Repositorio

Repositorio del proyecto:

https://github.com/FernandoNB06/saucedemo-bdd-automation