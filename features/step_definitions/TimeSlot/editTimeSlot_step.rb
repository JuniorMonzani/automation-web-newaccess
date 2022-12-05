require 'login/login'
require 'TimeSlot/timeSlot'
require 'common/findElements'

timeSlot = TimeSlot.new
login = Login.new
findElements = FindElements.new

#background
Given('Que o usuário esteja na página de faixa horária') do
    timeSlot.visit_EditTimeSlot
    login.make_Login
    end
  
   #@verifySearchField
  When('Ao clicar checkbox {string}') do |string|
    find("input[type='checkbox']").set false
    end
  
  Then('O campo busca deve ficar habilitado') do
   find("input[id='MainContentMainMaster_TableFiltersHolder_txtSearch']", :visible => true)
  end
  
  #@verifySearchAlfanumeric
  When('Faço a pesquisa inserindo letras') do
    # find("input[type='checkbox']").set false
    fill_in 'MainContentMainMaster_TableFiltersHolder_txtSearch', with:'abc'
    click_button 'Buscar'
  end
  
  Then('Devo retornar para a página de cadastro') do
    expect(page).to have_content('Cadastro de Faixa Horária')
  end
  
  #@verifySearchInvalidNumber
  When('Faço a pesquisa por um número não cadastrado') do
    fill_in 'MainContentMainMaster_TableFiltersHolder_txtSearch', with:'2'
    click_button 'Buscar'
    sleep 3
  end
  
  Then('Devo ver a mensagem: {string}') do |mensagem|
    msg = findElements.search_Xpath('//*[@id="MainContentMainMaster_MainContent_gridView"]/tbody/tr/td')
    expect(msg).to eql mensagem
  end
  
  #@verifySearchNumber
  When('Faço a pesquisa pelo número {string}') do |string|
    fill_in 'MainContentMainMaster_TableFiltersHolder_txtSearch', with:'999999'
    click_button 'ctl00$ctl00$MainContentMainMaster$TableFiltersHolder$btnDoSearch'
    sleep 1
    end
  
  Then('Devo ver como resultado da pesquisa o cadastro do número: {string}') do |valor|
    msg = findElements.search_Xpath('//*[@id="MainContentMainMaster_MainContent_gridView"]/tbody/tr[2]/td[1]')
    expect(msg).to eql valor
    end

    #@verifyEditTimeSlot
    Given('faça a busca') do
    find("input[type='checkbox']").set false
    fill_in 'MainContentMainMaster_TableFiltersHolder_txtSearch', with:'999999'
    click_button 'ctl00$ctl00$MainContentMainMaster$TableFiltersHolder$btnDoSearch'
  end
  
  When('Eu clico no ícone de alteração da Faixa Horária.') do
    click_button 'ctl00$ctl00$MainContentMainMaster$MainContent$gridView$ctl02$IMG_BUTTON_EDIT'
  end
  
  Then('Devo ver a mensagem: {string}.') do |mensagem|
    msg = findElements.search_Xpath('//*[@id="ListNameHolderMainMaster_lblCurrentAction"]')
    expect(msg).to eql mensagem
  end
  
  #@verifyFieldNumberOfTimeSlotDisabled
  Then('Devo ver o campo número como: {string}') do |desativado|
    msg = page.has_css?('input[type="text"][id="MainContentMainMaster_MainContent_txtTimeSlotNumber"][disabled]')
    expect(msg).to be_truthy
  end
  
  #@verifyNumberTimeSlot
  Then('O número deve ser exatamente o número cadastrado para a Faixa Horária: {string}.') do |valor|
    msg = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtTimeSlotNumber"]').value
    expect(msg).to eql valor
  end
  
  
  #@verifyHoursTimeSlot
  Then('A Hora inicial e Hora final devem ser exatamente as mesmas cadastrado para a Faixa Horária: {string}, {string}') do |inicial, final|
    msg1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtInitialTimeSlot"]').value
    expect(msg1).to eql inicial
    
    msg2 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtFinalTimeSlot"]').value
    expect(msg2).to eql final
  end
 
  #@verifyEditHoursTimeSlot
  When('Alterar a {string} e {string}.') do |string, string2|
    fill_in 'MainContentMainMaster_MainContent_txtInitialTimeSlot', with: '10:20'
    fill_in 'MainContentMainMaster_MainContent_txtFinalTimeSlot', with: '10:22'
  end
  
  When('Clicar no botão Salvar para salvar as alterações na Faixa horária.') do
    click_button 'ctl00$ctl00$MainContentMainMaster$MainContent$Button1'
  end
  

  Then('A seguinte mensagem será exibida: {string}.') do |string|
    expect(page).to have_content('Faixa Horária alterada com sucesso!')
  end


  