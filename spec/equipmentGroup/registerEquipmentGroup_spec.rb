require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

describe 'Realiza testes na página de cadastro de Grupo de equipamento.', :registerEquipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new

  before(:each) do
    equipmentGroup.visit_Register_Equipment_Group
    login.make_Login('admin', $password.to_s)
  end

  context 'Valida os resources da tela:' do
      it 'Valida resource "Número"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Número')
      end

      it 'Valida resource "Descrição"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Descrição')
      end

      it 'Valida resource "Área origem"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Área origem')
      end

      it 'Valida resource "Área destino"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Área destino')
      end

      it 'Valida resource "Fuso horário"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Fuso horário')
      end

      it 'Valida resource "Controla acesso de veículos"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Controla acesso de veículos')
      end

      it 'Valida resource "Grupo tem área de destino"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Grupo tem área de destino')
      end

      it 'Valida resource "Respeita horário de verão"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Respeita horário de verão')
      end

      it 'Valida resource "Controla sorteio"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Controla sorteio')
      end

      it 'Valida resource "Horário de verão"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Horário de verão')
      end

      it 'Valida resource "Data inicial (dd/mm/aaaa)"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Data inicial (dd/mm/aaaa)')
      end

      it 'Valida resource "Data final (dd/mm/aaaa)"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Data final (dd/mm/aaaa)')
      end

      it 'Valida resource da aba "Equipamentos"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Equipamentos')
      end

      it 'Valida resource da aba "Portas"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Portas')
      end

      it 'Valida resource "Selecione os equipamentos"', :verifyLabelsEquipmentGroup do
        expect(page).to have_content('Selecione os equipamentos')
      end
    end

  context 'Valida obrigatoriedade nos campos:' do
    it 'Número', :fieldNumberRequiredEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group('teste', 'Teste de automação', '1', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(page).to have_selector("input[oldtitle='Informe o Número']")
    end

    it 'Descrição', :fieldDescriptionRequiredEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group(9999, '', '1', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
    end

    it 'Área de origem', :fieldOriginAreaRequiredEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '', '2', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(page).to have_selector("input[oldtitle='Informe a Área origem']")
    end

    it 'Área de destino', :fieldDestinationAreaRequiredEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '', false, true, false)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
    end

    it 'Equipamento associado', :fieldEquipmentRequiredEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group(9999, 'Teste de Autormação', '1', '2', false, true, false)
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'
    end
  end

  context 'Valida os valores contidos nos dropbox:' do
    it 'Fuso horário', :verifyValuesTimeZoneEquipmentGroup do
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTimeZone', $TIME_ZONE)
      expect(values).to be_truthy
    end

    it 'Controla sorteio', :fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup do
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_HAS_DESTINATION_AREA)
      expect(values).to be_truthy
    end

    it '"Controla sorteio" após desmarcar a flag "Grupo tem área de destino"',
       :verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup do
      equipmentGroup.fills_In_Equipment_Group('', '', '', '', false, false, false)
      values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlControlSortition', $CONTROL_SORTITION_NO_HAS_DESTINATION_AREA)
      expect(values).to be_truthy
    end
  end

  context 'Salva um grupo de equipamento com sucesso' do
    it 'Preenche todos os campos necessários e salva o Grupo de Equipamentos com sucesso', :registerEquipmentGroupSuccess do
      equipmentGroup.fills_In_Equipment_Group('123', 'Teste de automação', '1', '2', true, true, true)
      equipmentGroup.associates_Equipment('6 - Concentradora 1')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlTimeZone', '03:00')
      findElements.select_option('#MainContentMainMaster_MainContent_ddlControlSortition', 'Área origem')
      findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightStartDate', '01/01/2025')
      findElements.input_textbox('MainContentMainMaster_MainContent_txtDaylightEndDate', '01/01/2030')
      sleep 0.3
      click_button 'Salvar'
      sleep 0.3
      expect(page).to have_content('Cadastro de Grupo de Equipamento')
    end
  end
end
