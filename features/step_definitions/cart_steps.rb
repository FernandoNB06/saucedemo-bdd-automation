When("agrego el producto {string} al carrito") do |producto|
  product_id = producto.downcase.gsub(" ", "-")
  find("#add-to-cart-#{product_id}").click
end

Then("el contador del carrito debería mostrar {string}") do |cantidad|
  expect(page).to have_css(".shopping_cart_badge", text: cantidad)
end