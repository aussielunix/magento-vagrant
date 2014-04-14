require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/mechanize'

RSpec.configure do |config|
    config.include Capybara::DSL
end

Capybara.configure do |config|
  config.default_driver = :mechanize
  config.app_host       = 'http://aussie.lunix.com.au/'
  config.run_server     = false
end
