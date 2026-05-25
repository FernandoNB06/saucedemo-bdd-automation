Before do
  begin
    Capybara.reset_sessions!
  rescue Selenium::WebDriver::Error::InvalidSessionIdError
    Capybara.current_session.driver.quit
  rescue StandardError
    # Evita que una sesión rota detenga el siguiente escenario
  end
end

After do |scenario|
  if scenario.failed?
    begin
      Dir.mkdir("screenshots") unless Dir.exist?("screenshots")

      scenario_name = scenario.name.gsub(/[^A-Za-z0-9]/, "_")
      screenshot_path = "screenshots/#{scenario_name}.png"

      save_screenshot(screenshot_path)
      puts "Screenshot guardado en: #{screenshot_path}"
    rescue Selenium::WebDriver::Error::InvalidSessionIdError
      puts "No se pudo guardar screenshot porque la sesión del navegador ya estaba cerrada."
    rescue StandardError => e
      puts "No se pudo guardar screenshot: #{e.message}"
    end
  end
end