require 'login/login'
require 'physical_environment/communicationManager/CommunicationManager'
require 'common/findElements'
require 'common/constants'

communicationManager = CommunicationManager.new
findElements = FindElements.new
login = Login.new

@background
Given('Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.') do
  communicationManager.visit_List_Communication_Manager
      login.make_Login
end

#@verifyFirstMessageDeleteCommunicationManager
Given('Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação.') do
  find('#MainContentMainMaster_chkLastTenModified').uncheck
  find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set 'Automação Client'
  click_button 'Buscar'
end

When('Ao clicar no botão de exclusão.') do
  find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0').click
end

Then('A mensagem apresentada deve ser: {string}') do |msg|
  expect(page).to have_content msg
end

#@noDeleteCommunicationManager
When('Clicar no botão Não para não excluir o gerenciador.') do
  click_button 'Não'
end

Then('Pesquisar e encontrar o gerenciador cadastrado pela automaçao confirmando que não foi excluído.') do
  find('#MainContentMainMaster_chkLastTenModified').uncheck
  find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set 'Automação Client'
end

#@verifySecondMessageDeleteCommunicationManager
Given('Que pesquise e encontre o gerenciador de comunicação {string}.') do |gerenciador|
  find('#MainContentMainMaster_chkLastTenModified').uncheck
  find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set gerenciador
  click_button 'Buscar'
  sleep 1
end

When('Clicar no botão Sim da primeira mensagem apresentada.') do
  click_button 'Sim'
end

Then('A mensagem apresentada deve ser validada conforme o esperado: {string}') do |msg|
  expect(page).to have_content msg
end

#@deleteFirstCommunicationManager
Given('Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação {string}.') do |gerenciador|  
  find('#MainContentMainMaster_chkLastTenModified').uncheck
  find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set gerenciador
  click_button 'Buscar'
  sleep 1                                  
end                                                                                                            
                                                                                                               
When('Clicar no botão Sim para excluir o gerenciador.') do                                                     
  click_button 'Sim'
end                                                                                                            
                                                                                                               
Then('Deve ver a mensagem ao excluir o comunicador {string}') do |msg|                                      
  expect(page).to have_content msg
  
end
                                                                                                               