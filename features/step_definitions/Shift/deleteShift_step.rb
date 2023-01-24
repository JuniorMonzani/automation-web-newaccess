require 'login/login'
require 'common/findElements'
require 'shift/shiftElements'

login = Login.new
findElements = FindElements.new
shiftElements = Shift.new

#@verifyFirstMessageForExclusion
When('Clicar para excluir o turno.') do
    click_button 'MainContentMainMaster_MainContent_gv_Turn_IMG_BUTTON_DELETE_0'
  end
  
  Then('Uma mensagem deve ser apresentada ao usuário: {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end
  
  #@verifySecondMessageForExclusion
  Given('Procure e encontre o turno {int}.') do |int|
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]').select 'Número'
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_txtTurnSearch"]').set 1
    click_button 'Buscar'
  end
     
  When('Na mensagem apresentada clicar no botão Sim.') do
    click_button(value: 'Sim')
  end
  
  #@verifyNotDeletionShift
  When('Na mensagem apresentada clicar no botão Não.') do
    #sleep 3 / Havia um sleep pq o sistema estava apresentando lentidão
    click_button(value: 'Não')
  end
  
  Then('O turno não deve ser excluído sendo ainda apresentado na tela.') do
     expect(page).to have_content('Turno alterado pela automação')
  end
  
  #@verifyDeletionShift
  Then('O turno deve ser excluído com sucesso apresentando na tela a mensagem: {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end