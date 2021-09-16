require 'login/login'
require 'credentialType/CredentialType'
require 'commom/findElements'
require 'commom/constants'

  credentialType = CredentialType.new
  findElements = FindElements.new
  login = Login.new
  $password = login.receive_Correct_Pass

  @background
    Given('Que o usuário esteja na página de cadastro de Tipo de Credencial.') do
      credentialType.visit_Register_Credential_Type
      login.make_Login('admin', $password.to_s)
    end

    @verifyLabelsCredentialType
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de tipo de credencial.') do
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Autenticação')
      end

    @fieldDescriptionRequiredCredentialType
      Given('Não preencher o campo "Descrição" e preencher corretamente todos os outros campos necessários para efetuar o cadastro de tipo de credencial.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', '')
      end

      When('Clicar no botão Salvar para validação do campo "Descrição".') do
        click_button 'Salvar'
      end

      Then('Deve existir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado.') do
        sleep 0.5
        expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
      end
    
    @verifyValuesAuthenticationCredentialType
      Given('Obter todos os valores do dropbox "Autenticação" na tela de cadastro de tipo de credencial e comparar com os valores esperados.') do
        $valueCredentialType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', $CREDENTIAL_TYPE_AUTHENTICATION)
      end

      Then('Deve conter todos os valores esperados no campo "Autenticação".') do
        expect($valueCredentialType).to be_truthy
      end
      
    # context 'Salva um tipo de credencial com sucesso' do
    #   it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "pessoa" com sucesso', :saveCredentialTypeWithPersonAuthentication do
    #     findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Pessoa')
    #     findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Pessoa')
    #     click_button 'Salvar'
    #     sleep 1
    #     expect(page).to have_content('Cadastro de Tipo de Credencial')
    #   end
    
    #   it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "visitante" com sucesso', :saveCredentialTypeWithVisitorAuthentication do
    #     findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Visitante')
    #     findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Visitante')
    #     click_button 'Salvar'
    #     sleep 1
    #     expect(page).to have_content('Cadastro de Tipo de Credencial')
    #   end
    
    #   it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "credencial" com sucesso', :saveCredentialTypeWithCredentialAuthentication do
    #     findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Credencial')
    #     findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Credencial')
    #     click_button 'Salvar'
    #     sleep 1
    #     expect(page).to have_content('Cadastro de Tipo de Credencial')
    #   end    
    # end
    
    # it 'Validação de quantidade máxima de caracteres no campo "Descrição"', :fieldDescriptionMaxSizeCredentialType do
    #   findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação'.ljust(55, 'X'))
    #   click_button 'Salvar'
    # end
  #  end