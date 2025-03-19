class VisitorSetup

    include Capybara::DSL
   
   def visit_visitorSetup
       visit 'https://autoteste.dimep-ams.com.br/SystemConfiguration/SystemConfigurationEdt.aspx'
       
   end

end