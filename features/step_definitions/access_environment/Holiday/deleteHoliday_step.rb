require 'login/login'
require 'common/findElements'
require 'access_environment/holiday/holidayElements'

login = Login.new
findElements = FindElements.new
holidayElements = Holiday.new

#@verifyFirstMessageForExclusionHoliday
  When('Clicar para excluir o feriado.') do
    
    find('#MainContentMainMaster_MainContent_gv_Holiday_IMG_BUTTON_DELETE_0').click
  end

  Then('Uma mensagem deve ser apresentada ao usuário na tela de exclusão: {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end
 
  #@verifyNotDeletionHoliday
  Then('O feriado não deve ser excluído sendo ainda apresentado na tela.') do
    expect(page).to have_content ('Teste alteração Automação iiii')
  end
  
  #@verifyDeletionHoliday

  When('Na mensagem de confirmação apresentada clicar no botão Sim.') do
    sleep 1
    click_button(value: 'Sim')
  end

  Then('O feriado deve ser excluído com sucesso apresentando na tela a mensagem: {string}') do |mensagem|
   expect(page).to have_content(mensagem)
  end

  #@verifyDeleteCopyHoliday
  Given('Buscar e encontrar o feriado copiado pela automação com Descrição {string}.') do |descricao|
    find('#MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch').set descricao
    click_button 'Buscar'
  end