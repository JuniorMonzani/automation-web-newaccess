@editCredential
Feature: edit Credential
    Como um usuário do sistema que tenha permissão para Alterar Credenciais.

    Background:
        Given Que o usuário esteja na página que lista as Credenciais para realizar alterações.

    #Cenários de busca
    @verifyValuesSearchTechnology
    Scenario: verifyValuesSearchTechnology
        Given Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_001.
        When Obter todos os valores do dropbox "Tecnologia".
        Then Os valores contidos no dropbox devem ser exatamente os valores esperados para o campo "Tecnologia".

    @verifyValuesSearchSituation
    Scenario: verifyValuesSearchSituation
        Given Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_002.
        When Obter todos os valores do dropbox "Situação".
        Then Os valores contidos no dropbox devem ser exatamente os valores esperados para o campo "Situação".

    @searchCredentialAnotherTechnology
    Scenario: searchCredentialAnotherTechnology
        Given Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_003.
        And Inserir no campo "Número" o valor "1000"._003.
        And Selecionar a tecnologia "RFID" no dropbox "Tecnologia".
        When Clicar no botão "Buscar"_003.
        Then Validar que nenhuma credencial foi retornada com a busca pelo texto "Nenhum resultado foi encontrado"_003.

    # @searchCredentialAnotherSituation
    # Scenario: searchCredentialAnotherSituation
    #     Given Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_004.
    #     And Inserir no campo "Número" o valor "1000"_004.
    #     And Selecionar a situação "Bloqueada" no dropbox "Situação".
    #     When Clicar no botão "Buscar"_004.
    #     Then Validar que nenhuma credencial foi retornada com a busca pelo texto "Nenhum resultado foi encontrado"_004.


    # #Validação dos valores salvos na credencial 1000
    # @verifyTechnologyProximityCredential
    # Scenario:verifyTechnologyProximityCredential
    #     Given Que eu busque e encontre a credencial de número "1000" cadastrada pela automação_001.
    #     When Clique no botão para realizar a alteração da credencial_001.
    #     Then Validar no cadastro da credencial o campo Tecnologia deve conter o valor "Proximidade".

    # @verifyTypeVisitorCredential
    # Scenario: verifyTypeVisitorCredential
    #     Given Que eu busque e encontre a credencial de número "1000" cadastrada pela automação_002.
    #     When Clique no botão para realizar a alteração da credencial_002.
    #     Then Validar no cadastro da credencial o campo Tipo deve conter o valor "Visitante".

    # @verifyPublicCredential
    # Scenario: verifyPublicCredential
    #     Given Que eu busque e encontre a credencial de número "1000" cadastrada pela automação_003.
    #     When Clique no botão para realizar a alteração da credencial_003.
    #     Then Validar no cadastro da credencial o campo "Credencial pública" deve estar marcado.

    # @verifyDisableFieldSupervisor
    # Scenario: verifyDisableFieldSupervisor
    #     Given Que eu busque e encontre a credencial de número "1000" cadastrada pela automação_004.
    #     When Clique no botão para realizar a alteração da credencial_004.
    #     Then Validar se o campo "Supervisor de equipamento" está desabilitado.

    # @verifyDisableFieldProvisional
    # Scenario: verifyDisableFieldProvisional
    #     Given Que eu busque e encontre a credencial de número "1000" cadastrada pela automação_005.
    #     When Clique no botão para realizar a alteração da credencial_005.
    #     Then Validar se o campo "Credencial provisória" está desabilitado.


    # #Validação dos valores salvos na credencial 1001
    # @verifyCompanyCredential
    # Scenario: verifyCompanyCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_001.
    #     When Clique no botão para realizar a alteração da credencial_006.
    #     Then Validar no cadstro da credencial o campo Empresa deve conter o valor "Estrutura teste 1".

    # @verifyNotPublicCredential
    # Scenario: verifyNotPublicCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_002.
    #     When Clique no botão para realizar a alteração da credencial_007.
    #     Then Validar no cadastro da credencial o campo "Credencial pública" deve estar desmarcado.

    # @verifyTechnologyBarCodeCredential
    # Scenario: verifyTechnologyBarCodeCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_003.
    #     When Clique no botão para realizar a alteração da credencial_008.
    #     Then Validar no cadastro da credencial o campo Tecnologia deve conter o valor "Código de Barras".

    # @verifyProvisionalCredential
    # Scenario: verifyProvisionalCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_004.
    #     When Clique no botão para realizar a alteração da credencial_009.
    #     Then Validar no cadastro da credencial o campo "Credencial provisória" deve estar marcado.

    # @verifySituationBlockedCredential
    # Scenario: verifySituationBlockedCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_005.
    #     When Clique no botão para realizar a alteração da credencial_010.
    #     Then Validar no cadastro da credencial o campo "Situação" deve estar com o valor "Bloqueado" selecionado.

    # @verifyReasonBlockedCredential
    # Scenario: verifyReasonBlockedCredential
    #     Given Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_006.
    #     When Clique no botão para realizar a alteração da credencial_011.
    #     Then Validar no cadastro da credencial o campo "Motivo" deve estar com o valor "Teste".


    # #Validação dos valores salvos na credencial 1002
    # @verifyCompany2Credential
    # Scenario: verifyCompany2Credential
    #     Given Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_001.
    #     When Clique no botão para realizar a alteração da credencial_012.
    #     Then Validar no cadastro da credencial o campo Empresa deve conter o valor "Estrutura teste 2".

    # @verifyTechnologySmartCardCredential
    # Scenario: verifyTechnologySmartCardCredential
    #     Given Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_002.
    #     When Clique no botão para realizar a alteração da credencial_013.
    #     Then Validar no cadastro da credencial o campo Tecnologia deve conter o valor "SmartCard".

    # @verifyTypeCredentialCredential
    # Scenario: verifyTypeCredentialCredential
    #     Given Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_003.
    #     When Clique no botão para realizar a alteração da credencial_014.
    #     Then Validar no cadastro da credencial o campo Tipo deve conter o valor "Credencial".

    @verifyValidityFieldCredential
    Scenario: verifyValidityFieldCredential
        Given Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_004.
        When Clique no botão para realizar a alteração da credencial_015.
        Then Validar no cadastro da credencial o campo Validade e Até deverão conter os valores esperados.

