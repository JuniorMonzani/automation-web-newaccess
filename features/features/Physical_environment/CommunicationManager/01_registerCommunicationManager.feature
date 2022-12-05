#20
@registerCommunicationManager
Feature: Register Communication Manager
    Como um usuário do sistema que tenha permissão para Cadastrar Gerenciadores de Comunicação.
    
    Background:
        Given Que o usuário esteja na página de cadastro de Gerenciador de Comunicação.

    #TESTES NA ABA: GERAL
        @verifyResourcesTabGeneralCommManager
        Scenario: verifyResourcesTabGeneralCommManager
            Given Que eu selecione a aba "Geral".
            Then A aba "Geral" deve conter os resources esperados.

        @fieldDescriptionRequiredCommManager
        Scenario: fieldDescriptionRequiredCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Descrição.
            When Clicar no botão Salvar para validar o campo "Descrição" em Gerenciador de Comunicação.
            Then Deve existgir uma validação no campo Descrição pois o mesmo é obrigatório.

        @fieldMachineNameRequiredCommManager
        Scenario: fieldMachineNameRequiredCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Nome da Máquina.
            When Clicar no botão Salvar para validar o campo "Nome da Máquina" em Gerenciador de Comunicação.
            Then Deve existgir uma validação no campo Nome da máquina pois o mesmo é obrigatório.

        @fieldPortRequiredCommManager
        Scenario: fieldPortRequiredCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Porta.
            When Clicar no botão Salvar para validar o campo Porta em Gerenciador de Comunicação.
            Then Deve existgir uma validação no campo Porta pois o mesmo é obrigatório.

        @verifyTypeFieldPortCommManager
        Scenario: verifyTypeFieldPortCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar caracteres alfanuméricos.
            When Clicar no botão Salvar para validar o tipo do campo "Porta".
            Then Deve existgir uma validação de obrigatoriedade no campo Porta pois o mesmo só aceita numérico.

        @verifyFieldPortZeroCommManager
        Scenario: verifyFieldPortZeroCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar o valor "0".
            When Clicar no botão Salvar para validar o tipo do campo "Porta" como 0.
            Then Deve existgir uma validação onde o campo Porta é inválido pois é 0.

        @verifyFieldPortInvalidCommManager
        Scenario: verifyFieldPortInvalidCommManager
            Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo "Porta" informar o valor "99999".
            When Clicar no botão Salvar para validar o tipo do campo "Porta" como 99999.
            Then Deve existgir uma validação onde o campo Porta é inválido pois é 99999.

        @verifyValuesFieldTypeManagerCommManager
        Scenario: verifyValuesFieldTypeManagerCommManager
            Given Obter todos os valores do combobox Tipo de Gerenciador e validar com os valores esperados.
            Then Deve conter todos os valores esperados no combobox Tipo de Gerenciador.
            
        @verifyDefaultValueFieldTypeManagerCommManager
        Scenario: verifyDefaultValueFieldTypeManagerCommManager
            Given Que eu verifique o valor default do combobox Tipo de Gerenciador.
            Then O valor default deve corresponder ao valor "Client".

        @verifyDisabledFieldIPAddressCommManager
        Scenario: verifyDisabledFieldIPAddressCommManager
            Given Que o tipo de gerenciador seja Client_08.
            Then O campo Endereço IP deve estar desabilitado.

        @verifyDisabledFieldPortCommManager
        Scenario: verifyDisabledFieldPortCommManager
            Given Que o tipo de gerenciador seja Client_09.
            Then O campo Porta deve estar desabilitado.

        @verifyDisabledFieldEncryptionKeyCommManager
        Scenario: verifyDisabledFieldEncryptionKeyCommManager
            Given Que o tipo de gerenciador seja Client_10.
            Then O campo Chave de Criptografia deve estar desabilitado.

        @fieldIPAddressRequiredCommManager
        Scenario: fieldIPAddressRequiredCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_11.
            And Alterar o combobox Tipo de Gerenciador para "Server"_11.
            And Limpar o campo "Endereço IP".
            When Clicar em "Salvar" para validar o campo Endereço IP_11.
            Then Deve existir uma validação no campo Endereço IP pois o mesmo é obrigatório quando o gerenciador é Server.

        @fieldIPAddressInvalidCommManager
        Scenario: fieldIPAddressInvalidCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_16.
            And Alterar o combobox Tipo de Gerenciador para "Server"_16.
            And No campo "Endereço IP" informar o valor "1234567890"_16.
            When Clicar em "Salvar" para validar o campo Endereço IP_16.
            Then Deve existir uma validação no campo Endereço IP informando que o mesmo deve conter um IP válido.

        @fieldPortServerRequiredCommManager
        Scenario: FieldPortServerRequiredCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_12.
            And Alterar o combobox Tipo de Gerenciador para "Server"_12.
            And Limpar o campo "Porta" do servidor_01.
            When Clicar em salvar para validar o campo Porta do servidor_16.
            Then Deve existir uma validação no campo Porta do servidor pois o mesmo é obrigatório quando o gerenciador é Server.

        @fieldPortServerZeroCommManager
        Scenario: fieldPortServerZeroCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_17.
            And Alterar o combobox Tipo de Gerenciador para "Server"_17.
            And Preencher o campo "Porta" do servidor com valor "0".
            When Clicar em salvar para validar o campo Porta do servidor_17.
            Then Deve existir uma validação no campo Porta do servidor é inválido por ser 0.

        @fieldPortServerMaxSizeCommManager
        Scenario: fieldPortServerMaxSizeCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_18.
            And Alterar o combobox Tipo de Gerenciador para "Server"_18.
            And Preencher o campo "Porta" do servidor com valor "99999".
            When Clicar em salvar para validar o campo Porta do servidor_18.
            Then Deve existir uma validação no campo Porta do servidor é inválido por ser 99999.

        @fieldEncryptionKeyRequiredCommManager
        Scenario: FieldEncryptionKeyRequiredCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_13.
            And Alterar o combobox Tipo de Gerenciador para "Server"_13.
            And Limpar o campo "Chave de Criptografia".
            When Clicar em salvar para validar o campo Chave de Criptografia_13.
            Then Deve existir uma validação no campo Chave de Criptografia pois o mesmo é obrigatório quando o gerenciador é Server.

        @verifyTypePortServerCommManager
        Scenario: verifyTypePortServerCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_14.
            And Alterar o combobox Tipo de Gerenciador para "Server"_14.
            And Limpar o campo "Porta" do servidor_02.
            And Tentar preencher o campo Porta do servidor com caracteres alfanuméricos.
            When Clicar em salvar para validar o campo Porta do servidor_19.
            Then Deve existir uma validação de obrigatoriedade no campo Porta do servidor pois o mesmo não aceita alfanuméricos e ficará vazio.

        @verifyTypeEncryptionKeyCommManager
        Scenario: verifyTypeEncryptionKeyCommManager
            Given Preencher os campos para inclusão do Gerenciador de Comunicação_15.
            And Alterar o combobox Tipo de Gerenciador para "Server"_15.
            And Limpar o campo "Chave de Criptografia" do servidor.
            And Tentar preencher o campo "Chave de Criptografia" com caracteres alfanuméricos.
            When Clicar em salvar para validar o campo Chave de Criptografia_15.
            Then Deve existir uma validação de obrigatoriedade no campo Chave de Criptografia pois o mesmo não aceita alfanuméricos e ficará vazio.

        @verifyDisableTabSerialPortsForServerType
        Scenario: verifyDisableTabeSeralPortsForServerType
            Given Alterar o combobox Tipo de Gerenciador para "Server"_19.
            Then Verificar se a aba "Portas Seriais" fica desabilitada.

        @verifyDisableTabsAlertsAndSerialPortsForExpImpType
        Scenario: verifyDisableTabsAlertsAndSerialPortsForExpImpType
            Given Alterar o combobox Tipo de Gerenciador para "Exportação e Importação".
            Then Verificar se as abas "Alertas" e "Portas Seriais" ficam desabilitadas.

        @verifySaveCommManagerAlreadyExsists
        Scenario: verifySaveCommManagerAlreadyExsists
            Given Preencher os campos "Descrição" com a descrição "Minha Maquina Client" já existente.
            And Preencher o campo "Nome da máquina"_19.
            And Preencher o campo "Porta"_19.
            When Clicar em "Salvar" para tentar salvar um Gerenciador de Comunicação com a mesma descrição.
            Then Validar a mensagem apresentada pois não é possível salvar um Gerenciador de Comunicação com descrição igual.
            
    #TESTES NA ABA: ALERTAS
        @verifyResourcesTabAlertCommManager
        Scenario: verifyResourcesTabAlertCommManager
            Given Acessar a aba "Alertas"_01.
            Then A aba "Alertas" deve conter os resources esperados.

        @invalidEmailForNotification
        Scenario: invalidEmailForNotification
            Given Preencher todos os campos obrigatórios da aba "Geral" para salvar um novo Gerenciador de Comunicação.
            And Acessar a aba "Alertas"_02.
            And Preencher o campo "Emails para notificação" com o valor "Teste".
            When Criar no Botão Salvar para validar o email informado.
            Then Deve existir uma validação no campo "Emails para notificação" onde não está no formato email.

        @markCheckBoxFieldsTabAlertsCommManager
        Scenario: markCheckBoxFieldsTabAlertsCommManager
            Given Acessar a aba "Alertas"_03.
            Then Marcar todas as opções checkBox da aba de Alertas com sucesso.

    #TESTES NA ABA: PORTAS SERIAIS
        @verifyResourcesTabSerialPortsCommManager
        Scenario: verifyResourcesTabSerialPortsCommManager
            Given Que eu selecione a aba "Portas Seriais"_01.
            Then A aba "Portas Seriais" deve conter os resources esperados.

        @verifyValuesFieldSameSpeedTabSerialPorts
        Scenario: verifyValuesFieldSameSpeedTabSerialPorts
            Given Que eu selecione a aba "Portas Seriais"_02.
            When Obter todos os valores do dropbox "Mesma Velocidade".
            Then Deve conter todos os valores esperados no campo "Mesma Velocidade".

        @verifyCapacityFieldSamePollTimeTabSerialPorts
        Scenario: verifyCapacityFieldSamePollTimeTabSeralPorts
            Given Que eu selecione a aba "Portas Seriais"_03.
            And Preencher o campo "Mesmo tempo de Poll" com valor "999"
            When Clicar em qualquer checkbox da aba.
            Then Validar o valor contido no campo "Mesmo tempo de Poll" que deve ser "99".

        @markCheckBoxFieldsTabSerialPortsCommManager
        Scenario: markCheckBoxFieldsTabSerialPortsCommManager
            Given Acessar a aba "Portas Seriais"_04.
            Then Marcar todas as opções checkBox da aba de Portas Seriais com sucesso_01.

        @alterValuesPortsTabSerialPorts
        Scenario: alterValuesPortsTabSerialPorts
            Given Acessar a aba "Portas Seriais"_05.
            And Marcar todas as opções checkBox da aba de Portas Seriais com sucesso_02.
            And Selecionar o valor "19200" no dropbox "Mesma Velocidade".
            And Preencher o campo "Mesmo tempo de Poll" com valor "99".
            When Clicar em "Aplicar".
            Then Todos os dropbox das portas devem ser alterados para o valor "19200" e todos os campos de "Tempo do Poll" devem ser alterados para "99".

    #TESTES DE INCLUSÃO
        @registerCommunicationManagerClientSuccess
        Scenario: registerCommunicationManagerClientSuccess
            Given Preencher os campos "Descrição" com o limite máximo de caracteres permitido.
            And Preencher o campo "Nome da máquina" com o limite máximo de caracteres permitido.
            And Preencher o campo "Porta".
            And Acessar a aba "Alertas"_04.
            And Marcar todas as opções checkBox da aba de Alertas.
            And Inserir o email "teste@teste.com" no campo "E-mails para notificação".
            And Acessar a aba "Portas Seriais"_01.
            And Selecionar o valor "19200" no dropbox "Mesma Velocidade"_01.
            And Preencher o campo "Mesmo tempo de Poll" com valor "99"_01.
            And Clicar em "Aplicar"_01.
            When Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo Client.
            Then Validar se o Gerenciador de Comunicação client foi salvo com sucesso.

        @registerCommunicationManagerServerSuccess
        Scenario: registerCommunicationManagerServerSuccess
            Given Preencher os campos "Descrição", "Nome da máquina" e "Porta"_01.
            And Selecionar o tipo de gerenciador para "Server".
            And Acessar a aba "Alertas"_05.
            And Marcar todas as opções checkBox da aba de "Alertas"_02.
            And Inserir o email "teste@teste.com" no campo "E-mails para notificação"_2.
            When Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo Server.
            Then Validar se o Gerenciador de Comunicação server foi salvo com sucesso. 

        @registerCommunicationManagerExpImpSuccess
        Scenario: registerCommunicationManagerExpImpSuccess
            Given Preencher os campos "Descrição", "Nome da máquina" e "Porta"_02.
            And Selecionar o tipo de gerenciador para "Exportação e Importação".
            When Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo "Exportação e Importação".
            Then Validar se o Gerenciador de Comunicação "Exportação e Importação" foi salvo com sucesso.

         
