class People

    include Capybara::DSL
   
   def visit_person
       visit 'https://autoteste.dimep-ams.com.br/Person/PersonSituationsLst.aspx'
   end

    
end