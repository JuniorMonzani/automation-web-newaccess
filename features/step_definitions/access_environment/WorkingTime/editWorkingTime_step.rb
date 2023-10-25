require 'login/login'
require 'access_environment/workingTime/workingTimeElements'
require 'common/findElements'

workingTimeElements = WorkingTime.new
login = Login.new


Given('Que o usuário esteja na página que lista as Jornadas.') do
    workingTimeElements.visit_WorkingTime
    login.make_Login
  end
  
  Then('Comparar os resources apresentados com os esperados na página de listagem de Jornadas') do
    expect(page).to have_content 'Cadastro de Jornada'
    expect(page).to have_content '10 últimas atualizações'
    expect(page).to have_content 'Descrição'
    expect(page).to have_content 'Tipo'
    expect(page).to have_content 'Copiar'
    expect(page).to have_content 'Alterar'
    expect(page).to have_content 'Excluir'
  end
  
  Given('Clico no botão alterar da Jornada {string}') do |desc|
    find('#MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch').set desc
    click_button 'Buscar'
    sleep 1
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0').click
  end
  
  When('Obter os valores do combobox Tipo da tela de alteração da Jornada') do
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType')
  end
  
  Then('Comparar com os valores esperados do campo tipo: {string}, {string}, {string}') do |sem, men, per|
    expect(page).to have_content(sem)
    expect(page).to have_content(men)
    expect(page).to have_content(per)
  end
  
  When('Obter os valores dos campos Descrição, Tipo e Segunda-Feira .') do
    @desc = find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').value
    @tipo = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlWorkingTimeType"]/option[1]').text
    @dia = find(:xpath, '//*[@id="WorkingTimeShift|2"]').value
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados {string} , {string} , {string}.') do |descricao, sem, dias|
    expect(@desc).to eql descricao
    expect(@tipo).to eql sem
    expect(@dia).to eql dias
  end
  
  Given('Inserir no campo Descrição o valor {string} e no campo Tipo o valor {string} na tela de Jornada.') do |desc, tipo| 
    find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').set desc
    find('#MainContentMainMaster_MainContent_ddlWorkingTimeType').select tipo
    sleep 2                                                  
  end                                                                                                                            
    
  Given('Inserir no campo do dia primeiro o valor {string}') do |dia|       
    find(:xpath, '//*[@id="WorkingTimeShift|1"]').set dia
  end                                                                          

  When('Obter o tamanho do campo Descrição da tela de Jornada.') do                    
    @tam = find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').value.length        
  end                                                                                  
                                                                                       
  Then('O tamanho obtido do campo Descrição da Jornada deve ser {string}.') do |desc|
      expect(@tam).to eql (desc).to_i   
  end                                                                                  


  When('Obter os valores dos campos {string} e {string} da Jornada.') do |desc1, tipo1|                         
    @desc1 = find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription').value
    @tipo1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlWorkingTimeType"]/option[2]').text                     
  end                                                                                                              
                                                                                                                   
  Then('Devem ser exatamente os valores que foram alterados na Jornada {string} e {string}') do |desc, tipo|  
    sleep 3
    expect(@desc1).to eql desc
    expect(@tipo1).to eql tipo                              
  end                                                                                                              


  #campos de autopreenchimento
  #@verifyWorkingTimeAutoCompletarFimSemana
  When('Obter os valores dos campos Domingo e Sábado.') do
    @dom = find(:xpath, '//*[@id="WorkingTimeShift|1"]').value
    @sab = find(:xpath, '//*[@id="WorkingTimeShift|7"]').value
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados na Jornada {string} e {string}') do |domingo, sabado|
    expect(@dom).to eql domingo
    expect(@sab).to eql sabado
  end

#@verifyWorkingTimeAutoCompletarDiasUteis
  When('Obter os valores dos campos de dias úteis.') do
    @seg = find(:xpath, '//*[@id="WorkingTimeShift|2"]').value
    @ter = find(:xpath, '//*[@id="WorkingTimeShift|3"]').value
    @quar = find(:xpath, '//*[@id="WorkingTimeShift|4"]').value
    @qui = find(:xpath, '//*[@id="WorkingTimeShift|5"]').value
    @sex = find(:xpath, '//*[@id="WorkingTimeShift|6"]').value
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados na Jornada {string}, {string}, {string}, {string}, {string}') do |segunda, terça, quarta, quinta, sexta|
    expect(@seg).to eql segunda
    expect(@ter).to eql terça
    expect(@quar).to eql quarta
    expect(@qui).to eql quinta
    expect(@sex).to eql sexta
  end

#@verifyWorkingTimeAutoCompletarMensalUmDia
  When('Obter os valores dos campos do dia primeiro e trinta e um.') do
    @pri = find(:xpath, '//*[@id="WorkingTimeShift|1"]').value
    @trinta = find(:xpath, '//*[@id="WorkingTimeShift|31"]').value
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados na Jornada Mensal {string} e {string}') do |primeiro, trintaUm|
    expect(@pri).to eql primeiro
    expect(@trinta).to eql trintaUm
  end

  Then('Devem ser exatamente os valores que foram cadastrados na Jornada Total {string} e {string}') do |prim, trin|
    expect(@pri).to eql prim
    expect(@trinta).to eql trin
  end
