require 'login/login'
require 'physical_environment/communicationManager/CommunicationManager'
require 'common/findElements'
require 'common/constants'

communicationManager = CommunicationManager.new
findElements = FindElements.new
login = Login.new

@background
Given('Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.') do
  communicationManager.visit_List_Communication_Manager
      login.make_Login
end

Given('Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação.') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('Ao clicar no botão de exclusão.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('A mensagem apresentada deve ser: {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('Clicar no botão Não para não excluir o gerenciador.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Pesquisar e encontrar o gerenciador cadastrado pela automaçao confirmando que não foi excluído.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('Que pesquise e encontre o gerenciador de comunicação {string}.') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('Clicar no botão Sim da primeira mensagem apresentada.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('A mensagem apresentada deve ser validada conforme o esperado: {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('Clicar no botão Sim para excluir o gerenciador.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Pesquisar e não encontrar o gerenciador cadastrado pela automaçao confirmando que foi excluído.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('Que pesquise e encontre os gerenciadores de comunicação cadastrados pela automação.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Pesquisar e encontrar o gerenciador cadastrado pela automaçao confirmando que foi excluído.') do
  pending # Write code here that turns the phrase above into concrete actions
end