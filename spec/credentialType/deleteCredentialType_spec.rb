require "login/login"
require "credentialType/CredentialType"
require "commom/findElements"
require "commom/constants"

describe 'Realiza testes de busca e exclusão na página que lista os Tipos de Credencial.', :deleteCredentialType do
  login = Login.new
  credentialType = CredentialType.new
  findElements = FindElements.new

  before(:each) do
    credentialType.visit_List_Credential_Type
    login.make_Login('admin', "#{$password}")
  end

  context 'Valida mensagens e exclusão de Tipo de Credencial:' do
    it 'Valida mensagem de exclusão de tipo de credencial fora de uso no sistema.', :verifyMessageDeleteCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
      sleep 0.3
      expect(page).to have_content('Confirma a exclusão?')
    end

    it 'Valida exclusão de tipo de credencial fora de uso no sistema.', :deleteCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Automação Pessoa')
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_CredentialType_IMG_BUTTON_DELETE_0"]').click
      sleep 0.3
      expect(page).to have_content('Confirma a exclusão?')
      click_button 'Sim'
    end

    it 'Valida tentativa de exclusão de tipo de credencial já excluida.', :verifyDeletionCredentialType do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch', 'Excluindo')
      click_button 'Buscar'
      sleep 0.3
      expect(page).to have_content('Nenhum resultado foi encontrado')
    end
  end
end