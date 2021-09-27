#encoding: UTF-8

@registerCommunicationManager
Feature: Register Communication Manager
    Como um usuário do sistema que tenha permissão para Cadastrar Gerenciadores de COmunicação.
    
    Background:
        Given Que o usuário esteja na página de cadastro de Gerenciador de Comunicação.

    @verifyLabelsCommManager
    Scenario: verifyLabelsCommunicationManager
        Given Que eu verifico e comparo todos os resources dos campos apresentados na aba Geral de Gerenciador de Comunicação.
        Given Que eu verifico e comparo todos os resources dos campos apresentados na aba Alertas de Gerenciador de Comunicação.
        Given Que eu verifico e comparo todos os resources dos campos apresentados na aba Portas Seriais de Gerenciador de Comunicação.
        Given Que eu verifico e comparo todos os resources dos campos apresentados na aba Integração de Gerenciador de Comunicação.

    @fieldDescriptionRequiredCommManager
    Scenario: fieldDescriptionRequiredCommManager
        Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Descrição.
        When Clicar no botão Salvar para validar o campo Descrição.
        Then Deve existgir uma validação no campo Descrição pois o mesmo é obrigatório.

    @fieldMachineNameRequiredCommManager
    Scenario: fieldMachineNameRequiredCommManager
        Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Nome da Máquina.
        When Clicar no botão Salvar para validar o campo Nome da Máquina.
        Then Deve existgir uma validação no campo Nome da máquina pois o mesmo é obrigatório.

    @fieldPortRequiredCommManager
    Scenario: fieldPortRequiredCommManager
        Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação exceto o campo Porta.
        When Clicar no botão Salvar para validar o campo Porta.
        Then Deve existgir uma validação no campo Porta pois o mesmo é obrigatório.

    @verifyTypeFieldPortCommManager
    Scenario: verifyTypeFieldPortCommManager
        Given Preencher todos os campos obrigatórios para efetuar o cadastro do Gerenciador de Comunicação e no campo Porta informar caracteres alfanuméricos.
        When Clicar no botão Salvar para validar o tipo do campo Porta.
        Then Deve existgir uma validação de obrigatoriedade no campo Porta pois o mesmo só aceita numérico.

    @verifyValuesFieldTypeManagerCommManager
    Scenario: verifyValuesFieldTypeManagerCommManager
        Given Obter todos os valores do combobox Tipo de Gerenciador e validar com os valores esperados.
        Then Deve conter todos os valores esperados no combobox Tipo de Gerenciador.
        
    @verifyDefaultValueFieldTypeManagerCommManager
    Scenario: verifyDefaultValueFieldTypeManagerCommManager
        Given Que eu verifique o valor default do combobox Tipo de Gerenciador.
        Then O valor default deve corresponder ao valor esperado.

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
        And Alterar o combobox Tipo de Gerenciador para Server_11.
        And Limpar o campo Endereço IP.
        When Clicar em salvar para validar o campo Endereço IP.
        Then Deve existir uma validação no campo Endereço IP pois o mesmo é obrigatório quando o gerenciador é Server.

    @fieldPortServerRequiredCommManager
    Scenario: FieldPortServerRequiredCommManager
        Given Preencher os campos para inclusão do Gerenciador de Comunicação_12.
        And Alterar o combobox Tipo de Gerenciador para Server_12.
        And Limpar o campo Port do servidor.
        When Clicar em salvar para validar o campo Porta (do servidor).
        Then Deve existir uma validação no campo Porta (do servidor) pois o mesmo é obrigatório quando o gerenciador é Server.

    @fieldEncryptionKeyRequiredCommManager
    Scenario: FieldEncryptionKeyRequiredCommManager
        Given Preencher os campos para inclusão do Gerenciador de Comunicação_13.
        And Alterar o combobox Tipo de Gerenciador para Server_13.
        And Limpar o campo Chave de Criptografia.
        When Clicar em salvar para validar o campo Chave de Criptografia_13.
        Then Deve existir uma validação no campo Chave de Criptografia pois o mesmo é obrigatório quando o gerenciador é Server.

    @verifyTypePortServerCommManager
    Scenario: verifyTypePortServerCommManager
        Given Preencher os campos para inclusão do Gerenciador de Comunicação_14.
        And Alterar o combobox Tipo de Gerenciador para Server_14.
        And Limpar o campo Port do servidor.
        And Tentar preencher o campo Porta (do servidor) com caracteres alfanuméricos.
        When Clicar em salvar para validar o campo Porta (do servidor).
        Then Deve existir uma validação de obrigatoriedade no campo Porta (do servidor) pois o mesmo não aceita alfanuméricos e ficará vazio.

    @verifyTypeEncryptionKeyCommManager
    Scenario: verifyTypeEncryptionKeyCommManager
        Given Preencher os campos para inclusão do Gerenciador de Comunicação_15.
        And Alterar o combobox Tipo de Gerenciador para Server_15.
        And Limpar o campo Chave de Criptografia do servidor.
        And Tentar preencher o campo Chave de Criptografia com caracteres alfanuméricos.
        When Clicar em salvar para validar o campo Chave de Criptografia_15.
        Then Deve existir uma validação de obrigatoriedade no campo Chave de Criptografia pois o mesmo não aceita alfanuméricos e ficará vazio.
        
    @markCheckBoxFieldsTabAlertsCommManager
    Scenario: markCheckBoxFieldsTabAlertsCommManager
        Given Acessar a aba Alertas.
        Then Marcar todas as opções (checkBox) da aba de Alertas com sucesso.

    @markCheckBoxFieldsTabAlertsCommManager
    Scenario: markCheckBoxFieldsTabAlertsCommManager
        Given Acessar a aba Alertas.
        Then Marcar todas as opções (checkBox) da aba de Alertas com sucesso.



