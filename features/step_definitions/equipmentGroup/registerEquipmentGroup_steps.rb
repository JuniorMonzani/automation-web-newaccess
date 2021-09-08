require 'login/login'
require 'equipmentGroup/equipmentGroup'
require 'commom/findElements'
require 'commom/constants'

    login = Login.new
    $password = login.receive_Correct_Pass

    equipmentGroup = EquipmentGroup.new
    findElements = FindElements.new

  @background
    Given('que estou na tela de cadastro de Grupo de Equipamento') do
        equipmentGroup.visit_Register_Equipment_Group
        login.make_Login('admin', $password.to_s)
    end
            
  @verifyLabelsEquipmentGroup
    Given('que eu verifico e comparo todos os resources dos campos apresentados na tela.') do
        expect(page).to have_content('Número')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Área origem')
        expect(page).to have_content('Área destino')
        expect(page).to have_content('Fuso horário')
        expect(page).to have_content('Controla acesso de veículos')
        expect(page).to have_content('Grupo tem área de destino')
        expect(page).to have_content('Respeita horário de verão')
        expect(page).to have_content('Controla sorteio')
        expect(page).to have_content('Horário de verão')
        expect(page).to have_content('Data inicial (dd/mm/aaaa)')
        expect(page).to have_content('Data final (dd/mm/aaaa)')
        expect(page).to have_content('Equipamentos')
        expect(page).to have_content('Portas')
        expect(page).to have_content('Selecione os equipamentos')
    end

  
  @fieldNumberRequiredEquipmentGroup
    Given('informo alfanumérico no campo Número e preencho corretamente todas os outros campos necessários para efetuar o cadastro') do
        equipmentGroup.fills_In_Equipment_Group('teste', 'Teste de automação', '1', '2', false, true, false)
        equipmentGroup.associates_Equipment('6 - Concentradora 1')
      end
    
      When('eu clico no botão Salvar') do
        click_button 'Salvar'
      end
    
      Then('deve existgir uma validação no campo Número pois o mesmo é obrigatório e só aceita numérico') do
        sleep 0.3
        expect(page).to have_selector("input[oldtitle='Informe o Número']")
      end