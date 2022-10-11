#23
require 'login/login'
require 'physical_environment/equipmentGroup/equipmentGroup'
require 'common/findElements'
require 'common/constants'

  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  login = Login.new

  #background
    Given('Que estou na tela que lista os Grupos de Equipamentos cadastrados para realizar buscas e exxlusões.') do
        equipmentGroup.visit_List_Equipment_Group
        login.make_Login
    end

    #verifyValuesFilterSearchEquipmentGroup
      Given('Desmarco a flag 10 últimas atualizações do Grupo de Equipamento.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      When('Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados para o campo da tela Grupo de Eqp.') do
        $values = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', $FILTER_SEARCH_EQUIPMENT_GROUP)
      end
    
      Then('Deve conter todos os valores esperados para o campo da tela de Grupo de Eqp.') do
        expect($values).to be_truthy
      end

    #searchByNumberNotExsist
      Given('Desmarco a flag 10 últimas atualizações_02.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      When('Eu preencho o textbox com um número de grupo que não existe.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 999)
      end

      When('Clico em Buscar_02.') do
        click_button 'Buscar'
        sleep 1
      end
    
      Then('Validar o label apresentado que informa que nenhum resultado foi encontrado_02.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end


    #searchByNumberExsist
      Given('Desmarco a flag 10 últimas atualizações_03.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      When('Eu preencho o textbox com um número de grupo que existe_03.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      end

      When('Clico em Buscar_03.') do
        click_button 'Buscar'
        sleep 1
      end
    
      Then('Validar se foi encontrado o grupo de equipamento esperado_03.') do
        expect(page).to have_content('Grupo alterado - Teste automaç')
      end

    #searchByDescriptionNotExsist
      Given('Desmarco a flag 10 últimas atualizações_04.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      Given('Seleciono o valor Descrição no dropbox de filtro de pesquisa_04.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
      end

      When('Eu preencho o textbox com um número de grupo que existe mas não faça parte de nenhuma descrição de grupo de equipamento.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      end

      When('Clico em Buscar_04.') do
        click_button 'Buscar'
      end
    
      Then('Validar o label apresentado que informa que nenhum resultado foi encontrado_04.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    #searchByDescriptionExsist
      Given('Desmarco a flag 10 últimas atualizações_05.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      Given('Seleciono o valor Descrição no dropbox de filtro de pesquisa_05.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
      end

      When('Eu preencho o textbox com uma descrição de grupo que existe_05.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
      end

      When('Clico em Buscar_05.') do
        click_button 'Buscar'
      end
    
      Then('Validar se foi encontrado o grupo de equipamento esperado.') do
        expect(page).to have_content('Grupo alterado - Teste automaç')
      end



    #verifyMessageDeteleEquipmentGropupInUse
      Given('Desmarco a flag 10 últimas atualizações_06.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      Given('Eu preencho o textbox com um número de grupo que esteja em uso.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 1)
      end

      Given('Clico em Buscar_06.') do
        click_button 'Buscar'
        sleep 1
      end

      When('Eu clico no ícone de Excluir_06.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end
    
      Then('Validar a mensagem apresentada ao usuário_06.') do
        click_button 'Sim'
        expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos está em uso no sistema e não pode ser excluído'
      end

    #verifyMessageDeteleEquipmentGropup
      Given('Desmarco a flag 10 últimas atualizações_07.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_07.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      end

      Given('Clico em Buscar_07.') do
        click_button 'Buscar'
        sleep 1
      end

      When('Eu clico no ícone de Excluir_07.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end
    
      Then('Validar a mensagem apresentada ao usuário_07.') do
        expect(page).to have_content('Confirma a exclusão?')
      end

    #deteleSuccessEquipmentGroup
      Given('Desmarco a flag 10 últimas atualizações_08.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        sleep 1
      end

      Given('Preencha o textbox com um número do grupo que foi inserido pela automação_08.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      end

      Given('Clico em Buscar_08.') do
        click_button 'Buscar'
        sleep 1
      end

      When('Eu clico no ícone de Excluir_08.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      When('Ao ser exibida a mensagem clicar em Sim.') do
        click_button 'Sim'
        sleep 1
      end
    
      Then('Validar se o grupo foi excluído.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end