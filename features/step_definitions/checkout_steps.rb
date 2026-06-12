When("inicio el checkout") do
  find(:xpath, "/html/body/div/div/div/div[2]/div/div[2]/button[2]").click
end

When("ingreso los datos del comprador {string} {string} {string}") do |nombre, apellido, codigo_postal|
  find(:css, "#first-name").set(nombre)
  find(:css, "#last-name").set(apellido)
  find(:css, "#postal-code").set(codigo_postal)
end

When("continúo al resumen de compra") do
  find(:css, "#continue").click
end

Then("debería ver el producto {string} en el resumen") do |producto|
  expect(page).to have_css(".cart_item", text: producto)
end

Then("debería ver el precio {string} en el resumen") do |precio|
  expect(page).to have_css(".cart_item", text: precio)
end

When("finalizo la compra") do
  find(:xpath, "/html/body/div/div/div/div[2]/div/div[2]/div[9]/button[2]").click
end

Then("debería ver el mensaje de confirmación {string}") do |mensaje|
  expect(page).to have_css(".complete-header", text: mensaje)
end

Then("el resumen debería mostrar subtotal, tax y total consistentes") do
  subtotal_text = find(:css, ".summary_subtotal_label").text
  tax_text = find(:css, ".summary_tax_label").text
  total_text = find(:css, ".summary_total_label").text

  subtotal = subtotal_text.gsub("Item total: $", "").to_f
  tax = tax_text.gsub("Tax: $", "").to_f
  total = total_text.gsub("Total: $", "").to_f

  expected_subtotal = 29.99

  expect(subtotal).to eq(expected_subtotal)
  expected_total = (expected_subtotal + tax).round(2)
  expect(total).to eq(expected_total)
end

Then("debería ver el error de checkout {string}") do |mensaje|
  expect(page).to have_css("[data-test='error']", text: mensaje)
end

When("cancelo el checkout desde información") do
  find(:css, "#cancel").click
end

Then("debería volver al carrito de compras") do
  expect(page).to have_css(".title", text: "Your Cart")
end

When("cancelo el checkout desde resumen") do
  find(:xpath, "/html/body/div/div/div/div[2]/div/div[2]/div[9]/button[1]").click
end

When("avanzo al resumen de compra con datos válidos") do
  find(:xpath, "/html/body/div/div/div/div[2]/div/div[2]/button[2]").click
  find(:css, "#first-name").set("Fernando")
  find(:css, "#last-name").set("Nogales")
  find(:css, "#postal-code").set("0000")
  find(:css, "#continue").click
end