
require 'login/login'
require 'access_environment/TimeSlot/timeSlot'
require 'common/findElements'

timeSlot = TimeSlot.new
login = Login.new

#background
Given ('Que o usuário esteja na página de cadastro de Faixa Horária.') do
    timeSlot.visit_TimeSlot
    login.make_Login
    sleep 0.3
    click_button 'Cadastrar'
end

# @verifyLabelsTimeSlot 
#Scenario: verifyLabelsTimeSlot
Given ('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de faixa horária.') do
    expect(page).to have_content('Número')
    expect(page).to have_content('Hora inicial')
    expect(page).to have_content('(hh:mm)')
    expect(page).to have_content('Hora final')
    expect(page).to have_content('(hh:mm)')
end

#fieldNumberRequiredTimeSlot
Given('Informar caractere alfanumérico no campo {string} da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do |string|
    fill_in 'MainContentMainMaster_MainContent_txtTimeSlotNumber', with: 'abc'
    fill_in 'MainContentMainMaster_MainContent_txtInitialTimeSlot', with: '09:00'
    fill_in 'MainContentMainMaster_MainContent_txtFinalTimeSlot', with: '10:00'
  end
  
  When('Clicar no botão Salvar para validar o campo {string} da tela Faixa Horária.') do |string|
    click_button 'Salvar'
  end
  
  Then('Deve existir uma validação no campo {string} da tela Faixa Horária pois o mesmo é obrigatório e só aceita caracteres numéricos.') do |string|
    expect(page).to have_selector("input[oldtitle='Informe o Número']")
  end

  
  #DataTable - Codificação para validar a tabela (Scenario Outline)
  When('Informo os dados de cadastro com {string} e {string} e {string}') do |numero, horaIni, horaFim|
    timeSlot.with(numero, horaIni, horaFim)
    sleep 1
  end
  
  Then('vejo a mensagem de alerta: {string}') do |mensagem|
    msg = timeSlot.alert
    expect(msg).to eql mensagem
  end

                                                                                                           
  Given('Preencher o campo Número com o valor {string}.') do |numero|                                 
    find('input[id="MainContentMainMaster_MainContent_txtTimeSlotNumber"]').set numero                       
  end                                                                                                 
                                                                                                      
  Given('Preencher os campos Hora inicial e Hora final com {string} e {string}') do |valor1, valor2| 
    find('#MainContentMainMaster_MainContent_txtInitialTimeSlot').set valor1
    find('#MainContentMainMaster_MainContent_txtFinalTimeSlot').set valor2            
  end                                                                                                 
                                                                                                      
  When('Clicar no botão Salvar para salvar a faixa horária.') do                                      
    click_button 'Salvar'                     
  end                                                                                                 
                                                                                                      
  Then('Deve ver a mensagem: {string}.') do |mensagem|                                                  
    expect(page).to have_content(mensagem)                      
  end                                                                                                                                                                                                             
  