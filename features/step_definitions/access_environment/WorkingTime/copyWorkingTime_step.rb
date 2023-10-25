require 'login/login'
require 'access_environment/workingTime/workingTimeElements'
require 'common/findElements'

workingTimeElements = WorkingTime.new
login = Login.new



Given('Que o usuário esteja na página que lista as Jornadas cadastradas.') do
    workingTimeElements.visit_WorkingTime
    login.make_Login
  end
  
  Given('Buscar e encontrar a jornada cadastrado pela automação com a descrição {string}') do |desc|
    find('#MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch').set desc
    click_button 'Buscar'
    sleep 1
  end

  Then('O cadastro da Jornada não deve ter valor no campo Descrição.') do
    expect(find('#MainContentMainMaster_MainContent_txtWorkingTimeDescription')).to have_content ''
  end
  
  When('Clicar no botão de cópia da jornada cadastrado pela automação.') do
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0').click
  end
  
  When('Clicar no botão {string}') do |string|
    click_button 'Salvar'
  end

  Then('Deve ver a mensagem ao clonar a Jornada: {string}') do |mensagem|
    expect(page).to have_content mensagem
  end