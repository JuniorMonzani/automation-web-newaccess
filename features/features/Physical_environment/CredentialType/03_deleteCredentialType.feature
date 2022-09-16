@deleteCredentialType
Feature: deleteCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: deleteCredentialType
        Given Que estou na tela que lista os Tipos de Credencial cadastradas para realizar exclusões.

    @verifyValuesAuthenticationDeleteCredentialType
    Scenario: verifyValuesAuthenticationDeleteCredentialType
        Given Obter todos os valores do dropbox "Autenticação" na tela de exclusão de tipo de credencial e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Autenticação" na tela de exclusão.

    @verifyDeletionCredentialType
    Scenario: verifyDeletionCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial que não existe no sistema.
        Then Não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema.

    @verifyMessageDeleteCredentialType
    Scenario: verifyMessageDeleteCredentialType
        Given Que eu faça a busca para validar a mensagem de exclusão de um Tipo de Credencial que não esteja sendo usado no sistema.
        When Clicar no botão Excluir para validação da mensagem de exclusão de um Tipo de Credencial.
        Then Deve ser apresentada uma validação correspondente a mensagem esperada, indicando exclusão de Tipo de Credencial contendo os botões "Sim" e "Não" para a exclusão do Tipo de Credencial, conforme esperado.

    @confirmDeleteCredentialTypePerson
    Scenario: deleteCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial Pessoa.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Pessoa.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Pessoa.
   
    @confirmDeleteCredentialTypeVisitor
    Scenario: deleteCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial Visitante.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Visitante.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Visitante.

    @confirmDeleteCredentialTypeCredential
    Scenario: deleteCredentialType
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial Credencial.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial Credencial.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial Credencial.

     @confirmDeleteCredentialTypeMaxSize
     Scenario: confirmDeleteCredentialTupeMaxSize
        Given Que eu faça a busca para validar a exclusão de um Tipo de Credencial com quantidade máxima de caracteres no campo descrição.
        When Clicar no ícone "Excluir" para validação da exclusão de um Tipo de Credencial com quantidade máxima de caracteres no campo descrição.
        Then Na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial com quantidade máxima de caracteres no campo descrição.
    
    @verifyMessageDeleteCredentialTypeInUse
    Scenario: verifyMessageDeleteCredentialTypeInUse
        Given Que eu faça a busca e tente efetuar exclusão de um Tipo de Credencial que esteja sendo usado no sistema.
        And Clicar no ícone de exclusão.
        When Apresentar uma validação correspondente a mensagem esperada, indicando exclusão de Tipo de Credencial.
        Then Clicar em "Sim" para confirmar exclusão.