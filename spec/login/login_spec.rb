
describe 'Abre no browser o NewAccessII na nuvem e realiza testes de login', :login do

    it 'Abre no browser e valida se está na tela de login' do
        puts "Acessando a página - Sistema de Controle de Acesso"

        #abre a página especificada no browser
        visit "http://laboratorio.mdacesso.com.br/logon.aspx"
        #aguarda 3 segundos na página
        sleep 1
        #verifica se existe o título esperado na página
        expect(page.title).to eql "Sistema de Controle de Acesso"
    end

    it 'Valida o login com um usuário que não existe' do
        puts "Valida o login com um usuário que não existe"

        #abre a página especificada no browser
        visit "http://laboratorio.mdacesso.com.br/logon.aspx"
        #procura pelo id do campo de login e insere um usuário que não existe
        fill_in 'txtUsrLogin', with: 'teste123'
        #procura pelo id do campo de senha e insere a senha
        fill_in 'txtUserPassLogin', with: 'senha'
        #clica no botão Entrar
        click_button 'Submit1'

        sleep 1
        #Valida se a mensagem apresentada é a mensagem esperada
        expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'

    end

    it 'Valida o login informando a senha incorreta de um usuário existente' do
        puts "Valida o login informando a senha incorreta de um usuário existente"

        #abre a página especificada no browser
        visit "http://laboratorio.mdacesso.com.br/logon.aspx"
        #procura pelo id do campo de login e insere o usuário Admin
        fill_in 'txtUsrLogin', with: 'admin'
        #procura pelo id do campo de senha e insere a senha incorreta
        fill_in 'txtUserPassLogin', with: 'senha'
        #clica no botão Entrar
        click_button 'Submit1'

        sleep 1
        #Valida se a mensagem apresentada é a mensagem esperada
        expect(find('#businessError')).to have_content '- Senha ou login não conferem. Por favor, tente novamente.'
    end

end
