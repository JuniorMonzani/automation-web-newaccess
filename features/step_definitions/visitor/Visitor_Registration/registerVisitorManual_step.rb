require 'login/login'
require 'common/findElements'
require 'Visitor/visitorRegistration/visitorElements'

login = Login.new
findElements = FindElements.new
visitorElements = Visitor.new

#@verifyFirstAditionalFieldName
When('Obter o nome do primeiro campo adicional') do
  @campo1 = find('#MainContentMainMaster_MainContent_lblField1').text
end

Then('Deve ser o nome {string} no primeiro campo') do |valor|
  expect(@campo1).to eql valor
end

#@verifySecondAditionalFieldName
When('Obter o nome do segundo campo adicional') do
    @campo2 = find('#MainContentMainMaster_MainContent_lblField2').text
end


Then('Deve ser o nome {string} no segundo campo') do |valor|
    expect(@campo2).to eql valor
  end

#@verifyThirdAditionalFieldName
When('Obter o nome do terceiro campo adicional') do
    @campo3 = find('#MainContentMainMaster_MainContent_lblField3').text
end

Then('Deve ser o nome {string} no terceiro campo') do |valor|
    expect(@campo3).to eql valor
  end

#@verifyFourthAditionalFieldName
When('Obter o nome do quarto campo adicional') do
    @campo4 = find('#MainContentMainMaster_MainContent_lblField4').text
end


Then('Deve ser o nome {string} no quarto campo') do |valor|
    expect(@campo4).to eql valor
end

#@verifyFistAditionalFieldMandatory
Given('Preencher o primeiro campo adicional na tela de cadastro de visitante com {string}') do |campo1|
  find('#MainContentMainMaster_MainContent_extraField1_ExtraFieldControl_extraField1').set campo1
end

Then('Deve ver a mensagem {string} no primeiro campo adicional') do |string| 
  expect(page).to have_selector("input[oldtitle='Preencha o campo ']")
end                                                                         

#@verifyThirdAditionalFieldMandatory
Given('Preencher o terceiro campo adicional na tela de cadastro de visitante com {string}') do |campo3|
  find('#MainContentMainMaster_MainContent_extraField3_ExtraFieldControl_extraField3').set campo3
end

Then('Deve ver a mensagem {string} no terceiro campo adicional') do |string|
  expect(page).to have_selector("input[oldtitle='Preencha o campo ']")
end

#@verifyForthAditionalFieldMandatory
Given('Preencher o quarto campo adicional na tela de cadastro de visitante com {string}') do |campo4|
  find('#MainContentMainMaster_MainContent_extraField4_ExtraFieldControl_extraField4').set campo4
end

Then('Deve ver a mensagem {string} no quarto campo adicional') do |string|
  expect(page).to have_selector("input[oldtitle='Preencha o campo ']")
end


#@verifyDefaultAccessProfile
When('Obter o valor do campo Perfil de Acesso') do
  @valor = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_accessProfileControlCurrentVisitSettings_txtAccessProfile').value
end

Then('Deve ser o valor {string}') do |texto|
  expect(@valor).to eql texto
end

#@verifyVisitorDefaultDuration
When('Obter o valor do campo de Hora da Validade') do
  @hora = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_txtValidity').value
end

Then('Deve ser o valor {string} no campo hora') do |valor|
  expect(@hora).to eql valor
end

#@verifyDefaultValueSortition
When('Obter o valor do campo Porcentagem padrão de sorteio para visita') do
  @porc = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_txtPercentageOfSortitionVisit').value
end

Then('Deve ser o valor {string} no campo porcentagem') do |valor|
  expect(@porc).to eql valor
end

#@verifyForthAdicionalFieldInvalid
Given('Preencher o quarto campo adicional na tela de Visitante com {string}') do |valor|
  find('#MainContentMainMaster_MainContent_extraField4_ExtraFieldControl_extraField4').set valor
end

Then('Deve ver a mensagem no quarto campo {string}') do |string|
  expect(page).to have_selector("input[oldtitle='E-mail inválido']")
end

#@saveNewVisitorAllFields
Given('Selecionar o checkbox na tela de Visitante {string}') do |string|      
  find('#MainContentMainMaster_MainContent_chkPersonNonGrata').click
end                                                                           

Given('Preencher o campo Motivo persona non grata com {string}') do |motivo|
  find('#MainContentMainMaster_MainContent_txtPersonNonGrataReason').set motivo
end

Given('Preencher o campo Empresa com {string}') do |empresa|
  find('#MainContentMainMaster_MainContent_txtCompany').set empresa
end

