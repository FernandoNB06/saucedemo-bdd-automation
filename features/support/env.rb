require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.app_host = 'https://www.saucedemo.com'
Capybara.default_max_wait_time = 10

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-save-password-bubble')
  options.add_argument('--disable-password-manager-reauthentication')
  options.add_argument('--disable-features=PasswordLeakDetection,AutofillServerCommunication,PasswordManagerOnboarding')
  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium_chrome