require 'login/login'
require 'credentialType/CredentialType'
require 'commom/findElements'
require 'commom/constants'

  credentialType = CredentialType.new
  findElements = FindElements.new
  login = Login.new
  #$password = login.receive_Correct_Pass

  @background
    Given('Que estou na tela que lista os Tipos de Credencial cadastradas para realizar exclusões.') do
      credentialType.visit_List_Credential_Type
      login.make_Login('admin', $password.to_s)
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
    
    @confirmDeleteCredentialTypePerson
      Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
      end

      Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.') do
        expect(page).to have_content('Confirma a exclusão?')
        click_button 'Sim'
      end

    # @confirmDeleteCredentialTypeCredential
    #   Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.') do
    #     uncheck('MainContentMainMaster_chkLastTenModified')
    #     findElements.input_textbox        ('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Credencial')
    #     click_button 'Buscar'
    #     sleep 0.3
    #   end

    #   When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.') do
    #     page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
    #     sleep 0.3
    #   end

    #   Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.') do
    #     expect(page).to have_content('Confirma a exclusão?')
    #     click_button 'Sim'
    #   end

    # @confirmDeleteCredentialTypeVisitor
    #   Given ('Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.') do
    #     uncheck('MainContentMainMaster_chkLastTenModified')
    #     findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Visitante')
    #     click_button 'Buscar'
    #     sleep 0.3
    #   end

    #   When ('Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.') do
    #     page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
    #     sleep 0.3
    #   end

    #   Then ('Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.') do
    #     expect(page).to have_content('Confirma a exclusão?')
    #     click_button 'Sim'
    #   end