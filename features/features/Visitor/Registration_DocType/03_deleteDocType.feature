@deleteRegisterDocType
Feature: Delete Register Document Type
    Como um usuário do sistema que tenha permissão para Excluir tipo de documento.

    Background:
        Given Que o usuário esteja na página que lista os Tipos de Documento.

    @verifyFirstMessageForExclusionDocType
    Scenario: verifyFirstMessageForExclusionDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir o tipo de documento alterada pela automação: 'DocTypeAutomacaoiiiiiiiiiiiiii'.
        Then Uma mensagem deve ser apresentada na tela de exclusão de tipo de documento: 'Confirma a exclusão?'

    @verifyNotDeletionDocType
    Scenario: verifyNotDeletionDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir o tipo de documento alterada pela automação: 'DocTypeAutomacaoiiiiiiiiiiiiii'.
        When Na mensagem apresentada clicar no botão 'Não'.
        Then Deve ver a situação 'DocTypeAutomacaoiiiiiiiiiiiiii' cadastrada ainda.

    @verifyDeletionFirstDocType
    Scenario: verifyDeletionFirstDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir o primeiro tipo de documento: 'DocTypeAutomacaoiiiiiiiiiiiiii'.
        When Na mensagem de confirmação apresentada clicar no botão 'Sim'.
        Then Deve ver a mensagem na tela: 'Tipo de Documento excluído com sucesso'

    @verifyDeletionDocTypeCPF
    Scenario: verifyDeletionDocTypeCPF
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir o primeiro tipo de documento: 'DocTypeAutomacaoCPF'.
        When Na mensagem de confirmação apresentada clicar no botão 'Sim'.
        Then Deve ver a mensagem na tela: 'Tipo de Documento excluído com sucesso'

    @verifyDeletionDocTypePIS
    Scenario: verifyDeletionDocTypePIS
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir o primeiro tipo de documento: 'DocTypeAutomacaoPIS'.
        When Na mensagem de confirmação apresentada clicar no botão 'Sim'.
        Then Deve ver a mensagem na tela: 'Tipo de Documento excluído com sucesso'
