require 'login/login'
require 'common/findElements'
require 'people/vehicle/vehicleElements'

login = Login.new
findElements = FindElements.new
vehicleElements = Vehicle.new


#@verifyFirstMessageForExclusionVehicle
Given('Que faça a pesquisa pelo veículo alterado pela automação {string}') do |placa|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set placa
    click_button 'Buscar'
    sleep 2
  end
  
  When('Clicar para excluir o veículo alterado pela automação: {string}.') do |string|
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0').click
  end
  
  Then('Uma mensagem deve ser apresentada na tela de exclusão de veículo: {string}') do |msg|
    expect(page).to have_content(msg)
  end
  
  When('Na mensagem apresentada clicar no botão {string}.') do |nao|
    click_button(value: nao)
  end
  
  Then('Deve ver o veículo {string} cadastrada ainda.') do |placa|
    expect(page).to have_content(placa)
  end
  
  Then('Deve ver a mensagem na tela: {string}.') do |mensagem|
    msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li').text
    expect(msg).to eql mensagem
  end
  
  When('Clicar para excluir o veículo alterado pela automação {string}.') do |string|
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0').click
    sleep 3
  end
  
  When('Na mensagem de confirmação apresentada clicar no botão {string}.') do |sim|
    click_button(value: sim)
  end
  
  Then('Deve ver a mensagem na tela: {string}') do |msg|
    expect(page).to have_content(msg)
  end