Given('Preencher os campos DDI, DDD e Celular com {string}, {string}, {string}') do |ddi, ddd, cel|
  find('#MainContentMainMaster_MainContent_txtCellPhoneDDI').set ddi
  find('#MainContentMainMaster_MainContent_txtCellPhoneDDD').set ddd
  find('#MainContentMainMaster_MainContent_txtCellPhone').set cel
end

Given('Marcar o checkbox do segundo campo extras') do
  find('#MainContentMainMaster_MainContent_extraField2_ExtraFieldControl_extraField2').click
end

Given('Preencher os campos extras com {string}, {string}, {string}') do |extra1, extra3, extra4|
  find('#MainContentMainMaster_MainContent_extraField1_ExtraFieldControl_extraField1').set extra1
  find('#MainContentMainMaster_MainContent_extraField3_ExtraFieldControl_extraField3').set extra3
  find('#MainContentMainMaster_MainContent_extraField4_ExtraFieldControl_extraField4').set extra4
end


Given('Preencher o campo Contato com {string}') do |contato|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_txtContact').set contato
end

Given('Preencher o campo Credencial com {string}') do |cred|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_txtCredential').set cred
end

Given('Clicar na lupa do campo Estrutura') do
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_btnOrganizationalStructureSearch').click
  sleep 3
end

Given('Preencher o campo de busca na tela de Estrutura com {string}') do |desc|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_structureTreeviewPopup_txtOrganizationStructureDescription').set desc
end

Given('Clicar no botão {string} na tela de Estrutura') do |string|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_structureTreeviewPopup_btnSearch').click
end

Given('Clicar no checkbox da Estrutura {string}') do |string|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_structureTreeviewPopup_tvStructuren0CheckBox').click
end

Given('Clicar no botão {string} na tela de Busca de Estrutura') do |string|  
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_structureTreeviewPopup_btnOkStructure').click
end                                                                          

#@saveNewFutureVisitor
Given('Preencher a Data da Visita com {string}') do |data|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_txtVisitDate').set data
end

#@verifyScheduleVisitDate
When('Clicar no botão {string} na tela de Visitante Cadastrado') do |string|
  find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_lnkScheduledVisits').click
end

Then('Deve ver a data da visita como {string}') do |valor|
   expect(page.assert_text(valor)).to eq true
end

#@verifyScheduleVisitInfo
Then('Deve ver nos campos Contato, Estrutura e Porcentagem os valores {string}, {string}, {string}') do |contato, estrutura, porcentagem|
  cont = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucSchedulingVisitsControl_MenuControl_ctl02_ucVisitData_txtContact').value
  est = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucSchedulingVisitsControl_MenuControl_ctl02_ucVisitData_txtDepartment').value
  porc = find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucSchedulingVisitsControl_MenuControl_ctl02_ucVisitData_txtPercentageOfSortitionVisit').value
  expect(cont).to eql(contato)
  expect(est).to eql(estrutura)
  expect(porc).to eql(porcentagem)
end

#find('input[id$=txtDescriptionSearch]')

#@verifyRetainCredentialNotFound
Given('Clicar em {string} na tela de Visitante') do |string|                 
  find("a[id$='btnRetainCredentials']").click
  sleep 3
end                                                                          

Given('Preencher o campo Credencial e Até com {string} e {string}') do |de, ate|
  find("input[id$='txtCredentialFrom']").set de
  find("input[id$='txtCredentialTo']").set ate
  sleep 1
end

When('Clicar no botão {string} na tela de Baixar Credencial') do |string|     
  find("input[id$='btnDoSearch']").click
  sleep 3
end                                      

Then('Deve ver a mensagem {string} na tela de Baixar Credencial') do |msg|
  texto = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ucCurrentVisitSettings_CredentialWriteOff_gv_LookUpCredentials"]/tbody/tr/td').text
  expect(texto).to eql msg 
end                                                                          

#@verifySearchRetainCredentialByDate
Given('Preencher o campo Data com {string}') do |data|
  find("input[id$='txtInitialDate']").set data
  find("input[id$='txtVisitor']").click
end

Then('Deve ver a credencial {string}') do |credencial|
  cred = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ucCurrentVisitSettings_CredentialWriteOff_gv_LookUpCredentials"]/tbody/tr[2]/td[2]/label').text
  expect(cred).to eql credencial
end

#@verifySearchRetainCredentialByName
Given('Preencher o campo Nome com {string} na tela de Baixar Credencial') do |nome|
  find("input[id$='txtVisitor']").set nome
end

#@retainCredential
Given('Selecionar o checkbox da credencial {string}') do |string|
  find("input[id$='Selected_0']").click
  sleep 3
end

When('Clicar no botão Baixar na tela de Baixar Credencial') do
  find("input[id$='CredentialWriteOff_btnWriteOff']").click
end

Then('Deve ver a credencial {string} Disponível') do |cred|
  expect(page).to have_content(cred)
end