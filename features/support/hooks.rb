Before do
  Capybara.reset_sessions!
end

After do |scenario|
  if scenario.failed?
    Dir.mkdir("screenshots") unless Dir.exist?("screenshots")

    scenario_name = scenario.name.gsub(/[^A-Za-z0-9]/, "_")
    screenshot_path = "screenshots/#{scenario_name}.png"

    save_screenshot(screenshot_path)
    puts "Screenshot guardado en: #{screenshot_path}"
  end
end