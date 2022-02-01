require 'login/login'
require 'physical_environment/equipmentGroup/equipmentGroup'
require 'common/findElements'
require 'common/constants'

  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  login = Login.new

  #background
    Given('Que o usuário esteja na página de cadastro de Grupo de Equipamento.') do
        equipmentGroup.visit_Register_Equipment_Group
        login.make_Login
    end
            
    #verifyLabelsEquipmentGroup
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na tela.') do
        expect(page).to have_content('Número')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Área origem')
        expect(page).to have_content('Área destino')
        expect(page).to have_content('Fuso horário')
        expect(page).to have_content('Controla acesso de veículos')
        expect(page).to have_content('Grupo tem área de destino')
        expect(page).to have_content('Respeita horário de verão')
        expect(page).to have_content('Controla sorteio')
        expect(page).to have_content('Horário de verão')
        expect(page).to have_content('Data inicial (dd/mm/aaaa)')
        expect(page).to have_content('Data final (dd/mm/aaaa)')
        expect(page).to have_content('Equipamentos')
        expect(page).to have_content('Portas')
        expect(page).to have_content('Selecione os equipamentos')
      end

    #fieldNumberRequiredEquipmentGroup
      Given('Informar caractere alfanumérico no campo "Número" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        equipmentGroup.fills_In_Equipment_Group('teste', 'Teste de automação', '1', '2', false, true, false)
        equipmentGroup.associates_Equipment('2 - PIII/Smart')
      end
    
      When('Clicar no botão Salvar para validar o campo "Número".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo "Número" pois o mesmo é obrigatório e só aceita caractere numérico.') do
        expect(page).to have_selector("input[oldtitle='Informe o Número']")
      end

    #fieldDescriptionRequiredEquipmentGroup
      Given('Não preencher o campo "Descrição" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        equipmentGroup.fills_In_Equipment_Group(9999, '', '1', '2', false, true, false)
        equipmentGroup.associates_Equipment('2 - PIII/Smart')
      end
    
      When('Clicar no botão Salvar para validar o campo "Descrição".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
      end

    #fieldOriginAreaRequiredEquipmentGroup
      Given('Informar caractere alfanumérico no campo "Área origem" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '', '2', false, true, false)
        equipmentGroup.associates_Equipment('2 - PIII/Smart')
      end
    
      When('Clicar no botão Salvar para validar o campo "Área origem".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo "Área origem" pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Área origem']")
      end

    #fieldDestinationAreaRequiredEquipmentGroup
      Given('Informar caractere alfanumérico no campo "Área destino" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '', false, true, false)
        equipmentGroup.associates_Equipment('2 - PIII/Smart')
      end
    
      When('Clicar no botão Salvar para validar o campo "Área destino".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo "Área destino" pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
      end

    #fieldEquipmentRequiredEquipmentGroup
      Given('Não associar equipamento ao grupo mas preencher corretamente todos os outros campos necessários para efetuar o cadastro.') do
        equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '2', false, true, false)
      end
    
      When('Clicar no botão Salvar para validar ao menos um equipamento associado.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve exibir uma mensagem de erro com informação ao usuário.') do
        expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'
      end

    #verifyValuesTimeZoneEquipmentGroup
      Given('Obter todos os valores do dropbox "Fuso horário" e comparar com os valores esperados.') do
        $valuesTimeZone = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTimeZone', $TIME_ZONE)
      end

      Then('Deve conter todos os valores esperados no campo "Fuso horário".') do
        expect($valuesTimeZone).to be_truthy
      end

    #verifyValuesControlSortitionHasDestinationAreaEquipmentGroup
      Given('Obter todos os valores do dropbox "Controla Sorteio" e comparar com os valores esperados.') do
        $valueSortitionHasDestinationArea = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_HAS_DESTINATION_AREA)
      end

      Then('Deve conter todos os valores esperados no campo "Controla Sorteio".') do
        expect($valueSortitionHasDestinationArea).to be_truthy
      end

    #verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup
      Given('Desmarcar o campo "Grupo tem área de destino" para alterar os valores no dropbox.') do
        uncheck('chkHasDestinationArea')
      end

      When('Obter todos os valores do dropbox "Controla Sorteio" após desmarcar o checkbox e compara com os valores esperados.') do
        $valueSortitionNoHasDestinationArea = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_NO_HAS_DESTINATION_AREA)
      end
      Then('Deve conter todos os valores esperados no campo "Controla Sorteio" após desmarcar o checkbox.') do
        expect($valueSortitionNoHasDestinationArea).to be_truthy
      end

    #fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup
      Given('Desmarcar o campo "Grupo tem área de destino".') do
        uncheck('chkHasDestinationArea')
      end

      Then('O campo "Área destino" deve ficar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtDestinationArea').disabled?).to be(true)
      end

    #registerEquipmentGroupSuccess
      Given('Que eu preencha todos os campos obrigatórios de forma correta.') do
        equipmentGroup.fills_In_Equipment_Group('123', 'Teste de automação', '1', '2', true, true, true)
        equipmentGroup.associates_Equipment('2 - PIII/Smart')
      end

      Given('Selecionar o "Fuso Horário" como "03:00".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTimeZone', '03:00')
      end

      Given('Selecionar o "Controla sorteio" como "Área origem".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlControlSortition', 'Área origem')
      end

      Given('Adicionar uma data válida no campo "Data inicial".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightStartDate', '01/01/2025')
      end

      Given('Adicionar uma data válida no campo "Data final".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightEndDate', '01/01/2030')
      end

      When('Clicar no botão "Salvar" para incluir o grupo.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('O grupo de equipamento deve ser salvo com sucesso.') do
        expect(page).to have_content('Cadastro de Grupo de Equipamento')
      end