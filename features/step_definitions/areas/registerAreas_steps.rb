require 'login/login'
require 'areas/Areas'
require 'commom/findElements'
require 'commom/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new
  $password = login.receive_Correct_Pass

  @background
    Given('Que o usuário esteja na página de cadastro de Áreas.') do
      areas.visit_Register_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyLabelsAreas
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de áreas.') do
        expect(page).to have_content('Número')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Capacidade')
      end