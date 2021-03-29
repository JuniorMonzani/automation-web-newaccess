class Person
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    
    def visit_Register_Person
        visit 'http://laboratorio.mdacesso.com.br/Person/PersonsLst.aspx'
    end
end