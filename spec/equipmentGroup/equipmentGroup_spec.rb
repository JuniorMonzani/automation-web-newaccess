require "./login/login.rb"
require "./equipmentGroup/equipmentGroup.rb"
require "./commom/findElements.rb"
require "./commom/constants.rb"

describe 'Realiza o login e acessa a página de cadastro de Grupo de equipamento', :equipmentGroup do
  login = Login.new
  equipmentGroup = EquipmentGroup.new
  findElements = FindElements.new

  before(:each) do
    equipmentGroup.visit_Register_Equipment_Group
    login.make_Login('admin', "#{$password}")
  end

  it 'Validações do campo "Número"', :fieldNumberRequired do
    equipmentGroup.fills_In_Equipment_Group('teste','Teste de automação','1','2', false, true, false)
    equipmentGroup.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Número" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe o Número']")
  end

  it 'Valida obrigatoriedade do campo "Descrição"', :fieldDescriptionRequired do
    equipmentGroup.fills_In_Equipment_Group(9999,'','1','2', false, true, false)
    equipmentGroup.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Descrição" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
  end

  it 'Valida obrigatoriedade do campo "Área de origem"', :fieldOriginAreaRequired do
    equipmentGroup.fills_In_Equipment_Group(9999,'Teste de Autormação','','2', false, true, false)
    equipmentGroup.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Área de origem" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Área origem']")
  end

  it 'Valida obrigatoriedade do campo "Área de destino"', :fieldDestinationAreaRequired do
    equipmentGroup.fills_In_Equipment_Group(9999,'Teste de Autormação','1','', false, true, false)
    equipmentGroup.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Área de destino" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
  end

  it 'Valida obrigatoriedade de equipamento associado', :fieldEquipmentRequired do
    equipmentGroup.fills_In_Equipment_Group(9999,'Teste de Autormação','1','2', false, true, false)
    click_button 'Salvar'
    sleep 1
    puts('Valida obrigatoriedade de equipamento associado')
    puts('Valida a mensagem de retorno ao usuário')
    expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'   
  end

  it 'Valida os valores contidos no dropbox Fuso horário', :verifyValuesTimeZone do
    puts 'Valida os valores contidos no dropbox Fuso horário'
    values = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTimeZone', $TIME_ZONE)
    expect(values).to be_truthy
  end
end

