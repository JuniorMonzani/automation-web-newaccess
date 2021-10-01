require 'login/login'
require 'areas/Areas'
require 'commom/findElements'
require 'commom/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página de cadastro de Áreas.') do
      areas.visit_Register_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyLabelsAreas
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de áreas.') do
        expect(page).to have_content('Número')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Capacidade')
      end

    @fieldNumberRequiredAreas
      Given('Informar caractere alfanumérico no campo "Número" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas('teste', 'Teste de automação', '999')
      end

      When('Clicar no botão Salvar para validar o campo "Número" da tela Áreas.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Número" da tela Áreas pois o mesmo é obrigatório e só aceita caractere numérico.') do
        expect(page).to have_selector("input[oldtitle='Informe o Número']")
      end

    @fieldDescriptionRequiredAreas
      Given('Não preencher o campo "Descrição" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas('1', '', '999')
      end
    
      When('Clicar no botão Salvar para validar o campo "Descrição" da tela Áreas.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Descrição" da tela Áreas pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
      end

    @fieldCapacityRequiredAreas
      Given('Informar caractere alfanumérico no campo "Capacidade" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas('1', 'Teste de automação', 'teste')
      end
    
      When('Clicar no botão Salvar para validar o campo "Capacidade" da tela Áreas.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Capacidade" da tela Áreas pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Capacidade']")
      end

    # @fieldDestinationAreaRequiredEquipmentGroup
    #   Given('Informar caractere alfanumérico no campo "Área destino" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
    #     equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '', false, true, false)
    #     equipmentGroup.associates_Equipment('6 - Concentradora 1')
    #   end
    
    #   When('Clicar no botão Salvar para validar o campo "Área destino".') do
    #     click_button 'Salvar'
    #     sleep 0.3
    #   end
      
    #   Then('Deve existgir uma validação no campo "Área destino" pois o mesmo é obrigatório e não foi informado.') do
    #     expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
    #   end

    # @fieldEquipmentRequiredEquipmentGroup
    #   Given('Não associar equipamento ao grupo mas preencher corretamente todos os outros campos necessários para efetuar o cadastro.') do
    #     equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '2', false, true, false)
    #   end
    
    #   When('Clicar no botão Salvar para validar ao menos um equipamento associado.') do
    #     click_button 'Salvar'
    #     sleep 0.3
    #   end
      
    #   Then('Deve exibir uma mensagem de erro com informação ao usuário.') do
    #     expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'
    #   end

    # @verifyValuesTimeZoneEquipmentGroup
    #   Given('Obter todos os valores do dropbox "Fuso horário" e comparar com os valores esperados.') do
    #     $valuesTimeZone = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTimeZone', $TIME_ZONE)
    #   end

    #   Then('Deve conter todos os valores esperados no campo "Fuso horário".') do
    #     expect($valuesTimeZone).to be_truthy
    #   end

    # @verifyValuesControlSortitionHasDestinationAreaEquipmentGroup
    #   Given('Obter todos os valores do dropbox "Controla Sorteio" e comparar com os valores esperados.') do
    #     $valueSortitionHasDestinationArea = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_HAS_DESTINATION_AREA)
    #   end

    #   Then('Deve conter todos os valores esperados no campo "Controla Sorteio".') do

    #     expect($valueSortitionHasDestinationArea).to be_truthy
    #   end

    # @verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup
    #   Given('Desmarcar o campo "Grupo tem área de destino" para alterar os valores no dropbox.') do
    #     uncheck('chkHasDestinationArea')
    #   end

    #   When('Obter todos os valores do dropbox "Controla Sorteio" após desmarcar o checkbox e compara com os valores esperados.') do
    #     $valueSortitionNoHasDestinationArea = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_NO_HAS_DESTINATION_AREA)
    #   end
    #   Then('Deve conter todos os valores esperados no campo "Controla Sorteio" após desmarcar o checkbox.') do
    #     expect($valueSortitionNoHasDestinationArea).to be_truthy
    #   end

    # @fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup
    #   Given('Desmarcar o campo "Grupo tem área de destino".') do
    #     uncheck('chkHasDestinationArea')
    #   end

    #   Then('O campo "Área destino" deve ficar desabilitado.') do
    #     expect(find('#MainContentMainMaster_MainContent_txtDestinationArea').disabled?).to be(true)
    #   end

    # @registerEquipmentGroupSuccess
    #   Given('Que eu preencha todos os campos obrigatórios de forma correta.') do
    #     equipmentGroup.fills_In_Equipment_Group('123', 'Teste de automação', '1', '2', true, true, true)
    #     equipmentGroup.associates_Equipment('6 - Concentradora 1')
    #   end

    #   Given('Selecionar o "Fuso Horário" como "03:00".') do
    #     findElements.select_option('#MainContentMainMaster_MainContent_ddlTimeZone', '03:00')
    #   end

    #   Given('Selecionar o "Controla sorteio" como "Área origem".') do
    #     findElements.select_option('#MainContentMainMaster_MainContent_ddlControlSortition', 'Área origem')
    #   end

    #   Given('Adicionar uma data válida no campo "Data inicial".') do
    #     findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightStartDate', '01/01/2025')
    #   end

    #   Given('Adicionar uma data válida no campo "Data final".') do
    #     findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightEndDate', '01/01/2030')
    #   end

    #   When('Clicar no botão "Salvar" para incluir o grupo.') do
    #     click_button 'Salvar'
    #     sleep 0.3
    #   end

    #   Then('O grupo de equipamento deve ser salvo com sucesso.') do
    #     expect(page).to have_content('Cadastro de Grupo de Equipamento')
    #   end