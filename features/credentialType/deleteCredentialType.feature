@deleteCredentialType
Feature: deleteCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: deleteCredentialType
        Given que estou na tela que lista os Tipos de Credencial cadastradas

    @verifyMessageDeleteCredentialType
    Scenario: verifyMessageDeleteCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu clico no ícone "Excluir" de um Tipo de Credencial (que não esteja sendo usado no sistema)
        Then uma validação deve ser apresentada onde a mensagem deve correspender a mensagem esperada
        And deve existir os botões "Sim" e "Não" (para a exclusão do Tipo de Credemncial) conforme esperado

    @deleteCredentialType
    Scenario: deleteCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu clico no ícone "Excluir" de um Tipo de Credencial (que não esteja sendo usado no sistema)
        Then na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial

    @verifyDeletionCredentialType
    Scenario: verifyDeletionCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu busco o Tipo de Credencial que foi exlcuído do sistema
        Then não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema