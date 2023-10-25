class DocType

    include Capybara::DSL
   
   def visit_doctype
       visit 'https://autoteste.dimep-ams.com.br/DocumentTypes/DocumentTypeLst.aspx'
   end

end