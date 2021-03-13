require "./login/Login.rb"

describe 'Valida o login do sistema', :login do
  #pede a senha correta do usuário 'admin' para ser utilizada posteriormente
  correctLogin = Login.new
  password = correctLogin.receiveCorrectPass

  it     'Valida o login com um usuário inválido', :invalidUser do
    puts 'Valida o login com um usuário inválido'
    invalidUser = Login.new
    invalidUser.visitLoginNewAccess
    invalidUser.makelogin('teste123','senha')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it     'Valida o login com senha incorreta', :invalidPass do
    puts 'Valida o login com senha incorreta'
    invalidPass = Login.new
    invalidPass.visitLoginNewAccess
    invalidPass.makelogin('admin','senha123')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it     'Realiza login no sistema', :correctLogin do
      correctLogin.visitLoginNewAccess 
      #valida se o título da página é o esperado
      puts 'Valida se o título da página é o esperado'
      expect(page.title).to eql 'Sistema de Controle de Acesso' 
      puts 'Realiza login no sistema'
      correctLogin.makelogin('admin', "#{password}") 
      puts 'Valida se houve login correto no sistema'
      expect(page.title).to eql 'MD Acesso - Sistema de Controle de Acesso'   
  end
end