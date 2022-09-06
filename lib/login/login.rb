require "capybara"
require "capybara/cucumber"
require "cucumber"
require "report_builder"
require "capybara/rspec"
require "gherkin"

class Login
  #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
  include Capybara::DSL

  def visit_Login_NewAccess
    visit 'https://autoteste.dimep-ams.com.br/'
  end

  def receive_login (user, password)
    fill_in      'txtUsrLogin',      with: user
    fill_in      'txtUserPassLogin', with: password
  end

  def make_Login
    fill_in      'txtUsrLogin',      with: 'admin'
    fill_in      'txtUserPassLogin', with: $passwordAdmin
    click_button 'Submit1'
  end
end 