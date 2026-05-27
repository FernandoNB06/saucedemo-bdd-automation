Given("que estoy en la página de login de SauceDemo") do
  visit "/"
end

When("ingreso el usuario {string}") do |usuario|
  find(:css, "#user-name").set(usuario)
end

When("ingreso la contraseña {string}") do |password|
  find(:css, "#password").set(password)
end

When("hago clic en el botón de login") do
  find(:xpath, "/html/body/div/div/div[2]/div[1]/div/div/form/input").click
end

Then("debería ver la página de productos") do
  expect(page).to have_css(".title", text: "Products")
end

Then("debería ver el mensaje {string}") do |mensaje|
  expect(page).to have_css("[data-test='error']", text: mensaje)
end