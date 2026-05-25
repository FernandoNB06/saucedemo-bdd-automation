Then("debería ver el producto {string}") do |producto|
  expect(page).to have_content(producto)
end

Then("debería ver la descripción {string}") do |descripcion|
  expect(page).to have_content(descripcion)
end

Then("debería ver el precio {string}") do |precio|
  expect(page).to have_content(precio)
end

Then("debería ver el botón para agregar {string} al carrito") do |producto|
  product_id = producto.downcase.gsub(" ", "-")
  expect(page).to have_button("Add to cart")
  expect(page).to have_css("#add-to-cart-#{product_id}")
end