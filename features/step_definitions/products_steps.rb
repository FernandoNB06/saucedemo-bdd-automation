Then("debería ver el producto {string}") do |producto|
  expect(page).to have_css(".inventory_item_name", text: producto)
end

Then("debería ver la descripción {string}") do |descripcion|
  expect(page).to have_css(".inventory_item_desc", text: descripcion)
end

Then("debería ver el precio {string}") do |precio|
  expect(page).to have_css(".inventory_item_price", text: precio)
end

Then("debería ver el botón para agregar {string} al carrito") do |_producto|
  expect(page).to have_xpath("/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button", text: "Add to cart")
end