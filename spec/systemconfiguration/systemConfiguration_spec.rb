require "login/Login"
require "systemConfiguration/systemConfiguration"

describe 'Realiza testes na página de Configuração do Sistema.', :systemConfiguration do
  accessPage = SystemConfiguration.new
  login = Login.new

  before(:each) do
    accessPage.visit_System_Configuration
    login.make_Login('admin', "#{$password}")
  end

    it 'Selecionando um valor no campo "Tipo de coleta"', :selectCombo do
      select('Realtime sem coleta', from: 'MainContentMainMaster_MainContent_ddlCollectType')
    end

    it 'Uncheck Sincronismo de pessoas e credenciais', :uncheckBox do
      puts    'Desmarcando o checkbox de Sincronismo de pessoas e credenciais.'
      uncheck('MainContentMainMaster_MainContent_cbxSyncData')
    end

    it 'Check Sincronismo de pessoas e credenciais', :checkBox do
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

