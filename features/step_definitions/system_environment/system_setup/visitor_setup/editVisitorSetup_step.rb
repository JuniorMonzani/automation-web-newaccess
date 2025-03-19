require 'login/login'
require 'common/findElements'
require 'system_environment/system_setup/visitor_setup/visitor_setupElements'

login = Login.new
findElements = FindElements.new
visitor_setupElements = VisitorSetup.new


#@editaditionalfield1
Given('Desmarcar o checkbox {string} do primeiro campo obrigatório') do |string|
    find('#MainContentMainMaster_MainContent_cbxVisitorLabelField1').uncheck
  end
  
#@editaditionalfield2
Given('Desmarcar o checkbox {string} do segundo campo obrigatório') do |string|
  find('#MainContentMainMaster_MainContent_cbxVisitorLabelField2').uncheck
  end  

#@editaditionalfield3
Given('Desmarcar o checkbox {string} do terceiro campo obrigatório') do |string|
  find('#MainContentMainMaster_MainContent_cbxVisitorLabelField3').uncheck
  end  

#@editaditionalfield4  
Given('Desmarcar o checkbox {string} do quarto campo obrigatório') do |string|
  find('#MainContentMainMaster_MainContent_cbxVisitorLabelField4').uncheck
  end

  #@removeDefaultAccessProfile
  Given('Clicar no botão remover do perfil padrão') do
    find("input[id$='imgBtnClearAccessProfile']").click
  end


  Given('Marcar o checkbox do campo Permitir digitação do campo contato') do
    find("input[id$='cbxVisitorAvailableContact']").click
  end


  #@removeContactCheckbox
  Given('Desmarcar o checkbox do campo Permitir digitação do campo contato') do
    find('#MainContentMainMaster_MainContent_cbxVisitorAvailableContact').uncheck
  end
  
  #@removeAvailableVehicleCheckbox
  Given('Desmarcar o checkbox do campo Disponibilizar cadastro de veículo') do
    find('#MainContentMainMaster_MainContent_cbxVisitorAvailableRegisterVehicle').uncheck
  end

  #@removeIncludeVisitBlocked
  Given('Desmarcar o checkbox do campo Incluir visita bloqueada') do
    find('#MainContentMainMaster_MainContent_cbxVisitorAddBlockedVisitor').uncheck
  end

  #@removeIncludeContactRegist
  Given('Desmarcar o checkbox do campo Incluir a matricula no campo contato') do
    find('#MainContentMainMaster_MainContent_cbxPrintHostRegOnTag').uncheck
  end

  #@removeCheckboxTagPrint
  Given('Desmarcar o checkbox Disponibilizar impressão de etiqueta') do
    find('#MainContentMainMaster_MainContent_cbxVisitorProvideTagPrinting').uncheck
  end

  #@removeFieldTasyIntegration
  Given('Desmarcar o checkbox Integração Tasy') do                             
    find('#MainContentMainMaster_MainContent_cbxTasyIntegration').uncheck
  end                                                                          