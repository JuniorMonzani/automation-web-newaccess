require "./login/login.rb"
require "./equipmentGroup/equipmentGroup.rb"

describe 'Realiza o login e acessa a página de cadastro de Grupo de equipamento', :equipmentGroup do
  accessPage = EquipmentGroup.new
  login = Login.new

  before(:each) do
    accessPage.visit_Register_Equipment_Group
    login.makeLogin('admin', "#{$password}")
  end

  it 'Validações do campo "Número"', :fieldNumberRequired do
    accessPage.fills_In_Equipment_Group('teste','Teste de automação','1','2', false, true, false)
    accessPage.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Número" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe o Número']")
  end

  it 'Valida obrigatoriedade do campo "Descrição"', :fieldDescriptionRequired do
    accessPage.fills_In_Equipment_Group(9999,'','1','2', false, true, false)
    accessPage.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Descrição" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
  end

  it 'Valida obrigatoriedade do campo "Área de origem"', :fieldOriginAreaRequired do
    accessPage.fills_In_Equipment_Group(9999,'Teste de Autormação','','2', false, true, false)
    accessPage.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Área de origem" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Área origem']")
  end

  it 'Valida obrigatoriedade do campo "Área de destino"', :fieldDestinationAreaRequired do
    accessPage.fills_In_Equipment_Group(9999,'Teste de Autormação','1','', false, true, false)
    accessPage.associates_Equipment('6 - Concentradora 1')
    click_button 'Salvar'
    puts('Valida se o campo "Área de destino" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe a Área destino']")
  end

  it 'Valida obrigatoriedade de equipamento associado', :fieldEquipmentRequired do
    accessPage.fills_In_Equipment_Group(9999,'Teste de Autormação','1','2', false, true, false)
    click_button 'Salvar'
    sleep 1
    puts('Valida obrigatoriedade de equipamento associado')
    puts('Valida a mensagem de retorno ao usuário')
    expect(find('#divIdBodyBusinessError')).to have_content '- O grupo de equipamentos tem que ser associado a um equipamento ou porta, pelo menos'   
  end



  # it 'Validações do campo "Número"', :fieldNumberRequired do
  #   #Valida se o campo não aceita alfanumérico, ficará em branco
  #   find('#MainContentMainMaster_MainContent_txtNumber').set 'Teste'
  #   #find('#MainContentMainMaster_MainContent_txtDescription').set 'Teste de Automação'
  #   find('#MainContentMainMaster_MainContent_txtOriginArea').set '1'
  #   find('#MainContentMainMaster_MainContent_txtDestinationArea').set '2'
  #   #Associa  o equipamento ao grupo
  #   select('6 - Concentradora 1', from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
  #   find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click
  #   click_button 'Salvar'

  #   #Valida se o campo 'Número' foi marcado como obrigatório
  #   puts('Valida se o campo "Número" foi marcado como obrigatório')
  #   expect(page).to have_selector("input[oldtitle='Informe o Número']")
  # end
end

