require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes na página de Grupo de equipamento.', :equipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new

  before(:each) do
    equipmentGroup.visit_Register_Equipment_Group
    login.make_Login('admin', $password.to_s)
  end

  context 'Valida obrigatoriedade nos campos:' do
    it 'Número', :fieldNumberRequired do
      equipmentGroup.fills_In_Equipment_Group('teste', 'Teste de automação', '1', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      click_button 'Salvar'
      expect(page).to have_selector("input[oldtitle='Informe o Número']")
    end

    it 'Descrição', :fieldDescriptionRequired do
      equipmentGroup.fills_In_Equipment_Group(9999, '', '1', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      click_button 'Salvar'
      expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
    end

    it 'Área de origem', :fieldOriginAreaRequired do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      click_button 'Salvar'
      expect(page).to have_selector("input[oldtitle='Informe a Área origem']")
    end

    it 'Área de destino', :fieldDestinationAreaRequired do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      click_button 'Salvar'
      expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
    end

    it 'Equipamento associado', :fieldEquipmentRequired do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '2', false, true, false)
      click_button 'Salvar'
      sleep 1
      expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'
    end
  end

  context 'Valida os valores contidos nos dropbox:' do
    it 'Fuso horário', :verifyValuesTimeZone do
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTimeZone', $TIME_ZONE)
      expect(values).to be_truthy
    end

    it 'Controla sorteio', :fieldDestinationAreaDisabledHasDestinationArea do
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition',
                                                  $CONTROL_SORTITION_HAS_DESTINATION_AREA)
      expect(values).to be_truthy
    end

    it '"Controla sorteio" após desmarcar a flag "Grupo tem área de destino"',
       :verifyValuesControlSortitionNoHasDestinationArea do
      equipmentGroup.fills_In_Equipment_Group('', '', '', '', false, false, false)
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition',
                                                  $CONTROL_SORTITION_NO_HAS_DESTINATION_AREA)
      expect(values).to be_truthy
    end
  end

  context 'Salva um grupo de equipamento com sucesso' do
    it 'Preenche todos os campos necessários para salvar o Grupo de Equipamentos', :registerEquipmentGroupSuccess do
      equipmentGroup.fills_In_Equipment_Group('123', 'Teste de automação', '1', '2', true, true, true)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlTimeZone', '03:00')

      sleep 5
    end
  end
end
