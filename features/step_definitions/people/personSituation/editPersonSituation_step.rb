require 'login/login'
require 'common/findElements'
require 'people/person_situation/peopleElements'

login = Login.new
findElements = FindElements.new
peopleElements = People.new

#background
Given('Que o usuário esteja na página que lista as Situações de Pessoas.') do
    peopleElements.visit_person
    login.make_Login
  end
  
  #@verifyResourcesPageListPersonSituation
  Then('Comparar os resources apresentados com os esperados na página de listagem de Situação de Pessoas.') do
    expect(page).to have_content('Cadastro de Situação de Pessoa')
    expect(page).to have_content('10 últimas atualizações')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Tipo')
    expect(page).to have_content('Alterar')
    expect(page).to have_content('Excluir')
  end
  
  Given('Clico no botão alterar da Situação: {string}') do |string|
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_EDIT_4').click
  end
  
  #@verifyValuesComboBoxTypePersonSituation
  When('Obter os valores do combobox Tipo da tela de alteração da Situação de Pessoas') do
    @tipo1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[1]').text
    @tipo2 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[2]').text
    @tipo3 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[3]').text
    @tipo4 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[4]').text
    @tipo5 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[5]').text
    @tipos = [@tipo1, @tipo2, @tipo3, @tipo4, @tipo5]
  end
  
  Then('Comparar com os valores esperados do campo tipo: {string}') do |combo|
     text = @tipos.find {|item| item.include?(combo)}
     expect(text).to eql combo
  end

  #@verifyValuesPersonSituationFields
  When('Obter os valores dos campos Descrição e Tipo .') do
    @descValor = find('#MainContentMainMaster_MainContent_txtDescription').value
    @tipoValor = find('#MainContentMainMaster_MainContent_ddlAccessType').text
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados {string} e {string}.') do |desc, tipo|
    expect(@descValor).to have_content desc
    expect(@tipoValor).to have_content tipo
  end
  
  #@editPersonSituationFields
  Given('Inserir no campo Descrição o valor {string} e no campo Tipo o valor {string}.') do |desc, tipo|
    find('#MainContentMainMaster_MainContent_txtDescription').set desc
    find('#MainContentMainMaster_MainContent_ddlAccessType').select tipo
  end
  
  Then('A Situação de Pessoa deve ser salvo com sucesso: {string}') do |mensagem|
    expect(page).to have_content mensagem
  end
  
  #@verifyLenghtFieldPersonSituationDescription
  When('Obter o tamanho do campo Descrição.') do
    @tamanho = find('#MainContentMainMaster_MainContent_txtDescription').value.length
  end
  
  Then('O tamanho obtido do campo Descrição deve ser {string}.') do |valor|
    expect(@tamanho).to eql (valor).to_i
  end
  
  #@verifyValuesAfterEditPersonSituation
  When('Obter os valores dos campos {string} e {string}.') do |desc1, tipo1|
    @desc1 = find('#MainContentMainMaster_MainContent_txtDescription').value
    @tipo1 = find(:xpath, '//*[@id="MainContentMainMaster_MainContent_ddlAccessType"]/option[2]').text
  end
  
  Then('Devem ser exatamente os valores que foram alterados {string} e {string}') do |desc, tipo|
    sleep 3
    expect(@desc1).to eql desc
    expect(@tipo1).to eql tipo
    
  end