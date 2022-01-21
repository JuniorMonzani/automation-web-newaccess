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
        When Clicar no botão 'Salvar' para acionar a validação_001
        Then O campo 'Motivo' deve apresentar a obrigatoriedade

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

       
    #Validação de credencial que autentica em credencial
    @verifyMandatoryFieldsCredencialType
    Scenario: verifyMandatoryFieldsCredencialType
        Given Informar o valor '1100' no campo 'Número'_004
        And Selecionar uma empresa_004
        And Selecionar o tipo 'Credencial'_004
        And Informar uma senha no campo 'Senha'._004
        And Limpar o campo 'Porcentagem de sorteio'._004
        When Clicar no botão 'Salvar' para acionar a validação_004
        Then O campo 'Validade', 'Até','Pesfil de acesso', 'Confirme a senha' e 'Porcentagem de sorteio' devem ser marcados como obrigatórios.]

    @verifyTextInParameterOldtitle
    Scenario: verifyTextInParameterOldtitle
        Given Informar o valor '1100' no campo 'Número'_005
        And Selecionar uma empresa_005
        And Selecionar o tipo 'Credencial'_005
        And Informar uma senha no campo 'Senha'._005
        And Limpar o campo 'Porcentagem de sorteio'._005
        When Clicar no botão 'Salvar' para acionar a validação_005
        Then Os campos obrigatórios devem apresentar os textos de obrigatoriedade esperados.

    @verifyValuesMaster
    Scenario: verifyValuesMaster
        Given Selecionar o tipo 'Credencial'
        Then O dropbox 'Master' deve conter todos os valores esperados.


    # Salvando credenciais
    @saveCredentialCombinationFields_1
    Scenario: saveCredentialCombinationFields_1
        Given Informe o valor '1000' no campo 'Número'.
        And Marcar a opção 'Credencial pública'.
        And Selecionar a tecnologia 'Proximidade'.
        And Selecionar o Tipo 'Visitante'.
        And Selecionar a opção 'Supervisor de equipamento'.
        When Clicar no botão "Salvar" para incluir a Credencial_001
        Then A credencial deve ser salva com sucesso_001.

    @saveCredentialCombinationFields_2
    Scenario: saveCredentialCombinationFields_2
        Given Informe o valor '1001' no campo 'Número'.
        And Seleciono a empresa 'Estrutura teste 1'.
        And Seleciono a tecnologia 'Barras'
        And Seleciono o Tipo 'Pessoa'
        And Seleciono a opção 'Credencial provisória'
        And Seleciono a opção 'Bloqueada'
        And P`reencho o campo 'Motivo'
        When Clicar no botão "Salvar" para incluir a Credencial_005
        Then A credencial deve ser salva com sucesso_002.
    
    @saveCredentialCombinationFields_3
    Scenario: saveCredentialCombinationFields_2
        Given Informe o valor '1002' no campo 'Número'.
        And Selecionar a empresa 'Estrutura teste 1'._001
        And Selecionar a tecnologia 'Barras'_001
        And SeleSelecionarcinar o Tipo 'Credencial'.
        And Selecionar uma Data de início de validade.
        And Selecionar uma data final de validade.
        And Selecinar um perfil de acesso.
        And Marcar o campo 'Permitir reentrada'.
        And Marcar o campo 'Dispensa senha'.
        And Informar um horário no campo 'Horário para recolhimento no cofre na data final'.
        When Clicar no botão "Salvar" para incluir a Credencial_006
        Then A credencial deve ser salva com sucesso_003.