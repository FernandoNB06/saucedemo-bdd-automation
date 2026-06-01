# SauceDemo BDD Automation

Proyecto de automatización de pruebas funcionales tipo **Smoke Test** para la aplicación **SauceDemo**, utilizando el enfoque **BDD** con **Cucumber, Ruby, Capybara y Selenium WebDriver**.

## AUT

La aplicación bajo prueba es:

https://www.saucedemo.com/

SauceDemo es una aplicación web de ejemplo que simula un flujo de compra en línea. Permite validar funcionalidades como inicio de sesión, visualización de productos, carrito de compras, checkout y gestión de sesión.

## Objetivo del proyecto

El objetivo del proyecto es construir un framework automatizado que permita ejecutar pruebas Smoke Test sobre el flujo principal de SauceDemo, validando que las funcionalidades críticas de la aplicación estén disponibles y funcionen correctamente.

El framework permite ejecutar escenarios automatizados escritos en lenguaje Gherkin, siguiendo el enfoque BDD para facilitar la comprensión de las pruebas desde una perspectiva funcional.

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

En los archivos `.feature` se aplican buenas prácticas como:

- Uso de `Background` para preparar estados comunes.
- Uso de `Scenario Outline` para probar datos similares.
- Uso de tablas Gherkin para validar listas de información.
- Escenarios con flujo claro, evitando secuencias desordenadas como `When → Then → When → Then`.

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
- Gestión de sesión

## Escenarios automatizados

El proyecto cuenta actualmente con **42 escenarios automatizados**, todos ejecutados correctamente mediante Cucumber.

Resultado final de ejecución:

    42 scenarios (42 passed)
    337 steps (337 passed)

### Login

Archivo:

    features/login.feature

Cubre:

- Inicio de sesión con credenciales válidas.
- Validación de usuario bloqueado.
- Validación de usuario inexistente.
- Validación de usuario vacío.
- Validación de contraseña vacía.
- Uso de `Background` para evitar repetir la navegación inicial.
- Uso de `Scenario Outline` con tabla de `Examples` para credenciales inválidas.

### Productos

Archivo:

    features/products.feature

Cubre:

- Validación de la página Products.
- Validación de nombre, descripción, precio y botón Add to cart.
- Validación de lista completa de productos mediante tabla Gherkin.
- Ordenamiento por nombre de A a Z.
- Ordenamiento por nombre de Z a A.
- Ordenamiento por precio de menor a mayor.
- Ordenamiento por precio de mayor a menor.
- Visualización del detalle de un producto.
- Agregar producto al carrito desde el detalle.
- Volver al listado desde el detalle.
- Validar cambio del botón Add to cart a Remove.
- Mantener producto agregado al navegar entre listado y detalle.

### Carrito

Archivo:

    features/cart.feature

Cubre:

- Agregar un producto al carrito.
- Agregar múltiples productos al carrito.
- Validar contador del carrito.
- Abrir el carrito de compras.
- Verificar productos agregados en el carrito.
- Verificar precios en el carrito.
- Remover producto desde el carrito.
- Remover producto desde la página de productos.
- Remover producto desde el inventario.
- Remover uno de varios productos.
- Validar actualización del contador al remover productos.
- Continuar comprando desde el carrito.

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
- Validación de subtotal, tax y total.
- Validación de campos obligatorios: nombre, apellido y código postal.
- Validación de checkout con todos los campos vacíos.
- Cancelación desde la pantalla de información.
- Cancelación desde el resumen de compra.
- Checkout con múltiples productos.
- Validación del resumen con múltiples productos.

### Gestión de sesión

Archivo:

    features/session.feature

Cubre:

- Cierre de sesión.
- Retorno a la pantalla de login.
- Reset App State.
- Validación de limpieza del carrito.
- Validación de opciones principales del menú lateral.
- Agregar producto después de resetear el estado de la aplicación.

## Estructura del proyecto

    ProyectoBDD/
    ├── README.md
    ├── features/
    │   ├── login.feature
    │   ├── products.feature
    │   ├── cart.feature
    │   ├── checkout.feature
    │   ├── session.feature
    │   ├── step_definitions/
    │   │   ├── login_steps.rb
    │   │   ├── products_steps.rb
    │   │   ├── cart_steps.rb
    │   │   ├── checkout_steps.rb
    │   │   └── session_steps.rb
    │   └── support/
    │       ├── env.rb
    │       └── hooks.rb
    ├── reports/
    │   └── reporte.html
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
- Configuración del driver utilizado por Capybara.

### hooks.rb

Contiene hooks de Cucumber.

Se utiliza:

- `Before` para limpiar la sesión antes de cada escenario.
- `After` para guardar captura de pantalla si un escenario falla.

Esto permite que los escenarios sean más independientes y que se genere evidencia cuando una prueba falla.

## Localizadores utilizados

En el proyecto se utilizan diferentes formas de localización de elementos, principalmente selectores CSS y XPath.

### Selectores CSS

Se utilizan para elementos con identificadores, clases o atributos estables.

Ejemplo:

    find(:css, "#user-name").set(usuario)
    find(:css, ".shopping_cart_badge")
    expect(page).to have_css(".title", text: "Products")

### XPath

Se utiliza en acciones puntuales donde se requiere ubicar elementos específicos dentro de la estructura de la página.

Ejemplo:

    find(:xpath, "/html/body/div/div/div[2]/div[1]/div/div/form/input").click
    find(:xpath, "/html/body/div/div/div/div[2]/div/div[2]/button[2]").click

El uso combinado de CSS y XPath permite aplicar diferentes estrategias de identificación de elementos dentro de la interfaz.

## Comandos de ejecución

Para ejecutar todos los escenarios:

    cucumber --publish-quiet

Para ejecutar un feature específico:

    cucumber features/login.feature --publish-quiet

    cucumber features/products.feature --publish-quiet

    cucumber features/cart.feature --publish-quiet

    cucumber features/checkout.feature --publish-quiet

    cucumber features/session.feature --publish-quiet

## Reporte HTML

Para generar un reporte HTML local:

    cucumber features --format html --out reports/reporte.html --publish-quiet

El reporte se genera en:

    reports/reporte.html

Para abrir el reporte en Windows:

    start reports\reporte.html

## Gestión del sprint

El proyecto fue gestionado mediante Trello, organizando las tareas en tarjetas relacionadas con:

- Configuración del ambiente.
- Creación del framework BDD.
- Automatización de escenarios por módulo.
- Implementación de hooks.
- Refactorización de escenarios.
- Generación del reporte HTML.
- Actualización de documentación.

El repositorio GitHub fue utilizado para el control de versiones y registro de commits del avance del proyecto.

## Estado actual

El framework cuenta con **42 escenarios automatizados**, cubriendo el flujo principal de Smoke Test de SauceDemo:

- Login
- Productos
- Carrito de compras
- Checkout
- Gestión de sesión

La última ejecución finalizó correctamente con:

    42 scenarios (42 passed)
    337 steps (337 passed)

Además, se generó un reporte HTML local en:

    reports/reporte.html

## Repositorio

Repositorio del proyecto:

https://github.com/FernandoNB06/saucedemo-bdd-automation