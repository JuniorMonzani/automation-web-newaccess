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
  When('Faço a pesquisa inserindo as letras {string}') do |valor|
    # find("input[type='checkbox']").set false
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set valor
    click_button 'Buscar'
  end
  
  Then('Devo retornar para a página de cadastro') do
    expect(page).to have_content('Cadastro de Faixa Horária')
  end
  
  #@verifySearchInvalidNumber
  When('Faço a pesquisa por um número não cadastrado: {string}') do |numero|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set numero
    click_button 'Buscar'
  end
  
  Then('Devo ver a mensagem: {string}') do |mensagem|
    msg = findElements.search_Xpath('//*[@id="MainContentMainMaster_MainContent_gridView"]/tbody/tr/td')
    expect(msg).to eql mensagem
  end
  
  #@verifySearchNumber
  When('Faço a pesquisa pelo número {string}') do |valor|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set valor
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
    fill_in 'MainContentMainMaster_TableFiltersHolder_txtSearch', with:'888888'
    click_button 'Buscar'
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
  When('Alterar a Hora inicial e Hora final com {string} e {string}') do |horaIni, horaFim|
    find('#MainContentMainMaster_MainContent_txtInitialTimeSlot').set horaIni
    find('#MainContentMainMaster_MainContent_txtFinalTimeSlot').set horaFim
  end
  
  When('Clicar no botão Salvar para salvar as alterações na Faixa horária.') do
    click_button 'Salvar'
  end
  
  Then('A seguinte mensagem será exibida: {string}.') do |string|
    expect(page).to have_content('Faixa Horária alterada com sucesso!')
  end


  