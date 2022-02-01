require 'login/login'
require 'physical_environment/areas/Areas'
require 'common/findElements'
require 'common/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Áreas objetivando exclusão.') do
      areas.visit_List_Areas
      login.make_Login
    end

    @verifyValuesFilterSearchArea
      Given('Desmarco a flag 10 últimas atualizações_01 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end
      
      When('Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados.') do
        $valueAreas = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlSearchField', $DELETE_AREAS_SEARCH)
      end

      Then('Deve conter todos os valores esperados.') do
        expect($valueAreas).to be_truthy
      end

    @searchByNumberAreaNotExsist
      Given ('Desmarco a flag 10 últimas atualizações_02 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      When('Eu preencho o textbox com um número de grupo que não existe objetivando exclusão de Área.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', '9998')
      end

      And('Clico em Buscar_02 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end

      Then ('Validar o label apresentado que informa que nenhum resultado foi encontrado_02 objetivando exclusão de Área.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    @searchByNumberAreaExsist
      Given ('Desmarco a flag 10 últimas atualizações_03 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      When('Eu preencho o textbox com um número de grupo que existe_03 objetivando exclusão de Área.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
      end

      And('Clico em Buscar_03 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end      
      
      Then ('Validar se foi encontrada a Área esperada_03 objetivando exclusão de Área.') do
        expect(page).to have_content('9999')
      end

    @searchByDescriptionAreaNotExsist
      Given ('Desmarco a flag 10 últimas atualizações_04 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Seleciono o valor Descrição no dropbox de filtro de pesquisa_04 objetivando exclusão de Área.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlSearchField', 'Descrição')
      end

      When('Eu preencho o textbox com um número de área que existe mas não faça parte de nenhuma descrição de área cadastrada.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
      end

      And('Clico em Buscar_04 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end
      
      Then ('Validar o label apresentado que informa que nenhum resultado foi encontrado_04 objetivando exclusão de Área.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    @searchByDescriptionAreaExsist
      Given ('Desmarco a flag 10 últimas atualizações_05 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Seleciono o valor Descrição no dropbox de filtro de pesquisa_05 objetivando exclusão de Área.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlSearchField', 'Descrição')
      end

      When('Eu preencho o textbox com uma descrição de uma Área que existe_05.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_EDIT_DESCRIPTION)
      end

      And('Clico em Buscar_05 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end      
      
      Then ('Validar se foi encontrada a Área esperada.') do
        expect(page).to have_content('Automação Áreas Edição')
      end

    @verifyMessageDeteleAreaInUse
      Given ('Desmarco a flag 10 últimas atualizações_06 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Eu preencho o textbox com um número da Área "1" em uso, objetivando exclusão de Área.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', '1')
      end

      And('Clico em Buscar_06 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de Excluir_06 objetivando exclusão de Área.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end      
      
      Then ('Validar a mensagem apresentada ao usuário_06 objetivando exclusão de Área.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
        expect(find('#divIdBodyBusinessError')).to have_content '- Esta Área está em uso no sistema e não pode ser excluída'
        sleep 0.3
      end

    @verifyMessageDeteleArea
      Given ('Desmarco a flag 10 últimas atualizações_07 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Que eu faça a busca e encontre a Área cadastrada pela automação_07 objetivando exclusão de Área.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_EDIT_DESCRIPTION)
      end

      And('Clico em Buscar_07 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de Excluir_07 objetivando exclusão de Área.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end      
      
      Then ('Validar a mensagem apresentada ao usuário_07 objetivando exclusão de Área.') do
        expect(page).to have_content('Confirma a exclusão?')
        sleep 0.3
      end

    @deteleSuccessArea
      Given ('Desmarco a flag 10 últimas atualizações_08 objetivando exclusão de Área.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Preencha o textbox com um número da Área que foi inserida pela automação_08 objetivando exclusão de Área.') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlSearchField', 'Descrição')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_EDIT_DESCRIPTION)
      end

      And('Clico em Buscar_08 objetivando exclusão de Área.') do
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de Excluir_08 objetivando exclusão de Área.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end      
      
      And('Ao ser exibida a mensagem clicar em "Sim" objetivando exclusão de Área.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
        sleep 0.3
      end

      And('Validar se a Área foi excluída.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
        sleep 0.3
      end