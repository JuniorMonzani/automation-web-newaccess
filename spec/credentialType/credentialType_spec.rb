require "login/login"
require "credentialType/CredentialType"
require "commom/findElements"
require "commom/constants"

describe 'Realiza testes na página de Tipo de Credencial.', :credentialType do
  login = Login.new
  credentialType = CredentialType.new
  findElements = FindElements.new

  before(:each) do
    credentialType.visit_Register_Credential_Type
    login.make_Login('admin', "#{$password}")
  end

  context 'Valida obrigatoriedade nos campos:' do
    it 'Descrição', :fieldDescriptionRequiredCredentialType do
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
  
  after(:each) do
    sleep 1
  end
end