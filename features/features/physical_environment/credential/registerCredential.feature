@registerCredential
Feature: Register Credential
    Como um usuário do sistema que tenha permissão para Cadastrar Credenciais.
    
    Background:
        Given Que o usuário esteja na página de cadastro de Credenciais.

    @verifyLabelsCredential
    Scenario: verifyLabelsCredential
        Given Que eu verifico e comparo todos os resources dos campos apresentados na tela de cadastro de credencial.

    @fieldNumberRequiredCredential
    Scenario: fieldNumberRequiredCredential
        Given Informar caractere alfanumérico no campo "Número" e preencher corretamente todas os outros campos necessários para efetuar o cadastro de Credencial.
        When Clicar no botão Salvar para validar o campo "Número" no cadastro de credencial.
        Then Deve existir uma validação no campo "Número" pois o mesmo é obrigatório e só aceita caractere numérico visto que a opção "Credencial individual" esta marcada.

    @fieldCredentialIntervalEnableCredential
    Scenario: fieldCredentialIntervalEnableCredential
        Given Marcar a opção de inclusão "Intervalo de credencial".
        Then O campo "Número" deve ficar desabilitado e os campos "Números de" e "Até" devem ficar habilitados.

    @fieldNumbersOfRequiredCredential
    Scenario: fieldNumbersOfRequiredCredential
        Given Não preencher o campo "Números de" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Números de".
        Then Deve existir uma validação no campo "Números de" pois o mesmo é obrigatório visto que a opção "Intervalo de credencial" esta marcada.   

    # @verifyValuesTechnologyCredential
    # Scenario: verifyValuesTechnologyCredential
    #     Given Obter todos os valores do dropbox "Tecnologia" e comparar com os valores esperados.
    #     Then Deve conter todos os valores esperados no campo "Tecnologia".

    # @verifyValuesTypeCredential
    # Scenario: verifyValuesTypeCredential
    #     Given Obter todos os valores do dropbox "Tipo" e comparar com os valores esperados.
    #     Then Deve conter todos os valores esperados no campo "Tipo".

    # @verifyValuesCompanyCredential
    # Scenario: verifyValuesCompanyCredential
    #     Given Obter todos os valores do dropbox "Empresa" e comparar com os valores esperados.
    #     Then Deve conter todos os valores esperados no campo "Empresa".

    # @verifyValuesPublicCredentialCredential
    # Scenario: verifyValuesPublicCredentialCredential
    #     Given Desmarcar o checkbox "Credencial pública".
    #     Then Deve desabilitar o dropbox "Empresa".

    # @fieldReasonDisabledCredential
    # Scenario: fieldReasonDisabledCredential
    #     Given Com a opção de situação "Liberada" marcada.
    #     Then O campo "Motivo" deve ficar desabilitado.

    # @fieldReasonEnabledCredential
    # Scenario: fieldReasonEnabledCredential
    #     Given Marcar a opção de situação "Bloqueada".
    #     Then O campo "Motivo" deve ficar habilitado.

    # @verifyValuesProvisoryCredentialCredential
    # Scenario: verifyValuesProvisoryCredentialCredential
    #     Given Marcar o checkbox "Credencial provisória".
    #     Then Deve desabilitar o checkbox "Supervisor de equipamento".

    # @registerCredentialSuccess
    # Scenario: registerCredentialSuccess
    #     Given Que eu preencha todos os campos obrigatórios de forma correta.
    #     And Selecionar a "Tecnologia" como "Código de Barras".
    #     And Selecionar o "Tipo" como "Pessoa".
    #     And Selecionar a "Empresa" como "Estrutura Teste 1".
    #     And Marcar o checkbox "Supervisor de equipamento".
    #     When Clicar no botão "Salvar" para incluir a Credencial.
    #     Then A credencial deve ser salva com sucesso.