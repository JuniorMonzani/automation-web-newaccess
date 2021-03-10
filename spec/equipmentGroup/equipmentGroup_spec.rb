describe 'Realiza o login e acessa a página de cadastro de Grupo de equipamento', :equipmentGroup do
  context 'Realizando login no sistema e fazendo testes diversos na tela de Configuração do sistema' do
    before(:each) do
      visit 'http://laboratorio.mdacesso.com.br/Groups/EquipmentGroupsLst.aspx'
      sleep 1
      fill_in      'txtUsrLogin',      with: 'admin'
      fill_in      'txtUserPassLogin', with: 'madis2020@'
      click_button 'Submit1'
      sleep 2
      click_button 'Cadastrar'
      sleep 1
    end

    it 'Associando e desassociando equipamentos ao grupo', :associatedEquipment do
      puts 'Encontrando um equipamento no grupo de "disponíveis" e selecionando-o'
      select('2 - FaceAccessII', from: 'MainContentMainMaster_MainContent_lstEquipment_lstLeft')
      sleep 1

      puts 'Clicando no botão que associa um equipamento disponível ao grupo'
      find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToRight').click
      sleep 1

      puts 'Encontrando um equipamento no grupo de "associados ao grupo" e selecionando-o'
      select('2 - FaceAccessII', from: 'MainContentMainMaster_MainContent_lstEquipment_lstRight')
      sleep 1

      puts 'Clicando no botão que desassocia um equipamento associado ao grupo'
      find('#MainContentMainMaster_MainContent_lstEquipment_btnTransferToLeft').click
      sleep 1
    end

    after(:each) do
      sleep 1
    end
  end
end
