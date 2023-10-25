require 'login/login'
require 'access_environment/workingTime/workingTimeElements'
require 'common/findElements'

workingTimeElements = WorkingTime.new
login = Login.new

#background
Given('Que o usuário esteja na página de cadastro de Jornada.') do
    workingTimeElements.visit_WorkingTime
    login.make_Login
    click_button 'Cadastrar'
  end
  
  #@verifyResourcesWorkingTime
  Then('Comparar os resources apresentados com os esperados na página de cadastro de Jornada.') do
    expect(page).to have_content 'Cadastrar Jornada'
    expect(page).to have_content 'Descrição'
    expect(page).to have_content 'Tipo'
    expect(page).to have_content 'Auto Completar'
    expect(page).to have_content 'Domingo'
    expect(page).to have_content 'Segunda-feira'
    expect(page).to have_content 'Terça-feira'
    expect(page).to have_content 'Quarta-feira'
    expect(page).to have_content 'Quinta-feira'
    expect(page).to have_content 'Sexta-feira'
    expect(page).to have_content 'Sábado'
    expect(page).to have_content 'Feriado'
    
 end
  
 #@verifyRequiredFieldWorkingTimeDescription
  Given('Preencher o campo Descrição da tela de Jornada com {string}.') do |desc|
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
  end
  
  #@verifyWorkingTimeTypeSemanal
  Given('Que esteja na tela de cadastro de Jornada') do
    workingTimeElements.visit_WorkingTime
    click_button 'Cadastrar'
  end
  
  When('Selecionar o tipo como {string}') do |tipo|
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType').select tipo
  end
  
  Then('Deve exibir os dias da semana para preencher os turnos') do
    expect(page).to have_content 'Domingo'
    expect(page).to have_content 'Segunda-feira'
    expect(page).to have_content 'Terça-feira'
    expect(page).to have_content 'Quarta-feira'
    expect(page).to have_content 'Quinta-feira'
    expect(page).to have_content 'Sexta-feira'
    expect(page).to have_content 'Sábado'
    expect(page).to have_content 'Feriado'
  end
  
  #@verifyWorkingTimeTypeMensal
  Then('Deve exibir os dias do mês para preencher os turnos') do
    expect(page).to have_content '1'
    expect(page).to have_content '2'
    expect(page).to have_content '3'
    expect(page).to have_content '4'
    expect(page).to have_content '5'
    expect(page).to have_content '6'
    expect(page).to have_content '7'
    expect(page).to have_content '8'
    expect(page).to have_content '9'
    expect(page).to have_content '10'
    expect(page).to have_content '11'
    expect(page).to have_content '12'
    expect(page).to have_content '13'
    expect(page).to have_content '14'
    expect(page).to have_content '15'
    expect(page).to have_content '16'
    expect(page).to have_content '17'
    expect(page).to have_content '18'
    expect(page).to have_content '19'
    expect(page).to have_content '20'
    expect(page).to have_content '21'
    expect(page).to have_content '22'
    expect(page).to have_content '23'
    expect(page).to have_content '24'
    expect(page).to have_content '25'
    expect(page).to have_content '26'
    expect(page).to have_content '27'
    expect(page).to have_content '28'
    expect(page).to have_content '29'
    expect(page).to have_content '30'
    expect(page).to have_content '31'
    expect(page).to have_content 'Feriado'
  end
  
  #@verifyWorkingTimeTypePeriodo
  Then('Deve exibir os campos {string} e {string}') do |periodo, data|
    expect(page).to have_content (periodo)
    expect(page).to have_content (data)
  end
  
  #@verifyRequiredFieldWorkingTimeShift
  Given('Preencher os campos Descrição e Tipo da tela de Jornada com {string} e {string}') do |desc, tipo|
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType').select tipo
  end
  
  Then('Deve exibir a mensagem: {string}') do |msg|
    mensagem = workingTimeElements.mensagem_alerta
    expect(mensagem).to eql msg
  end
  
  #@verifyFieldAutoCompletarSemanalFunction
  Given('Que esteja na tela de cadastro de Jornada com o Tipo {string} selecionado') do |tipo|
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType').select tipo
    sleep 2
  end

  When('Clicar em {string} na tela de Jornada') do |string|
    find('#MainContentMainMaster_MainContent_autoCompleteLink').click
  end

  Then('Deve exibir a tela com os campos para preenchimento: {string} e {string}') do |semana, uteis|
    expect(page).to have_content(semana)
    expect(page).to have_content(uteis)
  end
  
  #@verifyFieldAutoCompletarMensalFunction
  Then('Deve exibir a tela mensal com os campos para preenchimento: {string} e {string}') do |dias, turno|
    expect(page).to have_content(dias)
    expect(page).to have_content(turno)
  end

  #@verifyFieldAutoCompletarPeriodicaFunction
  Given('Preencher o campo Período com {string}') do |periodo|
    find('#MainContentMainMaster_MainContent_txtWorkingTimePeriod').set periodo
  end
  
  #@verifyFieldsAutoCompletarFimSemana
  When('Clicar na lupa Fim de Semana') do
    find('#img2').click
  end
  
  Then('Deve ver os campos {string} e {string} e {string}') do |add, num, desc|
    expect(page).to have_content(add)
    expect(page).to have_content(num)
    expect(page).to have_content(desc)
  end
  
  #@verifyFieldsAutoCompletarDiasUteis
  When('Clicar na lupa Dias Úteis') do
    find('#img1').click
  end
  
    
  #@verifyDaysLimitTypePeriodica    
  When('Clicar no campo Data inicial') do
    find('#MainContentMainMaster_MainContent_txtPeriodInitialDate').click
  end
  
  Then('Deve ver a mensagem: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='A quantidade de dias da jornada não pode ser maior que 366']")
    
  end
  
  #@verifyDaysTypePeriodica
  Then('Deve ver a quantidade de dias {string} criados') do |string|
    expect(page).to have_selector(:xpath, '//*[@id="WorkingTimeShift|366"]')
  end
  
  #@verifyWorkingTimeAlreadyRegistered  
  Given('Preencher o campo Descrição com {string}') do |desc|
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
  end
  
  When('Preencher o campo Segunda-Feira com {string}.') do |valor|
    find(:xpath, '//*[@id="WorkingTimeShift|2"]').set valor
  end

    
  Given('Preencher os campos Descrição e Tipo com {string} e {string}') do |desc, tipo|
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType').select tipo
    sleep 2
  end
  
  When('Preencher o campo do dia primeiro com {string} no cadastro Mensal') do |valor|
    sleep 1
    find(:xpath, '//*[@id="WorkingTimeShift|1"]').set valor       
  end                                                                                  

  When('Preencher o campo do dia primeiro com {string}') do |valor|
    find(:xpath, '//*[@id="WorkingTimeShift|1"]').set valor
  end
  
  Given('Preencher os campos Dias e Data Inicial com {string} e {string}') do |dias, data|
    sleep 1
    find('#MainContentMainMaster_MainContent_txtWorkingTimePeriod').set dias
    find('#MainContentMainMaster_MainContent_txtPeriodInitialDate').click
    sleep 1
    find('#MainContentMainMaster_MainContent_txtPeriodInitialDate').set data
  end

  When('Preencher o campo do dia primeiro com {string} no cadastro Períodica') do |valor|
    sleep 1
    find(:xpath, '//*[@id="WorkingTimeShift|1"]').set valor
  end

  Then('Deve ver a mensagem ao cadastrar corretamente: {string}') do |mensagem|
    expect(page).to have_content mensagem
  end

#Cenários adicionados posteriormente, para validar os campos com lupa
  #@saveWorkingTimeAutoCompletarFimSemana
  Given('Preencher a Descrição com {string}') do |desc|                        
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
  end                                                                            
                                                                                 
  When('Selecionar o checkbox da opção {string}') do |string|                    
    find('#MainContentMainMaster_MainContent_AutoComplete_ShiftPopup_gv_LookUpShifts_chk_Selected_0').click 
  end                                                                            
                                                                                 
  When('Clicar em {string} na tela de seleção de turno') do |string|             
    find('#MainContentMainMaster_MainContent_AutoComplete_ShiftPopup_btnShiftsLookUpOK').click
  end                                                                            
                                                                                 
  When('Clicar em {string} na tela de Auto Completar') do |string|               
    find('#MainContentMainMaster_MainContent_AutoComplete_Button1').click
  end                                                                            
                                                                                 

#@saveWorkingTimeAutoCompletarDiasUteis
  When('Clicar na lupa Dias Uteis') do
    find('#img1').click
  end

#@saveWorkingTimeAutoCompletarMensalUmDia
  When('Preencher o campo Dias com {string} e {string}') do |valor1, valor2|  
    find('#MainContentMainMaster_MainContent_AutoComplete_txtStart').set valor1
    find('#MainContentMainMaster_MainContent_AutoComplete_txtEnd').set valor2
  end                                                                          
                                                                               
  When('Clicar na lupa') do                                                    
    find('#imgAutoCompleteLookup').click
  end                                                                          

  