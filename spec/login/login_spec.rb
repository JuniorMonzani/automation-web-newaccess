require "./login/Login.rb"

describe 'Valida o login do sistema', :login do
  #pede a senha correta do usuário 'admin' para ser utilizada posteriormente  
  login = Login.new
  $password = login.receiveCorrectPass

  before(:each) do
    login.visitLoginNewAccess
  end

  it     'Valida o login com um usuário inválido', :invalidUser do
    puts 'Valida o login com um usuário inválido'
    login.makeLogin('teste123','senha')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it     'Valida o login com senha incorreta', :invalidPass do
    puts 'Valida o login com senha incorreta'
    login.makeLogin('admin','senha123')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it     'Realiza login no sistema', :correctLogin do
    #valida se o título da página é o esperado
    puts 'Valida se o título da página é o esperado'
    expect(page.title).to eql 'Sistema de Controle de Acesso'

    puts 'Realiza login no sistema'
    login.makeLogin('admin', "#{$password}") 

    puts 'Valida se houve login correto no sistema'
    expect(page.title).to eql 'MD Acesso - Sistema de Controle de Acesso'   
  end
end