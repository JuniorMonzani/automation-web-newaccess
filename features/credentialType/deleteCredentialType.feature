@deleteCredentialType
Feature: deleteCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: deleteCredentialType
        Given Que estou na tela que lista os Tipos de Credencial cadastradas para realizar exclusões.

    @verifyDeletionCredentialType
    Scenario: verifyDeletionCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não existe no sistema.
        Then Não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema.

    @confirmDeleteCredentialTypePerson
    Scenario: deleteCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.

    # @confirmDeleteCredentialTypeCredential
    # Scenario: deleteCredentialType
    #     Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
    #     When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.
    #     Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.

    # @confirmDeleteCredentialTypeVisitor
    # Scenario: deleteCredentialType
    #     Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
    #     When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial.
    #     Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial.