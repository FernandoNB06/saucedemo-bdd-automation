# SauceDemo BDD Automation

Proyecto de automatización de pruebas Smoke Test para SauceDemo usando BDD.

## Tecnologías utilizadas

- Ruby
- Cucumber
- Capybara
- Selenium WebDriver
- RSpec
- ChromeDriver

## AUT

https://www.saucedemo.com/

## Ejecución

Para ejecutar los escenarios:

```cmd
cucumber


Para generar reporte HTML:

```cmd
mkdir reports
cucumber features --format html --out reports/reporte.html --publish-quiet
```