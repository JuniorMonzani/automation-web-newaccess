require 'login/login'
require 'physical_environment/credential/credential'
require 'common/findElements'
require 'common/constants'

  credential = Credential.new
  findElements = FindElements.new
  login = Login.new

  #background
    Given('Que o usuário esteja na página que lista as Credenciais para realizar exclusões.') do
      credential.visit_List_Credential
      login.make_Login
    end

    #verifyMessageAfterDeleteCredentialInUse
      Given ('Que eu busque e encontre a credencial de número "1" cadastrada.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', '1')
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Sim"_001.') do
        click_button 'Sim'
        sleep 1
      end

      Then ('A mensagem apresentada deve corresponder com a mensagem esperada.') do
        expect(find('#divIdBodyBusinessError')).to have_content '- Esta Credencial está em uso no sistema e não pode ser excluída'
      end

    #noDeleteCredential
      Given ('Que eu busque e encontre a credencial de número "1000" cadastrada_001.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_001.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Não".') do
        click_button 'Não'
        sleep 1
      end

      And ('Que eu busque e encontre a credencial de número "1000" cadastrada_002.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
        click_button 'Buscar'
        sleep 1
      end

      Then ('A credencial "1000" ainda deve estar cadastrada no sistema.') do
        expect(page).to have_content($REGISTER_CREDENTIAL_1000)
        expect(page).to have_content('Pessoa')
        expect(page).to have_content('Código de Barras')
        expect(page).to have_content('Liberada')
      end

    #verifyDeleteCredencial1000
      Given ('Que eu busque e encontre a credencial de número "1000" cadastrada_003.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_002.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Sim"_002.') do
        click_button 'Sim'
        sleep 1
      end

      And ('Que eu busque a credencial de número "1000".') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
        click_button 'Buscar'
        sleep 1
      end

      Then ('Validar a informação que o resultado não foi encontrado_001.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
        sleep 1
      end

    #verifyDeleteCredencial1001
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_003.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Sim"_003.') do
        click_button 'Sim'
        sleep 1
      end

      And ('Que eu busque a credencial de número "1001".') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 1
      end

      Then ('Validar a informação que o resultado não foi encontrado_002.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
        sleep 1
      end

    #verifyDeleteCredencial1002
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_004.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Sim"_004.') do
        click_button 'Sim'
        sleep 1
      end

      And ('Que eu busque a credencial de número "1002".') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 1
      end

      Then ('Validar a informação que o resultado não foi encontrado_003.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
        sleep 1
      end

    #verifyDeleteCredencial1003
      Given ('Que eu busque e encontre a credencial de número "1003" cadastrada.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_NUMBER_FROM)
        click_button 'Buscar'
        sleep 1
      end

      When ('Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_005.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0"]').click
        sleep 1
      end

      And ('Na mensagem apresentada, clicam em "Sim"_005.') do
        click_button 'Sim'
        sleep 1
      end

      And ('Que eu busque a credencial de número "1003".') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_NUMBER_FROM)
        click_button 'Buscar'
        sleep 1
      end

      Then ('Validar a informação que o resultado não foi encontrado_004.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
        sleep 1
      end