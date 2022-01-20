@registerCredential
Feature: Register Credential
    Como um usuário do sistema que tenha permissão para Cadastrar Credenciais.
    
    Background:
        Given Que o usuário esteja na página de cadastro de Credenciais.

    # obrigatoriedade
    @verifyLabelsCredential
    Scenario: verifyLabelsCredential
        Given Que eu verifico e comparo todos os resources dos campos apresentados na tela de cadastro de credencial.

    @fieldNumberRequiredCredential
    Scenario: fieldNumberRequiredCredential
        Given Não preencher o campo "Número" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número".
        Then Deve existgir uma validação de obrigatoriedade no campo "Número" visto que a opção "Credencial individual" esta marcada.

    @fieldCredentialIntervalEnableCredential
    Scenario: fieldCredentialIntervalEnableCredential
        Given Marcar a opção de inclusão "Intervalo de credencial".
        Then O campo "Número" deve ficar desabilitado e o campo "Números de" deve ficar habilitado.

    @fieldNumbersOfRequiredCredential
    Scenario: fieldNumbersOfRequiredCredential
        Given Não preencher o campo "Números de" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Números de".
        Then Deve existgir uma validação de obrigatoriedade no campo "Números de" visto que a opção "Intervalo de credencial" esta marcada.

    @verifyReasonMandatory
    Scenario: verifyReasonMandatory
        Given Informar o valor '1000' no campo 'Número'_001
        And Selecionar uma empresa_001
        And Marcar a opção 'Bloqueada'
        When Clicar no botão 'Salvar' para acionar a validação_002
        Then O campo 'Motivo' deve apresentar a obrigatoriedade


    @verifyMandatoryFieldsCredencialType
    Scenario: verifyMandatoryFieldsCredencialType
        Given Informar o valor '1100' no campo 'Número'_002
        And Selecionar uma empresa_002
        And Selecionar o tipo 'Credencial'
        When Clicar no botão 'Salvar' para acionar a validação_004
        Then O campo 'Validade', 'Até' e 'Pesfil de acesso' devem ser marcados como obrigatórios








    # verifica combobox
    @verifyValuesTechnologyCredential
    Scenario: verifyValuesTechnologyCredential
        Given Obter todos os valores do dropbox "Tecnologia" e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Tecnologia".

    @verifyValuesTypeCredential
    Scenario: verifyValuesTypeCredential
        Given Obter todos os valores do dropbox "Tipo" e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Tipo".

    @verifyValuesCompanyCredential
    Scenario: verifyValuesCompanyCredential
        Given Obter todos os valores do dropbox "Empresa" e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Empresa".

    # condições para habilitar desabilitar campo
    @verifyDisabledDropBoxCompany
    Scenario: verifyDisabledDropBoxCompany
        Given Marcar o checkbox "Credencial pública".
        Then Deve desabilitar o dropbox "Empresa".

    @verifyEnableDropBoxCompany
    Scenario: verifyEnableDropBoxCompany
        Given Desmarcar o checkbox "Credencial pública".
        Then Deve habilitar o dropbox "Empresa".

    @verifyDisabledReason
    Scenario: verifyDisabledReason
        Given Com a opção de situação "Liberada" marcada.
        Then O campo "Motivo" deve ficar desabilitado.

    @verifyEnableReason
    Scenario: verifyEnableReason
        Given Marcar a opção de situação "Bloqueada".
        Then O campo "Motivo" deve ficar habilitado.

    @verifyDisabledEquipmentSupervisor
    Scenario: verifyDisabledEquipmentSupervisor
        Given Marcar o checkbox "Credencial provisória".
        Then Deve desabilitar o checkbox "Supervisor de equipamento".

    @verifyEnabledEquipmentSupervisor
    Scenario: verifyEnabledEquipmentSupervisor
        Given Desmarcar o checkbox "Credencial provisória".
        Then Deve habilitar o checkbox "Supervisor de equipamento".

    # validação de mansagens
    @verifyMessageCredentialCreation
    Scenario: verifyMessageCredentialCreation
        Given Que eu marque o campo 'Intervalo de crenciais'
        And Informe o valor '1000' no campo 'Números de'
        And Informe o valor '1100' no campo 'Até'
        When Clicar no botão 'Salvar' para acionar a validação
        Then A mensagem de inclusão de um intervalo de credenciais será apresentada ao usuário e deve ser exatamente a mensagem esperada

    @verifyMessageCompanyMandatory
    Scenario: verifyMessageCompanyMandatory
        Given Informe o valor '1000' no campo 'Número'_002
        When Clicar no botão 'Salvar' para acionar a validação_002
        Then A mensagem de alerta apresentada ao usuário deve ser exatamente a mensagem esperada_002

    @verifyMessageCredentialAlreadyExsists
    Scenario: verifyMessageCredentialAlreadyExsists
        Given Informe o valor '1' no campo 'Número'_003
        When Clicar no botão 'Salvar' para acionar a validação_003
        Then A mensagem de alerta apresentada ao usuário deve ser exatamente a mensagem esperada_003

    @saveCredentialCombinationFields_1
    Scenario: saveCredentialCombinationFields_1
        Given Informe o valor '1000' no campo 'Número'_004
        And Marcar a opção 'Credencial pública'
        And Selecionar a tecnologia 'Proximidade'
        And Selecionar o Tipo 'Visitante'
        And Selecionar a opção 'Supervisor de equipamento'
        When Clicar no botão "Salvar" para incluir a Credencial_001
        Then A credencial deve ser salva com sucesso_001.

    @saveCredentialCombinationFields_2
    Scenario: saveCredentialCombinationFields_2
        Given Informe o valor '1001' no campo 'Número'_005
        And Seleciono a empresa 'Estrutura teste 1'
        And Seleciono a tecnologia 'RFID'
        And Seleciono o Tipo 'Pessoa'
        And Seleciono a opção 'Credencial provisória'
        And Seleciono a opção 'Bloqueada'
        And P`reencho o campo 'Motivo'
        When Clicar no botão "Salvar" para incluir a Credencial_005
        Then A credencial deve ser salva com sucesso_002.
        
    






    @registerCredentialSuccess
    Scenario: registerCredentialSuccess
        Given Que eu preencha todos os campos obrigatórios de forma correta.
        And Selecionar a "Tecnologia" como "Código de Barras".
        And Selecionar o "Tipo" como "Pessoa".
        And Selecionar a "Empresa" como "Estrutura Teste 1".
        And Marcar o checkbox "Supervisor de equipamento".
        When Clicar no botão "Salvar" para incluir a Credencial.
        Then A credencial deve ser salva com sucesso.