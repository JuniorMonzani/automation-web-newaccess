#19
require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes de alteração de Grupo de equipamentos.', :editEquipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  
  before(:each) do
    equipmentGroup.visit_List_Equipment_Group
    login.make_Login('admin', $password.to_s)
  end

    it 'Valida o acesso a tela de Alteração de Grupo de Equipamento', :verifyEditEquipmentGropup do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(page).to have_content('Alterar Grupo de Equipamento')
    end

  context 'Valida os campos desabilitados na alteração de Grupo de Equipamento, são eles:' do
    it 'Número', :verifyFieldNumberDisabled do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_txtNumber').disabled?).to be(true)
    end

    it 'Área origem', :verifyFieldOriginAreaDisabled do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_txtOriginArea').disabled?).to be(true)
    end

    it 'Área destino', :verifyFieldDestinationAreaDisabled do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#MainContentMainMaster_MainContent_txtDestinationArea').disabled?).to be(true)
    end

    it 'Grupo tem área destino', :verifyFieldGroupHasDestinationAreaDisabled do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      expect(find('#chkHasDestinationArea').disabled?).to be(true)
    end
  end

  context 'Valida alteração do gruppo:' do
    it 'Realiza alterações no Grupo de Equipamento', :editSuccessEquipmentGroup do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_EDIT_0"]').click
      sleep 0.3
      findElements.input_textbox('MainContentMainMaster_MainContent_txtDescription','Grupo alterado - Teste automação')
      equipmentGroup.desassociated_Equipment('6 - Concentradora 1')
      equipmentGroup.associates_Equipment('101 - Camera')
      click_button 'Salvar'
    end
  end
end