require 'login/login'
require 'common/findElements'
require 'Visitor/visitorRegistration/visitorElements'

login = Login.new
findElements = FindElements.new
visitorElements = Visitor.new

#background
Given('Que o usuário esteja na página de cadastro de Visitante.') do
    visitorElements.visit_visitor
    login.make_Login
 end
  
  Then('Comparar os resources apresentados com os esperados na página de cadastro de Visitante.') do
    expect(page).to have_content 'Cadastrar Visitante'
    expect(page).to have_content 'Documento'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'Persona non grata'
    expect(page).to have_content 'Motivo persona non grata'
    expect(page).to have_content 'Empresa'
    expect(page).to have_content 'Porcentagem de sorteio'
    expect(page).to have_content 'DDI'
    expect(page).to have_content 'DDD'
    expect(page).to have_content 'Celular'
    expect(page).to have_content 'Visita Atual'
    expect(page).to have_content 'Data'
    expect(page).to have_content 'Contato'
    expect(page).to have_content 'Estrutura'
    expect(page).to have_content 'Observações'
    expect(page).to have_content 'Porcentagem de sorteio'
    expect(page).to have_content 'Visitas Agendadas'
    expect(page).to have_content 'Configurar Acesso'
    expect(page).to have_content 'Perfil de acesso'
    expect(page).to have_content 'Credencial'
    expect(page).to have_content 'Validade'
    expect(page).to have_content 'Baixar Credenciais'
  end
  
  #@verifyRequiredFieldVisitorDoc
  Given('Preencher o campo Documento da tela de Visitante com {string}.') do |doc|
    find("input[id$='txtDocument']").set doc
  end
  
  Then('Deve existir validação do campo Documento: {string}.') do |string|
    expect(page).to have_selector("input[oldtitle='Informe o Documento']")
  end
  
  #@verifyRequiredFieldVisitorName
  Given('Preencher o campo Nome da tela de Visitante com {string}.') do |nome|
    find("input[id$='txtName']").set nome
  end
  
  Then('Deve existir validação do campo Nome: {string}.') do |string|
    expect(page).to have_selector("input[oldtitle='Informe o Nome']")
  end
  
  #@verifyVisitorNotFound
  Given('Preencher o campo Tipo de Documento com {string}') do |valor|
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlDocument"]').select valor
  end
  
  Given('Preencher o campo Documento com {string}') do |doc|
    find("input[id$='txtDocument']").set doc
    sleep 1
  end

  When('Clicar no botão {string} na tela de Visitante') do |string|             
    click_button 'Buscar'
    sleep 3
  end                                                                           
  
  Then('Deve exibir a mensagem {string}') do |msg|
    expect(page).to have_content msg
  end
  
 #@verifyDisabledFields
  Given('Que esteja na tela de cadastro de Visitante') do
    expect(page).to have_content 'Cadastrar Visitante'
  end
  
  When('Verificar os campos {string}, {string}, {string} e {string}') do |motivo, contato, estrutura, perfil|
    @campo1 = page.has_css?('input[type="text"][id="MainContentMainMaster_MainContent_txtPersonNonGrataReason"][disabled]')
    
    @campo2 = page.has_css?('input[type="text"][id="MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_txtContact"][readonly]')
    
    @campo3 = page.has_css?('input[type="text"][id="MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_txtDepartment"][readonly]')
    
    @campo4 = page.has_css?('input[type="text"][id="MainContentMainMaster_MainContent_ucCurrentVisitSettings_accessProfileControlCurrentVisitSettings_txtAccessProfile"][readonly]')
  end
  
  Then('Deve ver os campos desabilitados para preenchimento') do
    expect(@campo1).to be_truthy
    expect(@campo2).to be_truthy
    expect(@campo3).to be_truthy
    expect(@campo4).to be_truthy
  end
  
  #@verifyInvalidDoc
  Given('Selecionar o tipo de documento como {string}') do |doc|
    find('#MainContentMainMaster_MainContent_ddlDocument').select doc
  end

  Then('Deve exibir a mensagem {string} no campo Documento') do |string|
    expect(page).to have_selector("input[oldtitle='Documento inválido']")
  end
  
  #@verifyRequiredCredencial
  Given('Clicar na lupa de Contato') do
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_btnPersonAdvancedSearch').click
  end
  
  Given('Preencher o campo Nome com {string}') do |nome|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_ucPersonAdvancedSearch_personAdvancedSearchContentControl_txtName').set nome
  end
  
  Given('Clicar no botão {string} na tela de Busca Avançada') do |string|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_ucPersonAdvancedSearch_personAdvancedSearchContentControl_btnPeopleSearch').click
    sleep 2
  end
  
  Given('Selecionar o checkbox da {string}') do |string|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ucVisitData_ucPersonAdvancedSearch_personAdvancedSearchContentControl_gv_LookUpPersons_chk_Selected_0').click
  end

  Then('Deve exibir a mensagem {string} no campo Credencial') do |string|      
    expect(page).to have_selector("input[oldtitle='Informe a Credencial']")
  end                                                                          
  
  #@verifyRequiredPerfilAcesso
  Given('Clicar na lupa do campo Credencial') do
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_seachCredentialBtn').click
  end
  
  Given('Selecionar o checkbox da primeira Credencial') do
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_CredentialPopup_gv_AvailableCredentials_chk_Selected_0').click
  end
  
  Given('Clicar no botão {string} da tela de Credencial Disponível') do |string|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_CredentialPopup_btnCredentialLookUpOK').click
    sleep 3
  end
  
  Then('Deve exibir a mensagem {string} no campo Perfil') do |string|
    expect(page).to have_selector("input[oldtitle='Você deve cadastrar o Perfil de Acesso']")
  end

  #@verifyRequiredTime
  Given('Clicar na lupa do campo Perfil de Acesso') do
    visitorElements.lupa_perfil
    sleep 1
  end
  
  Given('Selecionar o checkbox do primeiro Perfil de Acesso') do
    visitorElements.perfil_checkbox
  end
  
  Given('Clicar no botao {string} da tela Perfil de Acesso') do |string|
    visitorElements.ok_button
    sleep 1
  end
  
  Then('Deve exibir a mensagem {string} no campo Validade') do |string|
    expect(page).to have_selector("input[oldtitle='Campo  inválido']")
  end
  
  #@verifyBiometricFaceScreen
  When('Clicar no botão de Captura de Foto') do
    find('#MainContentMainMaster_MainContent_ImageButton1').click
  end
  
  Then('Deve exibir a tela de Captura de Foto') do
    expect(page).to have_content 'Captura de foto'
  end
  
  #@verifyBiometricFingerScreen
  When('Clicar no botão de Captura de Biometria') do
    find('#MainContentMainMaster_MainContent_imgBtnTakeFingerprint').click
  end
  
  Then('Deve exibir a tela de Captura de Biometria') do
    expect(page).to have_content 'Sensor'
  end
  
  #@verifyDocPhotoCaptureScreen
  When('Clicar no botão de Captura de Documento') do
    find('#MainContentMainMaster_MainContent_lnkDocumentView').click
  end
  
  Then('Deve exibir a tela de Captura de Documento') do
    expect(page).to have_content 'Captura de documento'
  end
  
  #@verifyCredencialAlreadyInUse
  Given('Preencher o campo Nome da tela de Visitante com {string}') do |nome|
    find('#MainContentMainMaster_MainContent_txtName').set nome
  end

  Given('Preencher a credencial com {string}') do |cred|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_txtCredential').set cred
  end
  
  Then('Deve exibir a mensagem na tela {string}') do |mensagem|
    msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li').text
    expect(msg).to eql mensagem
  end
  
  #@verifyRegisteredFace
  When('Clicar no botão {string} na tela de cadastro de Visitante') do |string|
    click_button 'Buscar'
    sleep 1
  end

  Then('Deve apresentar a face do usuário cadastrada') do
    expect(find('#MainContentMainMaster_MainContent_Image1'))
  end
  
  #@verifyRegisteredFinger
  Then('Deve apresentar a biometria cadastrada') do
    expect(find('#ctl00_ctl00_MainContentMainMaster_MainContent_biometricControl_rptSensors_ctl01_lnk'))
  end
  
  #@verifySearchInvalidName
  Given('Clicar na lupa do campo Nome') do
    find('#MainContentMainMaster_MainContent_btnVisitorLookUp').click
    sleep 1
  end
  
  Given('Preencher o campo Nome da tela de busca com {string}') do |nome|
    find('#MainContentMainMaster_MainContent_VisitorAdvancedSearch_txtName').set nome
  end

  When('Clicar no botão {string} na tela de Busca de Visitante') do |string|
    find('#MainContentMainMaster_MainContent_VisitorAdvancedSearch_btnSearch').click
    sleep 1
  end
  
  Then('Deve aprsentar a mensagem {string}') do |msg|
    expect(page).to have_content msg
  end
  
  #@verifySearchName
  Given('Clicar no checkbox do Visitante Um') do
    find('#MainContentMainMaster_MainContent_VisitorAdvancedSearch_gv_LookUpVisitors_chk_Selected_0').click
  end
  
  When('Clicar no botão {string} da tela de busca') do |string|
    find('#MainContentMainMaster_MainContent_VisitorAdvancedSearch_btnSearch').click
  end
  
  Then('Deve aparecer o Nome {string} na tela de cadastro de Visitante') do |nome|
   expect(page).to have_content nome
  end
  
  #@verifyComboboxValidade
  When('Clicar no combobox do campo Validade') do
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_ddlValidity').click
  end
  
  Then('Deve apresentar os valores: {string}') do |validade|
    expect(page).to have_content validade
    
  end
  
  Given('Preencher o campo de horas com {string}') do |hora|
    find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_txtValidity').set hora
    sleep 1
  end

  #@verifySaveNewVisitor
  Given('Preencher o campo Nome na tela de Visitante com {string}') do |nome| 
    find('#MainContentMainMaster_MainContent_txtName').set nome
    sleep 1
  end
  
  When('Clicar no botão Salvar na tela de cadastro') do
    click_button 'Salvar'
 end

 Then('Deve exibir a mensagem de cadastro com sucesso {string}') do |msg|
  expect(page).to have_content msg
end