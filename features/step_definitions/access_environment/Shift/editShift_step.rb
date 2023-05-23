require 'login/login'
require 'common/findElements'
require 'shift/shiftElements'

login = Login.new
findElements = FindElements.new
shiftElements = Shift.new



Given('Que o usuário esteja na página que lista os turnos cadastrados.') do
    shiftElements.visit_shift
    login.make_Login
  end
  #@verifyResourcesPageListShift
  Then('Comparar os resources apresentados com os esperados na página de listagem de Turnos.') do
    expect(page).to have_content('Cadastro de Turno')
    expect(page).to have_content('10 últimas atualizações')
    expect(page).to have_content('Número')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Alterar')
    expect(page).to have_content('Excluir') 
  end
  
  #@verifyValuesComboBoxSearch
  Given('Que desmarque o checkbox {int} últimas atualizações.') do |int|
    find("input[type='checkbox']").set false
  end
  
  #@verifyValuesComboBoxSearch
  When('Obter os valores do combobox de pesquisa da tela de listagem de Turnos.') do
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[1]').text
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[2]').text
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[3]').text
  end
  
  Then('Comparar com os valores esperados: {string}, {string} e {string}') do |numero, descricao, faixaHoraria|
    msg = find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[1]').text
    expect(msg).to eql numero
    msg2 = find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[2]').text
    expect(msg2).to eql descricao
    msg3 = find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]/option[3]') .text
    expect(msg3).to eql faixaHoraria
  end
  
  #@searchNoResultsShift
  Given('Selecionar o {string} e {string}.') do |valorCombo, valorBusca|
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]').select valorCombo
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_txtTurnSearch"]').set valorBusca
  end
    
  When('Clicar em Buscar.') do
    click_button 'Buscar'
  end
  
  Then('Validar a informação apresentada ao usuário: {string}.') do |mensagem|
    msg = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gv_Turn"]/tbody/tr/td').text
    expect(msg).to eql mensagem
  end
  
  #@searchCorrectShift
  Then('Valida se o Turno foi encontrado.') do
    expect(page).to have_content(@valorBusca)
  end
  
  #@disassociateTimeSlotVerifyRequire
  Given('Procure e encontre o turno cadastrado pela automação.') do
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_ddlTurnSearch"]').select 'Número'
    find(:xpath, '//*[@id="MainContentMainMaster_TableFiltersHolder_txtTurnSearch"]').set 123456
    click_button 'Buscar'
    
  end
  
  Given('Clicar para editar o turno.') do
    click_button 'MainContentMainMaster_MainContent_gv_Turn_IMG_BUTTON_EDIT_0'
  end
  
  When('Desassociar a faixa horária {int}.') do |int|
  find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstSlots_lstRight"]/option').click
  find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstSlots_btnTransferToLeft"]').click
  end
  
  When('Clicar em Salvar.') do
    sleep 1
    click_button 'Salvar'
  end
  
  Then('Deve ser apresentada uma mensagem ao usuário: {string}') do |mensagem|
    msg = find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li[1]').text
    expect(msg).to eql mensagem
  end
  

  #@clearFieldsVerifyRequiredDescription
  Given('Preencher os campos Descrição {string} e Hora virada {string}.') do |descricao, horaVirada|
    find("input[id='MainContentMainMaster_MainContent_txtDescription']").set descricao
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set horaVirada
  end
  
  Then('Deve existir validação de obrigatoriedade do campo descrição: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
  end

  #@clearFieldsVerifyRequiredNull
  Then('Deve existir validação de obrigatoriedade do campo hora virada: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
  end


  #@clearFieldsVerifyRequiredInvalid
  Then('Deve existir validação do valor inserido no campo hora virada: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='A hora digitada é inválida!']")
  end                                                                                        

  #@clearFieldsVerifyRequiredWrong
  Given('Devo apagar o campo Hora virada') do                                  
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set ''
  end                                                                          
  Then('Deve existir validação do valor do campo hora virada: {string}') do |string|
    expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
  end

#@clearFieldsVerifyRequiredString
Then('Deve validar se o campo hora virada não foi preenchido com string: {string}') do |string| 
  expect(page).to have_selector("input[oldtitle='Informe a Hora virada']")
end                                                                                             

  #@verifyValuesShift  
  When('Obter os valores dos campos Descrição, Hora virada e Faixa horária.') do
    @descricao = find("input[id='MainContentMainMaster_MainContent_txtDescription']").value
    @horaVirada = find("input[id='MainContentMainMaster_MainContent_txtTime']").value
    @faixa = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstSlots_lstRight"]/option').text
   end
  
   Then('Os valores dos campos devem ser:  {string} e {string} e {string}') do |descr, hora, faixaHor|
    expect(@descricao).to eql descr
    expect(@horaVirada).to eql hora
    expect(@faixa).to eql faixaHor
  end
  
  #@editingShift
  Given('Alterar o campo Descrição para {string}.') do |descrição|
    find("input[id='MainContentMainMaster_MainContent_txtDescription']").set descrição
    sleep 1
  end
  
  Given('Alterar o campo Hora virada para {string}.') do |horaVirada|
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set horaVirada
    sleep 1
  end
  
  Given('Desassociar a faixa {int}.') do |int|
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstSlots_lstRight"]/option').click
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstSlots_btnTransferToLeft"]').click
  end
  
  Given('Associar a faixa {string}.') do |string|
    sleep 3
    find("option[value='999999']").click
    click_button 'MainContentMainMaster_MainContent_lstSlots_btnTransferToRight'
  end

  Then('O turno deve ser salvo com sucesso com as informações atualizadas.') do
    expect(page).to have_content('Turno alterado com sucesso!')
  end

  #@verifyValuesShiftAfterEdit
  Then('Os valores dos campos devem ser: {string} e {string} e {string}') do |descr, hora, faixaHor|
    expect(@descricao).to eql descr
    expect(@horaVirada).to eql hora
    expect(@faixa).to eql faixaHor
  end