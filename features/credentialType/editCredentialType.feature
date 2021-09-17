@editCredentialType
Feature: EditCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: 
        Given que estou na tela que lista os Tipos de Credencial cadastradas para realizar alterações.

    @verifyEditCredentialType
    Scenario: verifyEditCredentialType
        Given Que eu faça a busca e encontre o grupo de credenciais cadastradas pela Automação Pessoa.
        When Eu clico no ícone de alteração do tipo de credencial Automação Pessoa.
        Then Deve direcionar para a página de alteração de tipo de credencial Automação Pessoa.

    # @verifyDescriptionMaxSizeCredentialType
    # Scenario: verifyDescriptionMaxSize
    #     Given que estou na lista de Tipos de Credencial cadastradas
    #     And tenho um Tipo de Credencial cadastrado com o máximo permitido de caracteres no campo "Descrição" (50 caracteres)
    #     When eu verifico a quantidade de caracteres da descrição
    #     Then o tamanho da Descrição do Tipo de Credencial deve corresponder ao valor máximo esperado (50 caracteres)

    # @verifyAuthenticationPersonCredentialType
    # Scenario: verifyAuthenticationPerson
    #     Given que tenha cadastrado um Tipo de Credencial com autenticação em "Pessoa"
    #     When eu verifico o tipo de autenticação
    #     Then deve ser do tipo "Pessoa"

    # @verifyAuthenticationVisitorCredentialType
    # Scenario: verifyAuthenticationVisitor
    #     Given que tenha cadastrado um Tipo de Credencial com autenticação em "Visitante"
    #     When eu verifico o tipo de autenticação
    #     Then deve ser do tipo "Visitante"

    # @verifyAuthenticationCredentialCredentialType
    # Scenario: verifyAuthenticationCredential
    #     Given que tenha cadastrado um Tipo de Credencial com autenticação em "Credencial"
    #     When eu verifico o tipo de autenticação
    #     Then deve ser do tipo "Credencial"

    # @saveAlreadyExistsCredentialType
    # Scenario: saveCredentialTypeAlreadyExists
    #     Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
    #     And insiro uma descrição que já existe cadatrada para outro Tipo de Credencial
    #     When eu clico no botão "Salvar"
    #     Then uma validação deve ser apresentada onde a mensagem deve correspender a mensagem esperada