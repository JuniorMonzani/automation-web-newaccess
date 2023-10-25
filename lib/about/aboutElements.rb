class About

    include Capybara::DSL
   
   def visit_about
       visit 'https://autoteste.dimep-ams.com.br/HelpAbout/HelpAbout.aspx'
   end

   

end