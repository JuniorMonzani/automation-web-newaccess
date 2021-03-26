class EquipmentGroup
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    def visitEquipmentGroup
        visit 'http://laboratorio.mdacesso.com.br/Groups/EquipmentGroupEdt.aspx?OperationType=create&chkLastTen=False&currentPaginationIndex=1'
    end
end