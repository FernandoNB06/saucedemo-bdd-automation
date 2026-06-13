When("abro el menú lateral") do
  find(:css, "#react-burger-menu-btn").click
end

When("selecciono la opción logout") do
  find(:xpath, "/html/body/div/div/div/div[1]/div[1]/div[1]/div/div[2]/div[1]/nav/a[3]").click
end

Then("debería volver a la pantalla de login") do
  expect(page).to have_current_path("/", ignore_query: true)

  expect(page).to have_css("#login-button", visible: true)
  expect(page).to have_css("#user-name", visible: true)
  expect(page).to have_css("#password", visible: true)

  expect(page).not_to have_css(".inventory_list")
  expect(page).not_to have_css(".shopping_cart_link")
end

When("selecciono la opción reset app state") do
  find(:xpath, "/html/body/div/div/div/div[1]/div[1]/div[1]/div/div[2]/div[1]/nav/a[4]").click
end

Then("el carrito debería quedar vacío") do
  expect(page).not_to have_css(".shopping_cart_badge")
end

Then("debería ver las opciones principales del menú lateral") do
  expect(page).to have_css("#inventory_sidebar_link", text: "All Items")
  expect(page).to have_css("#about_sidebar_link", text: "About")
  expect(page).to have_css("#logout_sidebar_link", text: "Logout")
  expect(page).to have_css("#reset_sidebar_link", text: "Reset App State")
end