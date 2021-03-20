require "./login/Login.rb"
require "./systemconfiguration/systemConfiguration.rb"

describe 'Realiza o login e acessa a página de configuração do sistema', :systemConfiguration do
  accessPage = SystemConfiguration.new
  login = Login.new

  before(:each) do
    accessPage.visitSystemConfiguration
    login.makeLogin('admin', "#{$password}")
  end

    it 'Encontrando o elemento "Tipo de coleta" e selecionando um valor.', :selectCombo do
      puts 'Encontrando o elemento "Tipo de coleta" e selecionando um valor.'
      select('Realtime sem coleta', from: 'MainContentMainMaster_MainContent_ddlCollectType')
    end

    it 'Desmarcando o checkbox de Sincronismo de pessoas e credenciais.', :uncheckBox do
      puts    'Desmarcando o checkbox de Sincronismo de pessoas e credenciais.'
      uncheck('MainContentMainMaster_MainContent_cbxSyncData')
    end

    it 'Marcando o checkbox de Sincronismo de pessoas e credenciais.', :checkBox do

      puts    'Marcando o checkbox de Sincronismo de pessoas e credenciais.'
      check('MainContentMainMaster_MainContent_cbxSyncData')
    end

    it 'Selecionando radio Buttons na aba Acesso', :radioButton do
      click_link 'Acesso'
      puts 'Selecionando o radioButton "Ao associar credencial provisória à pessoa..."'
      find('input[value=rdAssociatingProvisionalPreventOriginal]').click

      puts 'Selecionando o radioButton "Bloqueia a pessoa se a mesma possuir uma credencial..."'
      find('input[value=rdBlockPersonIfUseOriginal]').click

      puts 'Selecionando o radioButton "Ao passar credencial original..."'
      find('input[value=rdPassingOriginalDisassociateProvisional]').click
    end
end

