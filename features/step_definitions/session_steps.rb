When("abro el menú lateral") do
  find(:css, "#react-burger-menu-btn").click
end

When("selecciono la opción logout") do
  find(:xpath, "/html/body/div/div/div/div[1]/div[1]/div[1]/div/div[2]/div[1]/nav/a[3]").click
end

Then("debería volver a la pantalla de login") do
  expect(page).to have_css("#login-button")
  expect(page).to have_css("#user-name")
  expect(page).to have_css("#password")
end