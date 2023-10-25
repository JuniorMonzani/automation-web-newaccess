@registerDocType
Feature: Register Document Type
    Como um usuário do sistema que tenha permissão para Cadastrar Tipo de Documento.

    Background:
        Given Que o usuário esteja na página de cadastro de Tipo de Documento.
        
    @verifyLabelsDocType
    Scenario: verifyLabelsDocType
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de tipo de documento.

    @fieldSiglaRequiredDocType
    Scenario: fieldSiglaRequiredDocType
        Given Que esteja na tela de cadastro do tipo de documento
        When Preencher os campos Descrição, Validação e Tamanho com 'TesteTipoDoc', 'Nenhuma' e '11'
        And Clicar em 'Salvar'
        Then Deve ver a mensagem 'Preencha o campo Sigla'

    
    @fieldDescricaoRequiredDocType
    Scenario: fieldDescricaoRequiredDocType
        Given Que esteja na tela de cadastro do tipo de documento
        When Preencher os campos Sigla, Validação e Tamanho com 'TesteSigla', 'Nenhuma' e '11'
        And Clicar em 'Salvar'
        Then Deve ver a mensagem 'Preencha o campo Descrição'

   @saveDocType
   Scenario: saveDocType
    Given Que esteja na tela de cadastro do tipo de documento
    When Preencher os campos Sigla, Descrição, Validação e Tamanho com 'Auto', 'DocTypeAutomacao', 'Nenhuma' e '11'
    And Clicar em 'Salvar'
    Then Deve ver a mensagem 'Tipo de Documento salvo com sucesso'

    @saveDocTypeCpf
   Scenario: saveDocTypeCpf
    Given Que esteja na tela de cadastro do tipo de documento
    When Preencher os campos Sigla, Descrição, Validação e Tamanho com 'Auto', 'DocTypeAutomacaoCPF', 'Cpf' e '11'
    And Clicar em 'Salvar'
    Then Deve ver a mensagem 'Tipo de Documento salvo com sucesso'

    @saveDocTypePis
   Scenario: saveDocTypePis
    Given Que esteja na tela de cadastro do tipo de documento
    When Preencher os campos Sigla, Descrição, Validação e Tamanho com 'Auto', 'DocTypeAutomacaoPIS', 'Pis' e '12'
    And Clicar em 'Salvar'
    Then Deve ver a mensagem 'Tipo de Documento salvo com sucesso'


