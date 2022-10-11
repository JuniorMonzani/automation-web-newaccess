require 'login/login'
require 'common/findElements'

login = Login.new

#background
Given('Que o usuário esteja na página de login do sistema.') do
    login.visit_Login_NewAccess
end

  #invalidLoginTests
    Given('Que insira o login do usuário no campo {string}') do |string|
      fill_in 'txtUsrLogin', with: string
    end
    
    Given('Informe a senha no campo {string}') do |string|
      fill_in 'txtUserPassLogin', with: string
    end
    
    When('Clicar em Entrar.') do
      click_button 'Submit1'
    end
    
    Then('Validar a mensagem de alerta: {string}') do |string|
      expect(find('#divIdBodyBusinessError')).to have_content string
    end


  #correctLogin
    Given('Que no campo "Login" eu informe um usuário que existe cadastrado com a senha válida.') do
        login.receive_login('Admin', $passwordAdmin) 
      end

      Then('O login deve ser realizado com sucesso sendo direcionado para a página inicial.') do
        expect(page.title).to eql 'DMP Access II - Sistema de Controle de Acesso'
      end









