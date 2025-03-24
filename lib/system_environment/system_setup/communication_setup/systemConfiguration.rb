class SystemConfiguration
  # inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
  include Capybara::DSL

    def visit_System_Configuration
        visit 'https://autoteste.dimep-ams.com.br/SystemConfiguration/SystemConfigurationEdt.aspx'
    end
end