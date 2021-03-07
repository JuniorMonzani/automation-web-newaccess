describe  'Realiza o login e acessa a página de cadastro de Pessoa', :person do
  title = 'Acessa a página e realiza testes diversos na tela de cadastro de Pessoa'

  context 'Realizando testes diversos na tela de cadastro de Pessoa', :openRegisterPerson do
    before(:each) do
      visit 'http://laboratorio.mdacesso.com.br/Person/PersonsLst.aspx'
      sleep 1
      fill_in      'txtUsrLogin',      with: 'admin'
      fill_in      'txtUserPassLogin', with: 'madis2020@'
      click_button 'Submit1'
      sleep 1
      click_button 'Cadastrar'
      sleep 1
      # Obtem o diretório raiz de execução do projeto, assim da pra montar o caminho relativo das imagens
      @picture = Dir.pwd + '/spec/fixtures/MDAcesso.jpg'
    end

    it     'Realizando upload de foto no cadastro de Pessoa', :pictureUpload do
      puts 'Realizando upload de foto no cadastro de Pessoa'
      # No caso do Acesso, só consegui encontrar o elemento para fazer o upload de imagem com o Path, coxxnforme abaixo
      # Dessa forma eu informo a imagem no attach_file e depois faço um find procurando pelo path, onde deve clicar
      page.attach_file(@picture) do
        page.find(:xpath, '/html/body/form/div[11]/div[2]/div[2]/div[2]/div[1]/div/div/div[1]/div[2]/div[3]').click
      end
      sleep 2
      # $caminhoImg = page.find('#MainContentMainMaster_MainContent_PersonImage')
      # guarda na variavel a busca pelo elemento através do xPath
      # picturePerson = page.find(:css, '#MainContentMainMaster_MainContent_PersonImage')
      # puts 'Valida se o upload da foto foi realizado com sucesso'
      # puts 'caminhoIMG' + picturePerson.to_s
      # page.not_matches_xpath?('elemento')
      # @element = find('#MainContentMainMaster_MainContent_PersonImage')
      # expect(@element).to not_matches_xpath('src="../PersonImagesPath/emptyAvatar.jpg')
      # expect(@element.not_matches_xpath?('src="../PersonImagesPath/emptyAvatar.jpg')).to be true
      # @nomeimg = find('img[src="../PersonImagesPath/emptyAvatar.jpg"]')
      # puts "Nome da img: " + @nomeimg.to_s
    end
  end
end
