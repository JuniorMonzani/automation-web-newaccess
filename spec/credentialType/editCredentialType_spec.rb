require "login/login"
require "credentialType/CredentialType"
require "commom/findElements"
require "commom/constants"

describe 'Realiza testes de alteração de Tipo de Credencial.', :editCredentialType do
  login = Login.new
  credentialType = CredentialType.new
  findElements = FindElements.new

  before(:each) do
    credentialType.visit_List_Credential_Type
    login.make_Login('admin', $password.to_s)
  end

    it 'Valida o acesso a tela de Alteração de Tipo de Credencial', :verifyEditCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(page).to have_content('Alterar Tipo de Credencial')
    end

  context 'Valida quantidade máxima de caracteres nos campos' do
    it 'Validação quantidade máxima de caracteres (50) do campo "Descrição"', :verifyDescriptionMaxSizeCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', ('Automação'.ljust(55, 'X')))
      click_button 'Buscar'
      sleep 0.3
      within('table tbody tr', text: 'AutomaçãoXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') do
      @texto = find('td[align="center"]', text: 'AutomaçãoXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
      # puts @texto.size
      end
    end
  end  

  context 'Valida tipos de autenticação cadastrados' do
    it 'Valida cadastro de credencial com autenticação em pessoa', :verifyAuthenticationPersonCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Pessoa'
    end

    it 'Valida cadastro de credencial com autenticação em visitante', :verifyAuthenticationVisitorCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Visitante')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Visitante'
    end

    it 'Valida cadastro de credencial com autenticação em credencial', :verifyAuthenticationCredentialCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Credencial')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_ddlCredentialTypeAuthentication')).to have_content 'Credencial'
    end
  end
  
  context 'Valida tentativa de cadastro de tipo de credencial já existente' do
    it 'Preenche o campo descrição com um valor já existente para outro Tipo de Credencial', :saveAlreadyExistsCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      findElements.input_textbox('MainContentMainMaster_MainContent_txtCredentialTypeDescription', 'Automação Visitante')
      click_button 'Salvar'
      sleep 0.3
      expect(find('#divIdBodyBusinessError')).to have_content '- O Tipo de Credencial de descrição Automação Visitante já existe no sistema'
    end
  end
end