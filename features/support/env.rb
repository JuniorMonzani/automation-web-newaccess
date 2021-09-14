require "capybara"
require "capybara/cucumber"
require "cucumber"
require "report_builder"
require "capybara/rspec"
require "gherkin"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome #roda no navegador
    config.default_max_wait_time = 3
    #config.default_driver = :selenium_chrome_headless #roda com o nageador em background
end