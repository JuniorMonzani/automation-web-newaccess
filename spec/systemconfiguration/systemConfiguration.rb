class SystemConfiguration
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    
    def visitSystemConfiguration
        visit 'http://laboratorio.mdacesso.com.br/SystemConfiguration/SystemConfigurationEdt.aspx'
    end
end