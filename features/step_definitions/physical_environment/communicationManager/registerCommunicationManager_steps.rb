require 'login/login'
require 'physical_environment/communicationManager/CommunicationManager'
require 'common/findElements'
require 'common/constants'

  communicationManager = CommunicationManager.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página de cadastro de Gerenciador de Comunicação.') do
      communicationManager.visit_Register_Communication_Manager
      login.make_Login
    end

    #TESTES NA ABA: GERAL
    @verifyResourcesTabGeneralCommManager
      Given('Que eu selecione a aba "Geral".') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabGeneral"]').click
      end

      Then('A aba "Geral" deve conter os resources esperados.') do
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Serviço de Comunicação')
        expect(page).to have_content('Nome da máquina')
        expect(page).to have_content('Porta')
        expect(page).to have_content('Tipo de gerenciador')
        expect(page).to have_content('Configuração do modo server')
        expect(page).to have_content('Endereço IP')
        expect(page.has_xpath?('//*[@id="lblPortServer"]')).to be_truthy
        expect(page).to have_content('Chave de criptografia')
      end

    @fieldDescriptionRequiredCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Descrição.') do
        communicationManager.fills_In_Communication_Manager_Client(' ', 'DESKTOP-JFU00CN', '5000')
      end

      When('Clicar no botão Salvar para validar o campo "Descrição" em Gerenciador de Comunicação.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo Descrição pois o mesmo é obrigatório.') do
        expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
      end

    @fieldMachineNameRequiredCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Nome da Máquina.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', ' ', '5000')
      end

      When('Clicar no botão Salvar para validar o campo "Nome da Máquina" em Gerenciador de Comunicação.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo Nome da máquina pois o mesmo é obrigatório.') do
        expect(page).to have_selector("input[oldtitle='Informe o Nome da máquina']")
      end

    @fieldPortRequiredCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Porta.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', 'DESKTOP-JFU00CN', ' ')
      end

      When('Clicar no botão Salvar para validar o campo Porta em Gerenciador de Comunicação.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação no campo Porta pois o mesmo é obrigatório.') do
        expect(page).to have_selector("input[oldtitle='Informe a Porta']")
      end

    @verifyTypeFieldPortCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar caracteres alfanuméricos.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', 'DESKTOP-JFU00CN', 'Port')
      end

      When('Clicar no botão Salvar para validar o tipo do campo "Porta".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação de obrigatoriedade no campo Porta pois o mesmo só aceita numérico.') do
        expect(page).to have_selector("input[oldtitle='Informe a Porta']")
      end

    @verifyFieldPortZeroCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar o valor "0".') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', 'DESKTOP-JFU00CN', '0')
      end

      When('Clicar no botão Salvar para validar o tipo do campo "Porta" como 0.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação onde o campo Porta é inválido pois é 0.') do
        expect(page).to have_selector("input[oldtitle='Porta inválida']")
      end

    @verifyFieldPortInvalidCommManager
      Given('Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar o valor "99999".') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', 'DESKTOP-JFU00CN', '99999')
      end

      When('Clicar no botão Salvar para validar o tipo do campo "Porta" como 99999.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existgir uma validação onde o campo Porta é inválido pois é 99999.') do
        expect(page).to have_selector("input[oldtitle='Porta inválida']")
      end

    @verifyValuesFieldTypeManagerCommManager
      Given('Obter todos os valores do combobox Tipo de Gerenciador e validar com os valores esperados.') do
        $valuesManagerType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTypeManager', $MANAGER_TYPE)
      end

      Then('Deve conter todos os valores esperados no combobox Tipo de Gerenciador.') do
        expect($valuesManagerType).to be_truthy
      end

    @verifyDefaultValueFieldTypeManagerCommManager
      Given('Que eu verifique o valor default do combobox Tipo de Gerenciador.') do
        $valuesDefaultManagerType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTypeManager', $DEFAULT_MANAGER_TYPE)
      end

      Then('O valor default deve corresponder ao valor "Client".') do
        expect($valuesDefaultManagerType).to be_truthy
      end

    @verifyDisabledFieldIPAddressCommManager
      Given('Que o tipo de gerenciador seja Client_08.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Client')
      end

      Then('O campo Endereço IP deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtIPAddressServer').disabled?).to be(true)
      end

    @verifyDisabledFieldPortCommManager
      Given('Que o tipo de gerenciador seja Client_09.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Client')
      end

      Then('O campo Porta deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtPortServer').disabled?).to be(true)
      end

    @verifyDisabledFieldEncryptionKeyCommManager
      Given('Que o tipo de gerenciador seja Client_10.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Client')
      end

      Then('O campo Chave de Criptografia deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtEncryptionKey').disabled?).to be(true)
      end

    @fieldIPAddressRequiredCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_11.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_11.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Limpar o campo "Endereço IP".') do
        communicationManager.fills_In_Communication_Manager_Server(' ', '5001', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em "Salvar" para validar o campo Endereço IP_11.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Endereço IP pois o mesmo é obrigatório quando o gerenciador é Server.') do
        expect(page).to have_selector("input[oldtitle='Informe o Endereço IP']")
      end

    @fieldIPAddressInvalidCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_16.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_16.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('No campo "Endereço IP" informar o valor "1234567890"_16.') do
        communicationManager.fills_In_Communication_Manager_Server('1234567890', '5001', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em "Salvar" para validar o campo Endereço IP_16.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Endereço IP informando que o mesmo deve conter um IP válido.') do
        expect(page).to have_selector("input[oldtitle='Entre com um Endereço IP válido']")
      end

    @fieldPortServerRequiredCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_12.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_12.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Limpar o campo "Porta" do servidor_01.') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em salvar para validar o campo Porta do servidor_16.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Porta do servidor pois o mesmo é obrigatório quando o gerenciador é Server.') do
        expect(page).to have_selector("input[oldtitle='Informe a Porta']")
      end

    @fieldPortServerZeroCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_17.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_17.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Preencher o campo "Porta" do servidor com valor "0".') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '0', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em salvar para validar o campo Porta do servidor_17.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Porta do servidor é inválido por ser 0.') do
        expect(page).to have_selector("input[oldtitle='Porta inválida']")
      end

    @fieldPortServerMaxSizeCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_18.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_18.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Preencher o campo "Porta" do servidor com valor "99999".') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '99999', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em salvar para validar o campo Porta do servidor_18.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Porta do servidor é inválido por ser 99999.') do
        expect(page).to have_selector("input[oldtitle='Porta inválida']")
      end

    @fieldEncryptionKeyRequiredCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_13.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_13.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Limpar o campo "Chave de Criptografia".') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '5000', '')
      end
 
      When('Clicar em salvar para validar o campo Chave de Criptografia_13.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo Chave de Criptografia pois o mesmo é obrigatório quando o gerenciador é Server.') do
        expect(page).to have_selector("input[oldtitle='Informe a Chave de criptografia']")
        sleep 3
      end

    @verifyTypePortServerCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_14.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_14.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Limpar o campo "Porta" do servidor_02.') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '', '0000000001-0000000001-0000000001-0000000001')
      end

      And('Tentar preencher o campo Porta do servidor com caracteres alfanuméricos.') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', 'Porta', '0000000001-0000000001-0000000001-0000000001')
      end
 
      When('Clicar em salvar para validar o campo Porta do servidor_19.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação de obrigatoriedade no campo Porta do servidor pois o mesmo não aceita alfanuméricos e ficará vazio.') do
        expect(page).to have_selector("input[oldtitle='Informe a Porta']")
      end

    @verifyTypeEncryptionKeyCommManager
      Given('Preencher os campos para inclusão do Gerenciador de Comunicação_15.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5000')
      end

      And('Alterar o combobox Tipo de Gerenciador para "Server"_15.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Limpar o campo "Chave de Criptografia" do servidor.') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '5000', '')
      end

      And('Tentar preencher o campo "Chave de Criptografia" com caracteres alfanuméricos.') do
        communicationManager.fills_In_Communication_Manager_Server('0.0.0.0', '5000', 'Chave de criptografia')
      end
 
      When('Clicar em salvar para validar o campo Chave de Criptografia_15.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação de obrigatoriedade no campo Chave de Criptografia pois o mesmo não aceita alfanuméricos e ficará vazio.') do
        expect(page).to have_selector("input[oldtitle='Informe a Chave de criptografia']")
      end

    @verifyDisableTabSerialPortsForServerType
      Given('Alterar o combobox Tipo de Gerenciador para "Server"_19.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
        sleep 1
      end

      Then('Verificar se a aba "Portas Seriais" fica desabilitada.') do
        expect(page.has_no_selector?('#MainContentMainMaster_MainContent_tabSerialPorts')).to be_truthy
      end

    @verifyDisableTabsAlertsAndSerialPortsForExpImpType
      Given('Alterar o combobox Tipo de Gerenciador para "Exportação e Importação".') do 
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Exportação / Importação')
        sleep 1
      end

      Then('Verificar se as abas "Alertas" e "Portas Seriais" ficam desabilitadas.') do
        expect(page.has_no_selector?('#MainContentMainMaster_MainContent_tabSerialPorts')).to be_truthy
      end

    @verifySaveCommManagerAlreadyExsists
      Given('Preencher os campos "Descrição" com a descrição "Minha Maquina Client" já existente.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCommunicationManagerDescription', 'Minha Maquina Client')
      end

      And('Preencher o campo "Nome da máquina"_19.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtMachineName', 'DESKTOP-JFU00CN')
      end

      And('Preencher o campo "Porta"_19.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPort', '5000')
      end
 
      When('Clicar em "Salvar" para tentar salvar um Gerenciador de Comunicação com a mesma descrição.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('Validar a mensagem apresentada pois não é possível salvar um Gerenciador de Comunicação com descrição igual.') do
        expect(find('#divIdBodyBusinessError')).to have_content '- O Gerenciador de Comunicação de descrição Minha Maquina Client já existe no sistema'
        sleep 1
      end

    #TESTES NA ABA: ALERTAS
    @verifyResourcesTabAlertCommManager
      Given('Acessar a aba "Alertas"_01.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabAlerts"]').click
      end

      Then('A aba "Alertas" deve conter os resources esperados.') do
        expect(page).to have_content('Alertas Notificados')
        expect(page).to have_content('Perda de conexão com o banco de dados')
        expect(page).to have_content('AFD')
        expect(page).to have_content('Área sem controle')
        expect(page).to have_content('RIM')
        expect(page).to have_content('Modo')
        expect(page).to have_content('Ativado/Desativado (estado da MRP)')
        expect(page).to have_content('Erro')
        expect(page).to have_content('Estado da bobina')
        expect(page).to have_content('Conectado')
        expect(page).to have_content('Alimentação')
        expect(page).to have_content('E-mails para notificação')
      end

    @invalidEmailForNotification
      Given('Preencher todos os campos obrigatórios da aba "Geral" para salvar um novo Gerenciador de Comunicação.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Client', 'DESKTOP-JFU00CN', '5000')
      end

      And('Acessar a aba "Alertas"_02.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabAlerts"]').click
      end

      And('Preencher o campo "Emails para notificação" com o valor "Teste".') do
        communicationManager.fills_In_Communication_Manager_Emails('Teste')
      end
 
      When('Criar no Botão Salvar para validar o email informado.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Emails para notificação" onde não está no formato email.') do
        expect(page).to have_selector("textarea[oldtitle='E-mails para notificação inválidos']")
      end

    @markCheckBoxFieldsTabAlertsCommManager
      Given('Acessar a aba "Alertas"_03.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabAlerts"]').click
      end

      Then('Marcar todas as opções checkBox da aba de Alertas com sucesso.') do
        check('MainContentMainMaster_MainContent_chkLostConnectionAlertEnable')
        check('MainContentMainMaster_MainContent_chkAreaWithoutControlAlertEnable')
        check('MainContentMainMaster_MainContent_chkModeAlertEnable')
        check('MainContentMainMaster_MainContent_chkErrorAlertEnable')
        check('MainContentMainMaster_MainContent_chkConnectedEnable')
        check('MainContentMainMaster_MainContent_chkAFDAlertEnable')
        check('MainContentMainMaster_MainContent_chkRIMAlertEnable')
        check('MainContentMainMaster_MainContent_chkActivatedAlertEnable')
        check('MainContentMainMaster_MainContent_chkRollStatusAlertEnable')
        check('MainContentMainMaster_MainContent_chkPowerAlertEnable')
        sleep 0.5
      end
 
    #TESTES NA ABA: PORTAS SERIAIS
    @verifyResourcesTabSerialPortsCommManager
      Given('Que eu selecione a aba "Portas Seriais"_01.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end

      Then('A aba "Portas Seriais" deve conter os resources esperados.') do
        expect(page).to have_content('Portas Seriais')
        expect(page).to have_content('Mesma Velocidade')
        expect(page).to have_content('Mesmo tempo de Poll (ms)')
        expect(page).to have_content('COM1')
        expect(page).to have_content('COM2')
        expect(page).to have_content('COM3')
        expect(page).to have_content('COM4')
        expect(page).to have_content('COM5')
        expect(page).to have_content('COM6')
        expect(page).to have_content('COM7')
        expect(page).to have_content('COM8')
        expect(page).to have_content('COM9')
        expect(page).to have_content('COM10')
      end

    @verifyValuesFieldSameSpeedTabSerialPorts
      Given('Que eu selecione a aba "Portas Seriais"_02.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end

      When('Obter todos os valores do dropbox "Mesma Velocidade".') do
        $valuesManagerType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlSameSpeed', $SAME_SPEED)
      end
      
      Then('Deve conter todos os valores esperados no campo "Mesma Velocidade".') do
        expect($valuesManagerType).to be_truthy
      end

    @verifyCapacityFieldSamePollTimeTabSerialPorts
        Given('Que eu selecione a aba "Portas Seriais"_03.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end

      And('Preencher o campo "Mesmo tempo de Poll" com valor "999"') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPollTimeToApply', '999')
        sleep 0.5
      end
 
      When('Clicar em qualquer checkbox da aba.') do
        check('MainContentMainMaster_MainContent_cbxPort1')
        sleep 0.5
      end
      
      Then('Validar o valor contido no campo "Mesmo tempo de Poll" que deve ser "99".') do
        expect(find('#MainContentMainMaster_MainContent_txtPollTimeToApply').value).to eql '99'
      end

    @markCheckBoxFieldsTabSerialPortsCommManager
      Given('Acessar a aba "Portas Seriais"_04.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end

      Then('Marcar todas as opções checkBox da aba de Portas Seriais com sucesso_01.') do
        check('MainContentMainMaster_MainContent_cbxPort1')
        check('MainContentMainMaster_MainContent_cbxPort2')
        check('MainContentMainMaster_MainContent_cbxPort3')
        check('MainContentMainMaster_MainContent_cbxPort4')
        check('MainContentMainMaster_MainContent_cbxPort5')
        check('MainContentMainMaster_MainContent_cbxPort6')
        check('MainContentMainMaster_MainContent_cbxPort7')
        check('MainContentMainMaster_MainContent_cbxPort8')
        check('MainContentMainMaster_MainContent_cbxPort9')
        check('MainContentMainMaster_MainContent_cbxPort10')
        sleep 0.5
      end

    @alterValuesPortsTabSerialPorts
      Given('Acessar a aba "Portas Seriais"_05.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end

      And('Marcar todas as opções checkBox da aba de Portas Seriais com sucesso_02.') do
        check('MainContentMainMaster_MainContent_cbxPort1')
        check('MainContentMainMaster_MainContent_cbxPort2')
        check('MainContentMainMaster_MainContent_cbxPort3')
        check('MainContentMainMaster_MainContent_cbxPort4')
        check('MainContentMainMaster_MainContent_cbxPort5')
        check('MainContentMainMaster_MainContent_cbxPort6')
        check('MainContentMainMaster_MainContent_cbxPort7')
        check('MainContentMainMaster_MainContent_cbxPort8')
        check('MainContentMainMaster_MainContent_cbxPort9')
        check('MainContentMainMaster_MainContent_cbxPort10')
        sleep 0.5
      end

      And('Selecionar o valor "19200" no dropbox "Mesma Velocidade".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlSameSpeed', '19200')
      end

      And('Preencher o campo "Mesmo tempo de Poll" com valor "99".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPollTimeToApply', '99')
      end

      When('Clicar em "Aplicar".') do
        click_button 'Aplicar'
        sleep 1
      end

      Then('Todos os dropbox das portas devem ser alterados para o valor "19200" e todos os campos de "Tempo do Poll" devem ser alterados para "99".') do
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort1').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime1').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort2').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime2').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort3').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime3').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort4').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime4').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort5').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime5').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort6').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime6').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort7').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime7').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort8').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime8').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort9').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime9').value).to eql('99')
        expect(find('#MainContentMainMaster_MainContent_ddlSpeedPort10').value).to eql('19200')
        expect(find('#MainContentMainMaster_MainContent_txtPollTime10').value).to eql('99')
        sleep 3
      end

    #TESTES DE INCLUSÃO
    @registerCommunicationManagerClientSuccess
      Given('Preencher os campos "Descrição" com o limite máximo de caracteres permitido.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtCommunicationManagerDescription', 'Automação Client')
      end

      And('Preencher o campo "Nome da máquina" com o limite máximo de caracteres permitido.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtMachineName', 'DESKTOP-JFU00CN')
      end

      And('Preencher o campo "Porta".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPort', '5000')
      end

      And('Acessar a aba "Alertas"_04.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabAlerts"]').click
      end

      And('Marcar todas as opções checkBox da aba de Alertas.') do
        check('MainContentMainMaster_MainContent_chkLostConnectionAlertEnable')
        check('MainContentMainMaster_MainContent_chkAreaWithoutControlAlertEnable')
        check('MainContentMainMaster_MainContent_chkModeAlertEnable')
        check('MainContentMainMaster_MainContent_chkErrorAlertEnable')
        check('MainContentMainMaster_MainContent_chkConnectedEnable')
        check('MainContentMainMaster_MainContent_chkAFDAlertEnable')
        check('MainContentMainMaster_MainContent_chkRIMAlertEnable')
        check('MainContentMainMaster_MainContent_chkActivatedAlertEnable')
        check('MainContentMainMaster_MainContent_chkRollStatusAlertEnable')
        check('MainContentMainMaster_MainContent_chkPowerAlertEnable')
        sleep 0.5
      end

      And('Inserir o email "teste@teste.com" no campo "E-mails para notificação".') do
        communicationManager.fills_In_Communication_Manager_Emails('teste@teste.com')
      end

      And('Acessar a aba "Portas Seriais"_01.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabSerialPorts"]').click
      end
  
      And('Selecionar o valor "19200" no dropbox "Mesma Velocidade"_01.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlSameSpeed', '19200')
      end
  
      And('Preencher o campo "Mesmo tempo de Poll" com valor "99"_01.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPollTimeToApply', '99')
      end
  
      And('Clicar em "Aplicar"_01.') do
        click_button 'Aplicar'
        sleep 1
      end

      When('Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo Client.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Validar se o Gerenciador de Comunicação client foi salvo com sucesso.') do
        expect(page).to have_content('Gerenciador de Comunicação salvo com sucesso!')
      end

    @registerCommunicationManagerServerSuccess
      Given('Preencher os campos "Descrição", "Nome da máquina" e "Porta"_01.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Server', 'DESKTOP-JFU00CN', '5001')
      end

      And('Selecionar o tipo de gerenciador para "Server".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Server')
      end

      And('Acessar a aba "Alertas"_05.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_tabAlerts"]').click
      end

      And('Marcar todas as opções checkBox da aba de "Alertas"_02.') do
        check('MainContentMainMaster_MainContent_chkLostConnectionAlertEnable')
        check('MainContentMainMaster_MainContent_chkAreaWithoutControlAlertEnable')
        check('MainContentMainMaster_MainContent_chkModeAlertEnable')
        check('MainContentMainMaster_MainContent_chkErrorAlertEnable')
        check('MainContentMainMaster_MainContent_chkConnectedEnable')
        check('MainContentMainMaster_MainContent_chkAFDAlertEnable')
        check('MainContentMainMaster_MainContent_chkRIMAlertEnable')
        check('MainContentMainMaster_MainContent_chkActivatedAlertEnable')
        check('MainContentMainMaster_MainContent_chkRollStatusAlertEnable')
        check('MainContentMainMaster_MainContent_chkPowerAlertEnable')
        sleep 0.5
      end

      And('Inserir o email "teste@teste.com" no campo "E-mails para notificação"_2.') do
        communicationManager.fills_In_Communication_Manager_Emails('teste@teste.com')
      end

      When('Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo Server.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Validar se o Gerenciador de Comunicação server foi salvo com sucesso.') do
        expect(page).to have_content('Gerenciador de Comunicação salvo com sucesso!')
      end

    @registerCommunicationManagerExpImpSuccess
      Given('Preencher os campos "Descrição", "Nome da máquina" e "Porta"_02.') do
        communicationManager.fills_In_Communication_Manager_Client('Automação Exp./Imp.', 'DESKTOP-JFU00CN', '5002')
      end

      And('Selecionar o tipo de gerenciador para "Exportação e Importação".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTypeManager', 'Exportação / Importação')
      end

      When('Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo "Exportação e Importação".') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Validar se o Gerenciador de Comunicação "Exportação e Importação" foi salvo com sucesso.') do
        expect(page).to have_content('Gerenciador de Comunicação salvo com sucesso!')
      end
