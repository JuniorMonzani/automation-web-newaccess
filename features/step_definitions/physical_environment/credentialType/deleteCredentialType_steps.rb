require 'login/login'
require 'physical_environment/credentialType/CredentialType'
require 'common/findElements'
require 'common/constants'

  credentialType = CredentialType.new
  findElements = FindElements.new
  login = Login.new
  #$password = login.receive_Correct_Pass

  @background
    Given('Que estou na tela que lista os Tipos de Credencial cadastradas para realizar exclusões.') do
      credentialType.visit_List_Credential_Type
      login.make_Login('admin', $password.to_s)
    end

    @verifyValuesAuthenticationDeleteCredentialType
      Given('Obter todos os valores do dropbox "Autenticação" na tela de exclusão de tipo de credencial e comparar com os valores esperados.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        $valueCredentialType = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlAuthenticationTypeSearch', $DELETE_CREDENTIAL_TYPE_AUTHENTICATION)
      end

      Then('Deve conter todos os valores esperados no campo "Autenticação" na tela de exclusão.') do
        expect($valueCredentialType).to be_truthy
      end

    @verifyMessageDeleteCredentialType
      Given ('Que eu faça a busca para validar a mensagem de exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no botão Excluir para validação da mensagem de exclusão de um Tipo de Credencial.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Deve ser apresentada uma validação correspondente a mensagem esperada, indicando exclusão de Tipo de Credencial contendo os botões "Sim" e "Não" para a exclusão do Tipo de Credencial, conforme esperado.') do
        expect(page).to have_content('Confirma a exclusão?')
        sleep 0.3
      end

    @verifyDeletionCredentialType
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não existe no sistema.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Credencial Não Existe')
        click_button 'Buscar'
        sleep 0.3
      end

      Then ('Não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    @confirmDeleteCredentialTypePerson
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial Pessoa.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Pessoa.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Pessoa.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
      end

    @confirmDeleteCredentialTypeVisitor
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial Credencial.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Visitante')
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Visitante.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Visitante.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
      end

    @confirmDeleteCredentialTypeCredential
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial Visitante.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Credencial')
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Credencial.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Credencial.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
      end

    @confirmDeleteCredentialTypeMaxSize
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial com quantidade máxima de caracteres no campo descrição.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', $REGISTER_CREDENTIAL_TYPE_MAX_DESCRIPTION)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial com quantidade máxima de caracteres no campo descrição.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial com quantidade máxima de caracteres no campo descrição.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
      end

    @verifyMessageDeleteCredentialTypeInUse
      Given ('Que eu faça a busca e tente efetuar exclusão de um Tipo de Credencial que esteja sendo usado no sistema.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Pessoa')
        click_button 'Buscar'
        sleep 0.3
      end

      And ('Clicar no ícone de exclusão.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      When ('Apresentar uma validação correspondente a mensagem esperada, indicando exclusão de Tipo de Credencial.') do
        expect(page).to have_content('Confirma a exclusão?')
        sleep 0.3
      end

      Then ('Clicar em "Sim" para confirmar exclusão.') do
        click_button 'Sim'
        expect(find('#divIdBodyBusinessError')).to have_content '- O Tipo de Credencial está em uso no sistema e não pode ser excluído'
        sleep 0.3
      end