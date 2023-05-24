require 'login/login'
require 'access_environment/TimeSlot/timeSlot'
require 'common/findElements'

timeSlot = TimeSlot.new
login = Login.new
findElements = FindElements.new

#background
Given('Que o usuário esteja na página que lista as Faixas horárias objetivando exclusão.') do
    timeSlot.visit_EditTimeSlot
    login.make_Login
  end
  
  #@verifyMessageDeteleTimeSlotInUse
  Given('Desmarco a flag {string} objetivando exclusão de Faixa horária.') do |string|
    find("input[type='checkbox']").set false
  end
  
  Given('Eu preencho o textbox com um número da Faixa horária {string} em uso, objetivando exclusão de Faixa horária.') do |valor|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set valor
  end
  
  Given('Clico em {string} objetivando exclusão de Faixa horária.') do |buscar|
    click_button 'Buscar'
    sleep 3
  end
  
  When('Eu clico no ícone de Excluir objetivando exclusão de Faixa horária.') do
    click_button 'ctl00$ctl00$MainContentMainMaster$MainContent$gridView$ctl02$IMG_BUTTON_DELETE'
  end

  When('Confirmo a exclusão') do
    click_button(value: 'Sim')
  end
  
  Then('Validar a mensagem apresentada: {string}') do |mensagem|
    msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li').text
    expect(msg).to eql mensagem
  end
  
  
  #@verifyMessageDeteleTimeSlot
  Given('Que eu faça a busca pelo código {string} objetivando exclusão de Faixa horária.') do |valor|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set valor
  end
  
  Then('Devo ver a seguinte mensagem: {string}.') do |mensagem|
    expect(page).to have_content(mensagem) 
  end

  #@deteleSuccessTimeSlot
  Given('Que eu faça a busca pela faixa {string} cadastrada pela automação objetivando exclusão de Faixa horária.') do |valor|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set valor
  end
  
  When('Ao ser exibida a mensagem clicar em {string} objetivando exclusão de Feixa horária.') do |string|
    click_button(value: 'Sim')
  end
  
  Then('A seguinte mensagem será exibida: {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end