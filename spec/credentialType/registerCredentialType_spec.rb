require "login/login"
require "credentialType/CredentialType"
require "commom/findElements"
require "commom/constants"

describe 'Realiza testes de cadastro na página de Tipo de Credencial.', :registerCredentialType do
  login = Login.new
  credentialType = CredentialType.new
  findElements = FindElements.new

  before(:each) do
    credentialType.visit_Register_Credential_Type
    login.make_Login('admin', "#{$password}")
  end

  context 'Valida os resources da tela:' do
    it 'Valida resource "Descrição"', :verifyLabelsCredentialType do
      expect(page).to have_content('Descrição')
    end

    it 'Valida resource "Autenticação"', :verifyLabelsCredentialType do
      expect(page).to have_content('Autenticação')
    end
  end

  context 'Valida obrigatoriedade nos campos:' do
    it 'Validação de quantidade máxima de caracteres no campo "Descrição"', :fieldDescriptionMaxSizeCredentialType do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Hello'.ljust(55, '123*'))
      click_button 'Salvar'
    end

    it 'Validação de obrigatoriedade no campo "Descrição"', :fieldDescriptionRequiredCredentialType do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', '')
      click_button 'Salvar'
      expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
    end
  end

  context 'Valida os valores contidos no dropbox:' do
    it 'Autenticação', :verifyValuesAuthenticationCredentialType do
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', $CREDENTIAL_TYPE_AUTHENTICATION)
      expect(values).to be_truthy
    end
  end
  
  context 'Salva um tipo de credencial com sucesso' do
    it 'Preenche todos os campos necessários e salva o Tipo de Credencial com sucesso', :registerCredentialTypeSuccess do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Teste de automação')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Pessoa')
      click_button 'Salvar'
      sleep 1
      expect(page).to have_content('Cadastro de Tipo de Credencial')
    end
  
    it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "pessoa" com sucesso', :saveCredentialTypeWithPersonAuthentication do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Tipo Pessoa')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Pessoa')
      click_button 'Salvar'
      sleep 1
      expect(page).to have_content('Cadastro de Tipo de Credencial')
    end

    it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "visitante" com sucesso', :saveCredentialTypeWithVisitorAuthentication do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Tipo Visitante')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Visitante')
      click_button 'Salvar'
      sleep 1
      expect(page).to have_content('Cadastro de Tipo de Credencial')
    end

    it 'Preenche todos os campos necessários e salvar o Tipo de Credencial como "credencial" com sucesso', :saveCredentialTypeWithCredentialAuthentication do
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Tipo Credencial')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication', 'Credencial')
      click_button 'Salvar'
      sleep 1
      expect(page).to have_content('Cadastro de Tipo de Credencial')
    end
  end

  after(:each) do
    sleep 1
  end
end