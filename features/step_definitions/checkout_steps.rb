When("inicio el checkout") do
  find(:xpath, "//button[@id='checkout']").click
end

When("ingreso los datos del comprador {string} {string} {string}") do |nombre, apellido, codigo_postal|
  fill_in "first-name", with: nombre
  fill_in "last-name", with: apellido
  fill_in "postal-code", with: codigo_postal
end

When("continúo al resumen de compra") do
  click_button "Continue"
end

Then("debería ver el producto {string} en el resumen") do |producto|
  expect(page).to have_css(".cart_item", text: producto)
end

Then("debería ver el precio {string} en el resumen") do |precio|
  expect(page).to have_css(".cart_item", text: precio)
end

When("finalizo la compra") do
  find(:xpath, "//button[@id='finish']").click
end

Then("debería ver el mensaje de confirmación {string}") do |mensaje|
  expect(page).to have_content(mensaje)
end