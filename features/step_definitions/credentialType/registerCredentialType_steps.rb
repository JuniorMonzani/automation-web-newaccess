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
    
    @verifyValuesAuthenticationRegisterCredentialType
      Given('Obter todos os valores do dropbox "Autenticação" na tela de cadastro de tipo de credencial e comparar com os valores esperados.') do
        $valueCredentialType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', $REGISTER_CREDENTIAL_TYPE_AUTHENTICATION)
      end

      Then('Deve conter todos os valores esperados no campo "Autenticação" na tela de cadastro.') do
        expect($valueCredentialType).to be_truthy
      end
      
    @saveWithPersonAuthenticationCredentialType
      Given('Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Pessoa".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Pessoa')
      end

      Given('Selecionar o "Pessoa" como "Autenticação".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Pessoa')
      end

      When('Clicar no botão "Salvar" para incluir o tipo de credencial "Pessoa".') do
        click_button 'Salvar'
        sleep 1
      end
      
      Then('O Tipo de Credencial com autenticação "Pessoa" deve ser salvo com sucesso.') do
        expect(page).to have_content('Cadastro de Tipo de Credencial')
      end
    
    @saveWithVisitorAuthenticationCredentialType  
      Given('Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Visitante".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Visitante')
      end

      Given('Selecionar o "Visitante" como "Autenticação".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Visitante')
      end

      When('Clicar no botão "Salvar" para incluir o tipo de credencial "Visitante".') do
        click_button 'Salvar'
        sleep 1
      end

      Then('O Tipo de Credencial com autenticação "Visitante" deve ser salvo com sucesso.') do
        expect(page).to have_content('Cadastro de Tipo de Credencial')
      end
    
    @saveWithCredentialAuthenticationCredentialType
      Given('Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Credencial".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Credencial')
      end
      
      Given('Selecionar o "Credencial" como "Autenticação".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Credencial')
      end

      When('Clicar no botão "Salvar" para incluir o tipo de credencial "Credencial".') do
        click_button 'Salvar'
        sleep 1
      end

      Then('O Tipo de Credencial com autenticação "Credencial" deve ser salvo com sucesso.') do
        expect(page).to have_content('Cadastro de Tipo de Credencial')
      end

    @fieldDescriptionMaxSizeCredentialType  
      Given('Que eu tente preencher o campo obrigatório "Descrição" na tela de cadastro de tipo de credencial informando 55 caracteres alfanuméricos.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação'.ljust(55, 'X'))
      end
      
      Then('Clicando em "Salvar" o campo "Descrição" deve ser preenchido com 50 caracteres que é a quantidade máxima permitida no cadastro de o Tipo de Credencial.') do
        click_button 'Salvar'
      end