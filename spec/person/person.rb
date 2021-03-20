class Person
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    
    def visitRegisterPerson
        visit 'http://laboratorio.mdacesso.com.br/Person/PersonsLst.aspx'
    end
end