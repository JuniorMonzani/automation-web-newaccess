require "./login/login.rb"
require "./equipmentGroup/equipmentGroup.rb"

describe 'Realiza o login e acessa a página de cadastro de Grupo de equipamento', :equipmentGroup do
  accessPage = EquipmentGroup.new
  login = Login.new

  before(:each) do
    accessPage.visitEquipmentGroup
    login.makeLogin('admin', "#{$password}")
  end

  it 'Validações do campo "Número"', :fieldNumberRequired do
    #Valida se o campo não aceita alfanumérico, ficará em branco
    find('#MainContentMainMaster_MainContent_txtNumber').set 'Teste'
    find('#MainContentMainMaster_MainContent_txtDescription').set 'Teste de Automação'
    find('#MainContentMainMaster_MainContent_txtOriginArea').set '1'
    find('#MainContentMainMaster_MainContent_txtDestinationArea').set '2'
    #Associa  o equipamento ao grupo
    select('6 - Concentradora 1', from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
    find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click
    click_button 'Salvar'

    #Valida se o campo 'Número' foi marcado como obrigatório
    puts('Valida se o campo "Número" foi marcado como obrigatório')
    expect(page).to have_selector("input[oldtitle='Informe o Número']")
  end
  


  # it 'Associando e desassociando equipamentos ao grupo', :associatedEquipment do
  #   puts 'Encontrando um equipamento no grupo de "disponíveis" e selecionando-o'
  #   select('6 - Concentradora 1', from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
  #   sleep 1

  #   puts 'Clicando no botão que associa um equipamento disponível ao grupo'
  #   find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click

  #   puts 'Encontrando um equipamento no grupo de "associados ao grupo" e selecionando-o'
  #   select('2 - FaceAccessII', from: 'MainContentMainMaster_MainContent_lstEquipment_lstRight')
  #   sleep 1

  #   puts 'Clicando no botão que desassocia um equipamento associado ao grupo'
  #   find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToLeft').click
  #   sleep 1
  # end
end

