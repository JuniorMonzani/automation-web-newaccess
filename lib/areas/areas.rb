class Areas
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    attr_accessor :areasDescription
    
    def visit_Register_Areas
        visit 'https://laboratorio.mdacesso.com.br/Area/AreaEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex=&ddlSearchField=Number'
    end

    def visit_List_Areas
        visit 'https://laboratorio.mdacesso.com.br/Area/AreaLst.aspx'
    end

end