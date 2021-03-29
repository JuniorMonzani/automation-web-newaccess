require "./login/Login.rb"

describe 'Valida o login do sistema', :login do
  #pede a senha correta do usuário 'admin' para ser utilizada posteriormente  
  login = Login.new
  $password = login.receive_Correct_Pass

  before(:each) do
    login.visit_Login_NewAccess
  end

  it 'Valida o login com um usuário inválido', :invalidUser do
    puts 'Valida o login com um usuário inválido'
    login.make_Login('teste123','senha')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it 'Valida o login com senha incorreta', :invalidPass do
    puts 'Valida o login com senha incorreta'
    login.make_Login('admin','senha123')
    expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
  end

  it 'Realiza login no sistema', :correctLogin do
    #valida se o título da página é o esperado
    puts 'Valida se o título da página é o esperado'
    expect(page.title).to eql 'Sistema de Controle de Acesso'

    puts 'Realiza login no sistema'
    login.make_Login('admin', "#{$password}") 

    puts 'Valida se houve login correto no sistema'
    expect(page.title).to eql 'MD Acesso - Sistema de Controle de Acesso'   
  end
end