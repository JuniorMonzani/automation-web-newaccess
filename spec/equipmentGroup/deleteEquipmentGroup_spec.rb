require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes de busca e exclusão na página que lista os Grupos de equipamentos.', :deleteEquipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new
  
  before(:each) do
    equipmentGroup.visit_List_Equipment_Group
    login.make_Login('admin', $password.to_s)
  end

  context 'Valida os valores contidos nos dropbox:' do
    it 'Filtro de pesquisa.', :verifyValuesFilterSearchEquipmentGroup do
      #desmarcando o checkbox de 10 últimas atualizações
      uncheck('MainContentMainMaster_chkLastTenModified')
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', $FILTER_SEARCH_EQUIPMENT_GROUP)
      expect(values).to be_truthy
    end
  end

  context 'Valida cenários de busca por Grupo de Equipamento:' do
    it 'Número do Grupo de Equipamento - Inexistente.', :searchByNumberNotExsist do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 999)
        click_button 'Buscar'
        expect(page).to have_content('Nenhum resultado foi encontrado')
    end

    it 'Número do Grupo de Equipamento - Existente.', :searchByNumberExsist do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        expect(page).to have_content('Grupo alterado - Teste automaç')
    end
    
    it 'Descrição do Grupo de Equipamento - Inexistente.', :searchByDescriptionNotExsist do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        expect(page).to have_content('Nenhum resultado foi encontrado')
    end

    it 'Descrição do Grupo de Equipamento - Existente.', :searchByDescriptionExsist do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch', 'Descrição')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 'Grupo alterado - Teste automaç')
        click_button 'Buscar'
        expect(page).to have_content('Grupo alterado - Teste automaç')
    end
  end

  context 'Valida mensagem e exclusão de Grupo de Equipamento:' do
    it 'Valida mensagem de exclusão de equipamento em uso no sistema.', :verifyMessageDeteleEquipmentGropupIsInUse do
      uncheck('MainContentMainMaster_chkLastTenModified')
      findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 1)
      click_button 'Buscar'
      sleep 0.3
      page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
      sleep 0.3
      click_button 'Sim'
      expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos está em uso no sistema e não pode ser excluído'
  end

    it 'Valida mensagem de exclusão.', :verifyMessageDeteleEquipmentGropup do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
        sleep 0.5
        expect(page).to have_content('Confirma a exclusão?')
    end

    it 'Valida exclusão do Grupo de Equipamento.', :deteleSuccessEquipmentGroup do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtGroupSearch', 123)
        click_button 'Buscar'
        sleep 0.3
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Group_IMG_BUTTON_DELETE_0"]').click
        sleep 0.3
        click_button 'Sim'
        expect(page).to have_content('Nenhum resultado foi encontrado')
    end
  end
end