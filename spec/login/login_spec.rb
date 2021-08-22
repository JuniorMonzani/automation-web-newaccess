require "login/Login"

describe 'Realiza testes na página de de login do sistema.', :login do
  #pede a senha correta do usuário 'admin' para ser utilizada posteriormente  
  login = Login.new
  $password = login.receive_Correct_Pass

  before(:each) do
    login.visit_Login_NewAccess
  end

  context 'Valida login no sistema com:' do
    it 'Usuário inválido', :invalidUser do
      login.make_Login('teste123','senha')
      expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
    end

    it 'Senha incorreta', :invalidPass do
      login.make_Login('admin','senha123')
      expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'   
    end

    it 'Sucesso', :correctLogin do
      #valida se o título da página é o esperado
      expect(page.title).to eql 'Sistema de Controle de Acesso'
      login.make_Login('admin', "#{$password}") 
      expect(page.title).to eql 'MD Acesso - Sistema de Controle de Acesso'   
    end
  end
end