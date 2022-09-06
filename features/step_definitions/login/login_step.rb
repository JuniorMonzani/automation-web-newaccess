require 'login/login'
require 'common/findElements'

login = Login.new

#background
Given('Que o usuário esteja na página de login do sistema.') do
    login.visit_Login_NewAccess
end

#invalidUser
  Given('Que no campo "Login" eu informe um usuário que não existe cadastrado e informe a senha.') do
    login.receive_login('teste123', 'teste123') 
  end

  When('Quando clicar em "Entrar".') do
    click_button 'Submit1'
  end

  Then('Uma mensagem deve ser apresentada informando que o usuário é inexistente.') do
    expect(find('#divIdBodyBusinessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'    
  end

