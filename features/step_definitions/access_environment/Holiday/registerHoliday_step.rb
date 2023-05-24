require 'login/login'
require 'common/findElements'
require 'access_environment/holiday/holidayElements'

login = Login.new
findElements = FindElements.new
holidayElements = Holiday.new


  #background
  Given('Que o usuário esteja na página de cadastro de Feriado.') do
    holidayElements.visit_holiday
    login.make_Login
    click_button 'Cadastrar'
  end
  
  #@verifyResourcesHoliday
  Then('Comparar os resources apresentados com os esperados na página de cadastro de Feriado.') do
    expect(page).to have_content('Cadastrar Feriado')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Data')
    expect(page).to have_content('Selecione os grupos')
  end
  

#@verifyRequiredFieldsHolidayDescription
  Given('Preencher o campo Descrição e Data da tela Feriado com valor {string} e {string}.') do |descricao, data|
    holidayElements.holiday(descricao, data)
  end                                                                                                                                                                                                  
  
  Then('Deve existir validação do campo Descrição: {string}.') do |mensagem|            
    expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
   end       
  
   #@verifyRequiredFieldsHolidayWithoutData
  Then('Deve existir validação do campo Data: {string}.') do |string|
    expect(page).to have_selector("input[oldtitle='Informe a Data']")
  end
  
  #@verifyRequiredFieldsHolidayWrongData
  Then('Deve existir validação do valor inserido no campo Data: {string}.') do |string|
    expect(page).to have_selector("input[oldtitle='Data inválida']")
  end
  
  #@verifyRequiredFieldsHolidayStringData
  Then('Deve existir validação do preenchimento do campo data: {string}.') do |string|
    expect(page).to have_selector("input[oldtitle='Informe a Data']")
  end

  #@verifyMessageSaveSameDescription
  Given('Associar o grupo {int}.') do |int|
    find("option[value='1']").click
    click_button 'MainContentMainMaster_MainContent_lstEquipmentGroup_btnTransferToRight'
  end

  #@saveHoliday
  Then('Deve apresentar a mensagem: {string}.') do |mensagem|                    
    expect(page).to have_content(mensagem)
  end                                                                          