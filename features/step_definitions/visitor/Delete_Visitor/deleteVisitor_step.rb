require 'login/login'
require 'common/findElements'
require 'Visitor/deleteVisitor/deleteVisitorElements'

login = Login.new
findElements = FindElements.new
deleteVisitorElements = VisitorExpel.new

#background
Given('Que o usuário esteja na página de exclusão de visitantes') do
  deleteVisitorElements.visit_VisitorExpel
  login.make_Login
end

#@verifySearchComboBox
When('Obter os valores do combobox do tipo de busca') do
  @valor1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_VisitorExpelControl_ddlFilters"]/option[1]').text
  @valor2 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_VisitorExpelControl_ddlFilters"]/option[2]').text
end

Then('Os valores devem ser {string} e {string}') do |doc, nome|
  expect(@valor1).to eql doc
  expect(@valor2).to eql nome
end

#@verifyDocNotFound
Given('Preencher o campo de busca com {string}') do |busca|
  find('#MainContentMainMaster_MainContent_VisitorExpelControl_txtFilter').set busca
end

When('Clicar no botão Buscar na tela de Exclusão de Visitante') do
  click_button 'Buscar'
end

When('Clicar no botão Excluir na tela de Exclusão de Visitante') do
  find('#MainContentMainMaster_MainContent_VisitorExpelControl_btnChangeSituation').click
end

Then('Deve ver a mensagem {string} na tela de Exclusão de Visitante') do |msg|
  expect(page).to have_content msg    
end                                                                              