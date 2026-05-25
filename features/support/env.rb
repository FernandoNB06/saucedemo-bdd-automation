require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.app_host = 'https://www.saucedemo.com'
Capybara.default_max_wait_time = 10

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-save-password-bubble')
  options.add_argument('--disable-password-manager-reauthentication')
  options.add_argument('--disable-notifications')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--no-first-run')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--disable-features=PasswordLeakDetection,AutofillServerCommunication,PasswordManagerOnboarding,SafeBrowsingEnhancedProtection')

  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)
  options.add_preference('profile.password_manager_leak_detection', false)
  options.add_preference('autofill.profile_enabled', false)
  options.add_preference('autofill.credit_card_enabled', false)

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium_chrome