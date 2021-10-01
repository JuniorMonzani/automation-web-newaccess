#require 'report_builder'

# def add_screenshot(scenario)
#   nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
#    nome_cenario = nome_cenario.gsub(' ','_').downcase!
#    screenshot = "report/log/screenshots/#{nome_cenario}.png"
#   page.save_screenshot(screenshot)
#   embed(screenshot, 'image/png', 'Print maroto :)')
 #end

#  def add_browser_logs
#     time_now = Time.now
#     # Getting current URL
#     current_url = Capybara.current_url.to_s
#     # Gather browser logs
#     logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
#    # Remove warnings and info messages
#     logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
#     logs.any? == true
#     embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
# end

# at_exit do
#     ReportBuilder.input_path = 'report_cucumber.json'
    
#     ReportBuilder.configure do |config|
#       config.report_path = 'my_test_report'
#       config.report_types = [:json, :html]
#     end
    
#     options = {
#        report_title: 'NewAccess Automatic Tests'
#     }
# end