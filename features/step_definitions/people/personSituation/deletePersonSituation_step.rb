require 'login/login'
require 'common/findElements'
require 'people/person_situation/peopleElements'

login = Login.new
findElements = FindElements.new
peopleElements = People.new

#@verifyFirstMessageForExclusionPersonSituation
When('Clicar para excluir a Situação Pessoa alterada pela automação: {string}.') do |string|
    sleep 1
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_4').click
  end

  Then('Uma mensagem deve ser apresentada na tela de exclusão de situação pessoa: {string}') do |mensagem|
    expect(page).to have_content mensagem
  end
  
  Then('A Situação Pessoa não deve ser excluída sendo ainda apresentado na tela.') do
    expect(page).to have_content 'Aut.Permitido iiiiii'
  end
  
  When('Clicar para excluir a Situação Pessoa: {string}.') do |string|
    sleep 1
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_7').click
    #caso apresente falha na automação, verificar se a linha acima está apontando para o botão correto na tela.
  end
  
  Then('A Situação Pessoa não deve ser excluída apresentando na tela a mensagem: {string}') do |mensagem|
    expect(find(:xpath, '//*[@id="divIdBodyBusinessError"]/ul/li').text).to eql mensagem
  end
  
  #@verifyDeletionFirstPersonSituation
  When('Clicar para excluir a primeira Situação Pessoa: {string}.') do |string|
    sleep 1 
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_4').click
  end               
  
  #@verifyDeletionSecondPersonSituation
  When('Clicar para excluir a segunda Situação Pessoa: {string}.') do |string| 
    sleep 1 
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_1').click
  end                                                                          

  When('Clicar para excluir a terceira Situação Pessoa: {string}.') do |string|
    sleep 1 
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_2').click
  end

  When('Clicar para excluir a quarta Situação Pessoa: {string}.') do |string|
    sleep 1 
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_0').click
  end

  When('Clicar para excluir a quinta Situação Pessoa: {string}.') do |string|
    sleep 1 
    find('#MainContentMainMaster_MainContent_gridViewInstance_IMG_BUTTON_DELETE_0').click
  end

  Then('A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: {string}') do |mensagem|
    expect(page).to have_content(mensagem)
  end