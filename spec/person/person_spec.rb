require "./login/Login.rb"
require "./person/person.rb"

describe 'Realiza o login e acessa a página de cadastro de Pessoa', :person do
  accessPage = Person.new
  login = Login.new

  before(:each) do
    accessPage.visit_Register_Person
    login.make_Login('admin', "#{$password}")
  end

  it 'Realizando upload de foto no cadastro de Pessoa', :pictureUpload do
    puts 'Realizando upload de foto no cadastro de Pessoa'
    click_button 'Cadastrar'      
    # Obtem o diretório raiz de execução do projeto, assim da pra montar o caminho relativo das imagens
    @picture = Dir.pwd + '/spec/fixtures/MDAcesso.jpg'
    # No caso do Acesso, só consegui encontrar o elemento para fazer o upload de imagem com o Path, coxxnforme abaixo
    # Dessa forma eu informo a imagem no attach_file e depois faço um find procurando pelo path, onde deve clicar
    page.attach_file(@picture) do
      page.find(:xpath, '/html/body/form/div[11]/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div[2]/div[3]').click
    end
  end
end
