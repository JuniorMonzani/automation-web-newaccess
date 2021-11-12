require 'login/login'
require 'physical_environment/credentialType/CredentialType'
require 'common/findElements'
require 'common/constants'

  credentialType = CredentialType.new
  findElements = FindElements.new
  login = Login.new
  #$password = login.receive_Correct_Pass

  @background
    Given('Que estou na tela que lista os Tipos de Credencial cadastradas para realizar alterações.') do
      credentialType.visit_List_Credential_Type
      login.make_Login('admin', $password.to_s)
    end
  
    @verifyEditCredentialType
      Given('Que eu faça a busca e encontre o grupo de credenciais cadastradas pela Automação Pessoa.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de alteração do tipo de credencial Automação Pessoa.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Deve direcionar para a página de alteração de tipo de credencial Automação Pessoa.') do
        expect(page).to have_content('Alterar Tipo de Credencial')
      end
  
    @verifyDescriptionMaxSizeCredentialType
      Given ('Que eu faça a busca e encontre o tipo de credencial cadastrada com a quantidade máxima de caracteres permitidos no campo "Descrição" sendo 50 caracteres.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', $REGISTER_CREDENTIAL_TYPE_MAX_DESCRIPTION)
        click_button 'Buscar'
        sleep 0.3
      end

      Then ('Deve ser apresentado 50 caracteres no campo Descrição do Tipo de Credencial que corresponde ao valor máximo esperado.') do
        within('table tbody tr', text: 'AutomaçãoXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        @texto = find('td[align="center"]', text: 'AutomaçãoXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        # puts @texto.size
      end
  
      @verifyAuthenticationPersonCredentialType
        Given ('Que faça a busca e encontre um Tipo de Credencial com autenticação em "Pessoa".') do
          uncheck('MainContentMainMaster_chkLastTenModified')
          findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
          click_button 'Buscar'
          sleep 0.3
        end

        When ('Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Pessoa".') do
          page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
          sleep 0.3
        end
        
        Then ('Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Pessoa".') do
          expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Pessoa'
        end
  
      @verifyAuthenticationVisitorCredentialType
        Given ('Que faça a busca e encontre um Tipo de Credencial com autenticação em "Visitante".') do
          uncheck('MainContentMainMaster_chkLastTenModified')
          findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Visitante')
          click_button 'Buscar'
          sleep 0.3
        end

        When ('Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Visitante".') do
          page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
          sleep 0.3
        end
  
        Then ('Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Visitante".') do
          expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Visitante'
        end
  
      @verifyAuthenticationCredentialCredentialType
        Given ('Que faça a busca e encontre um Tipo de Credencial com autenticação em "Credencial".') do
          uncheck('MainContentMainMaster_chkLastTenModified')
          findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Credencial')
          click_button 'Buscar'
          sleep 0.3
        end

        When ('Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Credencial".') do
          page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
          sleep 0.3
        end

        Then ('Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Credencial".') do
          expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Credencial'
        end
    
      @saveAlreadyExistsCredentialType
        Given ('Que eu insira uma descrição que já existe, faça a busca e encontre um grupo de credenciais já existente que foi cadastrada pela Automação Pessoa.') do
          uncheck('MainContentMainMaster_chkLastTenModified')
          findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
          click_button 'Buscar'
          sleep 0.3
        end

        When ('Clicar no botão "Salvar" para validação de Tipo de Credencial já existente.') do
          page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
          sleep 0.3
          findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Visitante')
          click_button 'Salvar'
          sleep 0.3
        end

        Then ('Deve ser apresentada uma validação correspondente a mensagem esperada, indicando que o Tipo de Credencial já existe.') do
          expect(find('#divIdBodyBusinessError')).to have_content '- O Tipo de Credencial de descrição Automação Visitante já existe no sistema'
        end