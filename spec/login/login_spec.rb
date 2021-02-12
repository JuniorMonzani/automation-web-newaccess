
describe "Testes de login - MDAcesso (nuvem)" do
    it "abrir no browser o login do MDAcesso" do
        puts "Acessando a página - Sistema de Controle de Acesso"
            visit "http://laboratorio.mdacesso.com.br/logon.aspx"
            sleep 5
            expect(page.title).to eql "Sistema de Controle de Acesso"
        end
    end
