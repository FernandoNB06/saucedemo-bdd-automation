Given("que estoy en la página de login de SauceDemo") do
  visit "/"
end

When("ingreso el usuario {string}") do |usuario|
  fill_in "user-name", with: usuario
end

When("ingreso la contraseña {string}") do |password|
  fill_in "password", with: password
end

When("hago clic en el botón de login") do
  click_button "Login"
end

Then("debería ver la página de productos") do
  expect(page).to have_content("Products")
end

Then("debería ver el mensaje {string}") do |mensaje|
  expect(page).to have_content(mensaje)
end