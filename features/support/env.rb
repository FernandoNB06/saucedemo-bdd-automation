require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.saucedemo.com'
Capybara.default_max_wait_time = 10