class EquipmentGroup
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    attr_accessor :number, :description, :originArea, :destinationArea

    def visit_Register_Equipment_Group
        visit 'http://laboratorio.mdacesso.com.br/Groups/EquipmentGroupEdt.aspx?OperationType=create&chkLastTen=False&currentPaginationIndex=1'
    end

    #preenche os campos do cadastro de grupo de equipamento
    def fills_In_Equipment_Group(number, description, originArea, destinationArea, vehicleAccess, hasDestinationArea, daylightSaving)
        fill_in 'MainContentMainMaster_MainContent_txtNumber', with: number
        fill_in 'MainContentMainMaster_MainContent_txtDescription', with: description
        fill_in 'MainContentMainMaster_MainContent_txtOriginArea', with: originArea
        fill_in 'MainContentMainMaster_MainContent_txtDestinationArea', with: destinationArea

        #verifica o valor informado para o checkbox, se for verdadeiro marca o campo, se for falso desmareca
        if vehicleAccess == true
            check('chkControlsVehicle')
        else
            uncheck('chkControlsVehicle')
        end

        if hasDestinationArea == true
            check('chkHasDestinationArea')
        else
            uncheck('chkHasDestinationArea')
        end

        if daylightSaving == true
            check('MainContentMainMaster_MainContent_chkDaylightSaving')
        else
            uncheck('MainContentMainMaster_MainContent_chkDaylightSaving')
        end
    end

    #associa ao grupo o equipamento infromado
    def associates_Equipment(equipment)
        select("#{equipment}", from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
        find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click
    end

    #desaassocia do grupo o equipamento informado
    def desassociated_Equipment(equipment)
        select("#{equipment}", from: 'MainContentMainMaster_MainContent_lstEquipment_lstRight')
        find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToLeft').click
    end
end