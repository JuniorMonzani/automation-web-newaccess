require 'login/login'
require 'common/findElements'
require 'holiday/holidayElements'

login = Login.new
findElements = FindElements.new
holidayElements = Holiday.new



#background
  Given('Que o usuário esteja na página que lista os feriados cadastrados.') do
    holidayElements.visit_holiday
    login.make_Login
  end
  #@verifyResourcesPageListHoliday
  Then('Comparar os resources apresentados com os esperados na página de listagem de Feriados.') do
    expect(page).to have_content('Cadastro de Feriado')
    expect(page).to have_content('10 últimas atualizações')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Mês')
    expect(page).to have_content('Grupo')
    expect(page).to have_content('Data')
    expect(page).to have_content('Copiar')
    expect(page).to have_content('Alterar')
    expect(page).to have_content('Excluir')
  end
  
  #@verifyValuesComboBoxMonthSearchHoliday
  When('Obter os valores do combobox Mês da tela de listagem de feriados.') do
   find('#MainContentMainMaster_TableFiltersHolder_ddlMonthSearch')
  end
  
  Then('Comparar com os valores esperados: {string}') do |meses|
    expect(page).to have_content(meses)
  end
  
  #@verifyValuesComboBoxGroupSearchHoliday
  When('Obter os valores do combobox Grupo da tela de listagem de feriados.') do
    @option01 = find('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch').find("option[value='-1']").text
    @option1 = find('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch').find("option[value='1']").text
    @option2 = find('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch').find("option[value='2']").text
  end
  
  Then('Os valores obtidos devem ser exatamente os valores esperados: {string}, {string}, {string}') do |todos, port, lab|
    expect(@option01).to eql todos
    expect(@option1).to eql port
    expect(@option2).to eql lab
  end
  
  #@searchNoResultsHoliday
  Given('Inserir os valores nos campos descrição {string} mês {string} e grupo {string}.') do |descricao, mes, grupo|
    find('input[id$=txtDescriptionSearch]').set descricao
    find('#MainContentMainMaster_TableFiltersHolder_ddlMonthSearch').select mes
    find('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch').select grupo
  end

  Then('Validar a informação apresentada ao usuário na tela de feriado: {string}.') do |mensagem|
    expect(page).to have_content(mensagem)
  end

  #@verifyValuesHolidayFields
  Given('Buscar e encontrar o feriado cadastrado pela automação com Descrição {string}.') do |string|
    find('input[id$=txtDescriptionSearch]').set 'Teste Automação iiiiiiiiiiiiii	'
    click_button 'Buscar'
  end
  
  Given('Clicar no botão de alteração do feriado cadastrado pela automação.') do
    find('input[id$=IMG_BUTTON_EDIT_0]', wait: 1).click
  end
  
  When('Obter os valores dos campos Descrição, Data e Grupo associado.') do
    @descricao = find('#MainContentMainMaster_MainContent_txtHolidayDescription').value
    @data = find('#MainContentMainMaster_MainContent_txtHolidayDate').value
    @grupo = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstEquipmentGroup_lstRight"]/option').text 
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados {string}, {string} e {string}.') do |desc, date, group |
    expect(@descricao).to eql desc
    expect(@data).to eql date
    expect(@grupo).to eql group
  end

  #@editHolidayFields
  Given('Inserir no campo Descrição o valor {string}, no campo Data o valor {string}, desassociar o Grupo {string} e associar o grupo {string}') do |desc, data, grupo1, grupo2|
    find('input[id$=txtHolidayDescription').set desc
    find('input[id$=txtHolidayDate').set data
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstEquipmentGroup_lstRight"]/option').click
    click_button 'MainContentMainMaster_MainContent_lstEquipmentGroup_btnTransferToLeft'
    find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstEquipmentGroup_lstLeft"]/option[2]').click
    click_button 'MainContentMainMaster_MainContent_lstEquipmentGroup_btnTransferToRight'
  end
  
  Then('O feriado deve ser salvo com sucesso.') do
    expect(page).to have_content('Feriado alterado com sucesso')
  end

  #@verifyLenghtFieldSearchHoliday
  Given('Buscar e encontrar o feriado alterado pela automação com Descrição {string}.') do |string| 
    find('input[id$=txtDescriptionSearch]').set 'Teste alteração Automação iiiiiiiiiiiiiiiii'
    click_button 'Buscar'
  end                                                                                               
                                                                                                    
  When('Obter o tamanho do campo Descrição e Data.') do                                             
    @tamDesc = find('input[id$=txtHolidayDescription').value.length
    @tamData = find('input[id$=txtHolidayDate').value.length
  end                                                                                               
                                                                                                    
  Then('O tamanho obtido do campo Descrição deve ser {string} e o campo Data deve ser {string}.') do |desc, data|
    expect(@tamDesc).to eql (desc).to_i
    expect(@tamData).to eql (data).to_i
  end

  Given('Buscar e encontrar o feriado alterado pela automação com o grupo {string}.') do |grupo|                       
    find('input[id$=txtDescriptionSearch]').set 'Teste alteração Automação iiiiiiiiiiiiiiiii'
    find('#MainContentMainMaster_TableFiltersHolder_ddlGroupSearch').select grupo
    click_button 'Buscar'
  end                                                                                                                     
                                                                                                                          
  Then('Devem ser exatamente os valores que foram alterados {string}, {string} e {string}.') do |desc, data, grupo|
    expect(find('input[id$=txtHolidayDescription').value).to eql desc
    expect(find('input[id$=txtHolidayDate').value).to eql data
    expect(find(:xpath, '//*[@id="MainContentMainMaster_MainContent_lstEquipmentGroup_lstRight"]/option').text).to eql grupo
  end                                                                                                                     
                                                                                                                          