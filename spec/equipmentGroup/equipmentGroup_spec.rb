require "./login/login.rb"
require "./equipmentGroup/equipmentGroup.rb"

describe 'Realiza o login e acessa a página de cadastro de Grupo de equipamento', :equipmentGroup do
  context 'Realizando login no sistema e fazendo testes diversos na tela de Configuração do sistema' do

    accessPage = EquipmentGroup.new
    login = Login.new

    before(:each) do
      accessPage.visitEquipmentGroup
      login.makeLogin('admin', "#{$password}")
    end

    it 'Associando e desassociando equipamentos ao grupo', :associatedEquipment do
      click_button 'Cadastrar'
      puts 'Encontrando um equipamento no grupo de "disponíveis" e selecionando-o'
      select('2 - FaceAccessII', from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
      sleep 1

      puts 'Clicando no botão que associa um equipamento disponível ao grupo'
      find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click

      puts 'Encontrando um equipamento no grupo de "associados ao grupo" e selecionando-o'
      select('2 - FaceAccessII', from: 'MainContentMainMaster_MainContent_lstEquipment_lstRight')
      sleep 1

      puts 'Clicando no botão que desassocia um equipamento associado ao grupo'
      find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToLeft').click
      sleep 1
    end
  end
end
