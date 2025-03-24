require 'login/login'
require 'system_environment/system_setup/communication_setup/systemConfiguration'
require 'common/findElements'
require 'common/constants'

  systemConfiguration = SystemConfiguration.new
  findElements = FindElements.new
  login = Login.new

  #background
    Given('Que o usuário esteja na página de Configuração do Sistema.') do
        systemConfiguration.visit_System_Configuration
        login.make_Login
    end

    #checkSynchronizePeople
      Given('Que eu encontre e marque o checkbox "Sincronizar dados de pessoas e credenciais".') do
        check('MainContentMainMaster_MainContent_cbxSyncData')
      end

      When('Encontrar e marcar o checkbox "Sincronizar biometria de pessoas entre".') do
        check('MainContentMainMaster_MainContent_cbxAutoSyncFingerprint')
      end

      And('Inserir os valores nos campos "de" e "até".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAutoSyncFingerprintFrom', '07:00')
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAutoSyncFingerprintTo', '23:59')
      end
        
      Then('Clicar no botão Salvar') do
        click_button 'Salvar'
      end

    #unCheckSynchronizePeople
      Given('Que eu encontre e desmarque o checkbox "Sincronizar dados de pessoas e credenciais".') do
        uncheck('MainContentMainMaster_MainContent_cbxSyncData')
      end

      When('O checkbox "Sincronizar biometria de pessoas entre" deve ficar desativado.') do
        expect(find('#MainContentMainMaster_MainContent_cbxAutoSyncFingerprint').disabled?).to be(true)
      end

      Then('Clicar no botão Salvar') do
        click_button 'Salvar'
        sleep 1
      end

           