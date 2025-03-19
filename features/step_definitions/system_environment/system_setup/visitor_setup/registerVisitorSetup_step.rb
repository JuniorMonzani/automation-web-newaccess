require 'login/login'
require 'common/findElements'
require 'system_environment/system_setup/visitor_setup/visitor_setupElements'

login = Login.new
findElements = FindElements.new
visitor_setupElements = VisitorSetup.new

#background
Given('Que o usuário esteja na aba de Visitante na tela de Configurações de Sistema.') do
    visitor_setupElements.visit_visitorSetup
    login.make_Login
    
  end
  
  #@verifyComboxCampoAdicional1
  Given('Que esteja na aba de Visitante da tela de Configurações de Sistema') do
    find('#li_sysConfigVisitors').click
  end
  
  When('Clicar no combobox do primeiro campo adicional') do
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType1').click
  end
  
  Then('Deve apresentar os valores {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |alfa, bool, num, dateHour, hour, date, mail|
    expect(page).to have_content alfa
    expect(page).to have_content bool
    expect(page).to have_content num
    expect(page).to have_content dateHour
    expect(page).to have_content hour
    expect(page).to have_content date
    expect(page).to have_content mail
  end
  
  #@verifyComboxCampoAdicional2
  When('Clicar no combobox do segundo campo adicional') do
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType2').click
  end
  
  #@verifyComboxCampoAdicional3
  When('Clicar no combobox do terceiro campo adicional') do
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType3').click
  end
  
  #@verifyComboxCampoAdicional4
  When('Clicar no combobox do quarto campo adicional') do
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType4').click
  end
  
  #@saveaditionalfield1
  Given('Preencher o primeiro campo adicional com {string}') do |valor|
    find('#MainContentMainMaster_MainContent_txtVisitorLabelField1').set valor
  end
  
  Given('Selecionar o tipo {string} no primeiro campo adicional') do |box|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType1').select box
  end
  
  Given('Marcar o checkbox {string}') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorLabelField1').check
  end
  
  Then('Deve apresentar a mensagem {string}') do |msg|
    expect(page).to have_content msg
  end
  
  #@saveaditionalfield2
  Given('Preencher o segundo campo adicional com {string}') do |valor2|
    find('#MainContentMainMaster_MainContent_txtVisitorLabelField2').set valor2
  end
  
  Given('Selecionar o tipo {string} no segundo campo adicional') do |box2|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType2').select box2
  end

  Given('Marcar o checkbox {string} no segundo campo adicional') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorLabelField2').check
  end                                                                           
  
  #@saveaditionalfield3
  Given('Preencher o terceiro campo adicional com {string}') do |valor3|
    find('#MainContentMainMaster_MainContent_txtVisitorLabelField3').set valor3
  end
  
  Given('Selecionar o tipo {string} no terceiro campo adicional') do |box3|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType3').select box3
  end

  Given('Marcar o checkbox {string} no terceiro campo adicional') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorLabelField3').check
  end                                                                           
  
  #@saveaditionalfield4
  Given('Preencher o quarto campo adicional com {string}') do |valor4|
    find('#MainContentMainMaster_MainContent_txtVisitorLabelField4').set valor4
  end
  
  Given('Selecionar o tipo {string} no quarto campo adicional') do |box4|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType4').select box4
  end

  Given('Marcar o checkbox {string} no quarto campo adicional') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorLabelField4').check
  end                                                                           
  
  #@verifyMessageAltTypeAditionalField1
  When('Alterar o valor para {string} no primeiro campo adicional') do |box1|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType1').select box1
  end
  
  #@verifyMessageAltTypeAditionalField2
  When('Alterar o valor para {string} no segundo campo adicional') do |box2|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType2').select box2
  end
  
  #@verifyMessageAltTypeAditionalField3
  When('Alterar o valor para {string} no terceiro campo adicional') do |box3|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType3').select box3
  end
  
  #@verifyMessageAltTypeAditionalField4
  When('Alterar o valor para {string} no quarto campo adicional') do |box4|
    find('#MainContentMainMaster_MainContent_ddlVisitorLabelFieldType4').select box4
  end
  
  #@verifyLengthAditionalField1
  When('Obter o tamanho do primeiro campo {string}') do |rotulo|
    @tamRot = find('#MainContentMainMaster_MainContent_txtVisitorLabelField1').value.length
  end
  
  Then('O tamanho do primeiro campo deve ser {string}') do |valor|
    expect(@tamRot).to eql (valor).to_i
  end
  
  #@verifyLengthAditionalField2
  When('Obter o tamanho do segundo campo {string}') do |rotulo|                 
    @tamRot2 = find('#MainContentMainMaster_MainContent_txtVisitorLabelField2').value.length
  end                                                                           
                                                                         
  Then('O tamanho do segundo campo deve ser {string}') do |valor|              
    expect(@tamRot2).to eql (valor).to_i 
  end                                                                           

  #@verifyLengthAditionalField3
  When('Obter o tamanho do terceiro campo {string}') do |rotulo|               
    @tamRot3 = find('#MainContentMainMaster_MainContent_txtVisitorLabelField3').value.length
  end                                                                          
                                                                               
  Then('O tamanho do terceiro campo deve ser {string}') do |valor|            
    expect(@tamRot3).to eql (valor).to_i
  end                                                                          

  #@verifyLengthAditionalField4
  When('Obter o tamanho do quarto campo {string}') do |rotulo|
    @tamRot4 = find('#MainContentMainMaster_MainContent_txtVisitorLabelField3').value.length
  end
  
  Then('O tamanho do quarto campo deve ser {string}') do |valor|
    expect(@tamRot4).to eql (valor).to_i
  end

  #@editDefaultAccessProfile
  Given('Clicar na lupa do Perfil de acesso padrão') do
    find('#MainContentMainMaster_MainContent_accessProfileControlVisitor_AccessProfileLookUp').click
  end
  
  Given('Clicar no checkbox do primeiro perfil de acesso') do
    find('#MainContentMainMaster_MainContent_accessProfileControlVisitor_AccessProfilePopup_gv_AvailableAccessProfiles_chk_Selected_0').click
  end
  
  Given('Clicar no botão de {string}') do |string|
    find('#MainContentMainMaster_MainContent_accessProfileControlVisitor_AccessProfilePopup_btnAccessProfileLookUpOK').click
  end
  
  #@editDefaultVisitTime
  Given('When Preencher o campo Tempo Padrão de visita com {string}') do |visita|
    find('#MainContentMainMaster_MainContent_txtVisitorDefaultDuration').set visita
  end
  
  #@editDefaultSortPercent
  Given('Preencher o campo de Porcentagem de Sorteio com {string}') do |porc|
    find('#MainContentMainMaster_MainContent_txtDefaultValueSortition').set porc
  end
  
  #@verifyLengthSortPercent
  When('Obter o tamanho do campo {string}') do |string|
    @tamPerc = find('#MainContentMainMaster_MainContent_txtDefaultValueSortition').value.length
  end
  
  Then('O tamanho deve ser {string}') do |valor|
    expect(@tamPerc).to eql (valor).to_i
  end

  #@editContactCheckbox
  Given('Marcar o checkbox do campo {string}') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorAvailableContact').click
  end

  #@editAvailableVehicleCheckbox
  Given('Marcar o checkbox do campo Disponibilizar cadastro de veículo') do
    find('#MainContentMainMaster_MainContent_cbxVisitorAvailableRegisterVehicle').click
  end

  #@editIncludeVisitBlocked
  Given('Marcar o checkbox do campo Incluir visita bloqueada') do
    find('#MainContentMainMaster_MainContent_cbxVisitorAddBlockedVisitor').click
  end

  #@editIncludeContactRegist
  Given('Marcar o checkbox do campo Incluir a matricula no campo contato') do  
    find('#MainContentMainMaster_MainContent_cbxPrintHostRegOnTag').click
  end              
  
  #@verifyCheckboxTagPrint
  Given('Marcar o checkbox Disponibilizar impressão de etiqueta') do
    find('#MainContentMainMaster_MainContent_cbxVisitorProvideTagPrinting').click
  end
  
  #@verifyComboboxPrintTemplate
  When('Obter os valores do combobox modelos de impressão') do
    find('#MainContentMainMaster_MainContent_ddlPrintModel')
  end
  
  Then('Os valores devem ser: {string}, {string}, {string}, {string}, {string}, {string}') do |deskjet, pimaco, all, zebra, pimacoslp650, dprint|
    expect(page).to have_content(deskjet)
    expect(page).to have_content(pimaco)
    expect(page).to have_content(all)
    expect(page).to have_content(zebra)
    expect(page).to have_content(pimacoslp650)
    expect(page).to have_content(dprint)
  end
  
  #@editLabelFreeField
  Given('Preencher o campo livre para etiqueta com {string}') do |etiqueta|
    find('#MainContentMainMaster_MainContent_txtVisitorTagValue').set etiqueta
  end
  
  #@verifyLengthLabelFreeField
  When('Obter o tamanho do campo livre para etiqueta') do
    @tag = find('#MainContentMainMaster_MainContent_txtVisitorTagValue').value.length
  end
  
  Then('O tamanho do campo livre para etiqueta deve ser {string}') do |valor| 
    expect(@tag).to eql (valor).to_i
  end                                                                          

  #@verifyComboBoxPrintMode
  When('Obter os valores do campo Modo de impressão') do
    @valor1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlPrintMode"]/option[1]').text
    @valor2 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlPrintMode"]/option[2]').text
    @valor3 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlPrintMode"]/option[3]').text
  end
  
  Then('OS valores devem ser {string}, {string}, {string}') do |string, string2, string3|
    expect(@valor1).to eql string3
    expect(@valor2).to eql string2
    expect(@valor3).to eql string
    
  end
  
  #@editFieldTasyIntegration
  Given('Marcar o checkbox Integração Tasy') do
    find('#MainContentMainMaster_MainContent_cbxTasyIntegration').check
  end

  Given('Preencher o campo endereço com {string}') do |endereço|
    find('#MainContentMainMaster_MainContent_txtTasyAddress').set endereço
  end
  
  When('Obter o tamanho do campo endereço') do
    @endereço = find('#MainContentMainMaster_MainContent_txtTasyAddress').value.length
  end

  Then('O tamanho do campo Integração Tasy deve ser {string}') do |valor|
   expect(@endereço).to eql (valor).to_i
  end


