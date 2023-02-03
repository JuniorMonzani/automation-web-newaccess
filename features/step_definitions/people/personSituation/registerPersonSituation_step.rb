require 'login/login'
require 'common/findElements'
require 'people/person_situation/peopleElements'

login = Login.new
findElements = FindElements.new
peopleElements = People.new

#background
Given('Que o usuário esteja na página de cadastro de Situação de Pessoa.') do
    peopleElements.visit_person
    login.make_Login
    click_button 'Cadastrar'
  end

  #@verifyResourcesPersonSituation
  Then('Comparar os resources apresentados com os esperados na página de cadastro de Situação de Pessoa.') do
    expect(page).to have_content('Cadastrar Situação de Pessoa')
    expect(page).to have_content('Descrição')
    expect(page).to have_content('Tipo')
  end

  #@verifyRequiredFieldsPersonSituationDescription
  Given('Preencher o campo Descrição da tela Situação de Pessoa com valor {string}.') do |descricao|
    find('input[id$=txtDescription]').set descricao
  end
  
  Given('Preencher o campo Descrição e Tipo da tela Situação de Pessoa com valor {string} e {string}.') do |descricao, tipo|
    find('input[id$=txtDescription]').set descricao
    find('#MainContentMainMaster_MainContent_ddlAccessType').select tipo
  end

  Then('Deve apresentar a mensagem de validação: {string}.') do |mensagem|
    expect(page).to have_content mensagem
  end