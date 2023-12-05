require "cucumber"
require "retriable"
require 'webdrivers'
require "selenium-webdriver"
require "capybara"
require "site_prism"
require "capybara/dsl"
require "pdf-reader"
require "open-uri"
require 'fileutils'
require 'rspec'
require 'colorize'
require 'headless'
require 'nokogiri'
#require 'win32ole'
#require 'autoit'

#include Capybara::DSL

Capybara.register_driver :site_prism do |driver|
  options = Selenium::WebDriver::Chrome::Options.new
  Capybara::Selenium::Driver.new(driver, browser: :chrome) # Adiciona um navegador de preferência
  #options.add_argument('--headless') # Adiciona a opção headless (sem navegador)
  #options.add_argument('--disable-gpu') # Desabilita a aceleração de GPU (sem navegador)
  Capybara::Selenium::Driver.new(driver, browser: :chrome, options: options)
end

Capybara.configure do |config|
  Capybara.default_driver = :site_prism
  Capybara.page.driver.browser.manage.window.maximize
  config.app_host = "https://demo.automationtesting.in"
end

$driver = Capybara.page.driver.browser
$wait = Selenium::WebDriver::Wait.new(timeout: 10)
options = Selenium::WebDriver::Chrome::Options.new
$path = Capybara.current_session.driver.browser.download_path = Dir.pwd