@deleteCredentialType
Feature: deleteCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: deleteCredentialType
        Given Que estou na tela que lista os Tipos de Credencial cadastradas para realizar exclusões.

    @verifyMessageDeleteCredentialType
    Scenario: verifyMessageDeleteCredentialType
        Given Que eu faça a busca para validar a mensagem de exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
        When Clicar no botão Excluir para validação da mensagem de exclusão de um Tipo de Credencial.
        Then Deve ser apresentada uma validação correspondente a mensagem esperada, indicando exclusão de Tipo de Credencial contendo os botões "Sim" e "Não" para a exclusão do Tipo de Credencial, conforme esperado.

    @confirmDeleteCredentialType
    Scenario: deleteCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.

    @verifyDeletionCredentialType
    Scenario: verifyDeletionCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que foi excluído do sistema.
        Then Não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema.