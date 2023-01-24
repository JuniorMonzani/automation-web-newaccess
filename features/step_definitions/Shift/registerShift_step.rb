require 'login/login'
require 'common/findElements'
require 'shift/shiftElements'

login = Login.new
findElements = FindElements.new
shiftElements = Shift.new


#background
Given('Que o usuário esteja na página de cadastro de Turno.') do
    shiftElements.visit_shift
    login.make_Login
  end
  
  #@verifyResourcesShift
  Then('Comparar os resources apresentados com os esperados na página de cadastro de Turno.') do
    expect(page).to have_content('Cadastro de Turno')
    expect(page).to have_content('10 últimas atualizações')
    expect(page).to have_content('Número')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Alterar')
    expect(page).to have_content('Excluir')    
  end
  
  
  #@verifyRequiredShiftFieldNumber
  Given('Que clico em {string}') do |string|
    click_button 'Cadastrar'
  end

  When('Preencho os campos Número {string} e Descrição {string} e Hora Virada {string}') do |numero, descricao, horaVirada|
    find("input[id='MainContentMainMaster_MainContent_txtNumber']").set numero
    find("input[id='MainContentMainMaster_MainContent_txtDescription']").set descricao
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set horaVirada
  end
  
  When('Clicar no botão Salvar.') do
    click_button 'Salvar'
  end

  Then('Deve existir validação de obrigatoriedade do campo número: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='Informe o Número']")
  end
  
  #@verifyRequiredShiftFieldHour
  Then('Deve informar que a hora virada é um valor inválido: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='A hora digitada é inválida!']")
  end

  #@verifyRequiredShiftFieldWithoutHour
  Then('Deve informar que a hora virada não foi preenchida: {string}') do |string| 
    expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
  end                                                                              


#@verifyRequiredShiftFieldWrongHour
Then('Deve solicitar o preenchimento do campo hora virada: {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
end

#@verifyRequiredShiftFieldStringHour
Then('Deve solicitar que o campo hora virada seja preenchido: {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
end                                                                                 
  
  
  #@verifyMessageSaveWithoutTimeSlot
  Given('Preencher o campo Número com valor {string}.') do |numero|
    click_button 'Cadastrar'
    find("input[id='MainContentMainMaster_MainContent_txtNumber']").set numero
  end
  
  Given('Preencher o campo Descrição com valor {string}.') do |descricao|
    find("input[id='MainContentMainMaster_MainContent_txtDescription']").set descricao
  end
  
  Given('Preencher o campo Hora virada com valor {string}.') do |horaVirada|
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set horaVirada
  end

  Then('Será apresentada uma mensagem ao usuário: {string}') do |mensagem|
    msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li[1]').text
    expect(msg).to eql mensagem
  end
  
  #@verifyMessageSaveSameNumberShift
  When('Preencho os campos {string} e {string} e {string}') do |numero, descricao, horaVirada|
    click_button 'Cadastrar'
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtNumber"]').set numero
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtDescription"]').set descricao
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtTime"]').set horaVirada
  end
  
  When('Associar a faixa horária {int}.') do |int|
    find("option[value='1']").click
    click_button 'MainContentMainMaster_MainContent_lstSlots_btnTransferToRight'
    end
    
    Then('O turno não deve ser salvo apresentando as seguintes validações: {string}.') do |mensagem|
      msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]')
      expect(msg).to have_content(mensagem)
    end
  
    #@verifyMessageIntersectionBetweenTimesShift  
    Given('Associar uma faixa horária {string}.') do |string|
      click_button 'Cadastrar'
      find("option[value='1']").click
      click_button 'MainContentMainMaster_MainContent_lstSlots_btnTransferToRight'
      sleep 3 #colocado esse sleep pois, após inserir a primeira faixa, o sistema carrega a página e não dava tempo de fazer a inserção seguinte
    end
    
    When('Tentar associar faixa horária {string}.') do |string|
      find("option[value='999999']").click
      click_button 'MainContentMainMaster_MainContent_lstSlots_btnTransferToRight'
      end
    
    Then('Deve ser apresentada uma mensagem ao usuário: {string} e {string}') do |mensagem, mensagem2|
      msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul')
      expect(msg).to have_content(mensagem)  

      msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul')
      expect(msg).to have_content(mensagem2)  
    end

    Given('Associar a faixa horária {string}.') do |string|                      
      find("option[value='1']").click
      click_button 'MainContentMainMaster_MainContent_lstSlots_btnTransferToRight'
    end                                                                          
                                                                                 
    Then('Deve exibir a mensagem {string}.') do |mensagem|
      expect(page).to have_content(mensagem)
    end      
    

    