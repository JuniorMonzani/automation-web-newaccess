#22
require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que estou na tela que lista os Grupos de Equipamentos cadastrados para realizar alterações.') do
        equipmentGroup.visit_List_Equipment_Group
        login.make_Login('admin', $password)
    end

    @verifyEditEquipmentGropup
      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_01.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração do grupo de equipamento_01.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end
    
      Then('Deve direcionar para a página de alteração de grupo de equipamento.') do
        expect(page).to have_content('Alterar Grupo de Equipamento')
      end

    @verifyFieldNumberDisabled
      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_02.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração do grupo de equipamento_02.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end
        
      Then('Na tela de alteração eu verifico o campo Número e o mesmo deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtNumber').disabled?).to be(true)
      end

    @verifyFieldOriginAreaDisabled
      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_03.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração do grupo de equipamento_03.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end
        
      Then('Na tela de alteração eu verifico o campo Área origem e o mesmo deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtOriginArea').disabled?).to be(true)
      end

    @verifyFieldDestinationAreaDisabled
      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_04.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração do grupo de equipamento_04.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end
        
      Then('Na tela de alteração eu verifico o campo Área destino e o mesmo deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtDestinationArea').disabled?).to be(true)
      end

    @verifyFieldGroupHasDestinationAreaDisabled
        Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_05.') do
          uncheck('MainContentMainMaster_chkLastTenModified')
          findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
          click_button 'Buscar'
          sleep 0.3 
        end
  
        When('Eu clico no ícone de alteração do grupo de equipamento_05.') do
          page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
          sleep 0.3
        end
          
        Then('Na tela de alteração eu verifico o campo Grupo tem área destino e o mesmo deve estar desabilitado.') do
          expect(find('#chkHasDestinationArea').disabled?).to be(true)  
        end

    @editSuccessEquipmentGroup
      Given('Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_06.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração do grupo de equipamento_06.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end
      
      When('Na tela de alteração eu altero a Descrição do grupo de equipamentos.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtDescription','Grupo alterado - Teste automação')
        sleep 0.3
      end
    
      When('Desassocio o equipamento 6 - Concentradora.') do
        equipmentGroup.desassociated_Equipment('6 - Concentradora 1')
        sleep 0.3
      end

      When('Associo o equipamento 101 - Câmera.') do
        equipmentGroup.associates_Equipment('101 - Camera')
        sleep 0.3
      end

      When('Clico em Salvar.') do
        click_button 'Salvar'
      end

      When('Que eu faça a busca utilizando a nova Descrição do grupo de equipamentos.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 'Grupo alterado - Teste automaç')
        click_button 'Buscar'
      end

      Then('O sistema deve retornar o grupo de equipamentos alterado.') do
        expect(page).to have_content('Grupo alterado - Teste automaç')
      end