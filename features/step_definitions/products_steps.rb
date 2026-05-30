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

Then("debería ver los siguientes productos:") do |table|
  productos = table.hashes.map { |row| row["producto"] }

  productos.each do |producto|
    expect(page).to have_css(".inventory_item_name", text: producto)
  end
end

When("selecciono el ordenamiento {string}") do |opcion|
  find(:css, ".product_sort_container").select(opcion)
end

Then("el primer producto debería ser {string}") do |producto_esperado|
  primer_producto = all(:css, ".inventory_item_name").first.text
  expect(primer_producto).to eq(producto_esperado)
end

Then("el primer precio de producto debería ser {string}") do |precio_esperado|
  primer_precio = all(:css, ".inventory_item_price").first.text
  expect(primer_precio).to eq(precio_esperado)
end

When('selecciono el producto {string}') do |producto|
  find('.inventory_item_name', text: producto).click
end

Then('debería ver el detalle del producto {string}') do |producto|
  expect(page).to have_css('.inventory_details_name', text: producto)
end

Then('debería ver el precio del detalle {string}') do |precio|
  expect(page).to have_css('.inventory_details_price', text: precio)
end

Then('debería ver la descripción del detalle {string}') do |descripcion|
  expect(page).to have_css('.inventory_details_desc', text: descripcion)
end
