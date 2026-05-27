When("agrego el producto {string} al carrito") do |producto|
  product_id = producto.downcase.gsub(" ", "-")
  find(:css, "#add-to-cart-#{product_id}").click
end

Then("el contador del carrito debería mostrar {string}") do |cantidad|
  expect(page).to have_css(".shopping_cart_badge", text: cantidad)
end

When("abro el carrito de compras") do
  find(:xpath, "/html/body/div/div/div/div[1]/div[1]/div[3]/a").click
end

Then("debería ver el producto {string} en el carrito") do |producto|
  expect(page).to have_css(".cart_item", text: producto)
end

Then("debería ver el precio {string} en el carrito") do |precio|
  expect(page).to have_css(".cart_item", text: precio)
end