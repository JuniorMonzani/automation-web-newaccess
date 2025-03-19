require 'login/login'
require 'common/findElements'
require 'Visitor/credential_Writeoff/credentialWriteoffElements'

login = Login.new
findElements = FindElements.new
credentialWriteoffElements = CredentialWriteOff.new


#background
Given('Que o usuário esteja na página de baixa de credenciais.') do
  credentialWriteoffElements.visit_credentialWriteOff
  login.make_Login
end

#@verifyResourcesCredentialWriteoff
Then('Comparar os resources apresentados com os esperados na página de baixa de credencial.') do
  expect(page).to have_content 'Credencial'
  expect(page).to have_content 'Até'
  expect(page).to have_content 'Data inicial da visita'
  expect(page).to have_content 'Nome'
  expect(page).to have_content 'Status'
end

#@verifyCredentialNotFound
Given('Preencher os campos Credencial e Até com {string} e {string}') do |cred, ate|
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_txtCredentialFrom').set cred
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_txtCredentialTo').set ate
end

When('Clicar no botão {string} na tela de baixa de credencial') do |string|  
  click_button 'Buscar'
end                                                                          

Then('Deve apresentar o nome {string}') do |msg|
  expect(page).to have_content(msg)
end

#@verifySearchByName
Given('Preencher o campo nome com {string}') do |nome|
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_txtVisitor').set nome
end

Then('Deve apresentar a credencial {string}') do |cred|
  expect(page).to have_content(cred)
end

#@verifySearchByDate
Given('Preencher o campo data com {string}') do |data|
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_txtInitialDate').set data
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_txtVisitor').click
end

Given('Que ao clicar no combobox Status') do
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_ddlCredentialStatus').click
end

When('Obter os valores do combobox') do
  @todos = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_CredentialWriteOffControl_ddlCredentialStatus"]/option[1]').text
  @andamento = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_CredentialWriteOffControl_ddlCredentialStatus"]/option[2]').text
  @expirada = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_CredentialWriteOffControl_ddlCredentialStatus"]/option[3]').text
end

Then('Os valores devem ser {string}, {string} e {string} no campo Status') do |tds, anda, exp|
  expect(@todos).to eql tds
  expect(@andamento).to eql anda
  expect(@expirada).to eql exp
end

Given('Selecionar o checkbox da primeira credencial') do
  find('#MainContentMainMaster_MainContent_CredentialWriteOffControl_gv_LookUpCredentials_chk_Selected_0').check
end

#@removeCredencial
When('Clicar no botão {string} na tela de Baixa de Credencial') do |string|  
  click_button 'Baixar'
end                                                                          