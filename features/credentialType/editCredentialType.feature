@editCredentialType
Feature: EditCredentialType
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Tipo de Credencial

    Background: 
        Given Que estou na tela que lista os Tipos de Credencial cadastradas para realizar alterações.

    @verifyEditCredentialType
    Scenario: verifyEditCredentialType
        Given Que eu faça a busca e encontre o grupo de credenciais cadastradas pela Automação Pessoa.
        When Eu clico no ícone de alteração do tipo de credencial Automação Pessoa.
        Then Deve direcionar para a página de alteração de tipo de credencial Automação Pessoa.

    @verifyDescriptionMaxSizeCredentialType
    Scenario: verifyDescriptionMaxSizeCredentialType
        Given Que eu faça a busca e encontre o tipo de credencial cadastrada com a quantidade máxima de caracteres permitidos no campo "Descrição" sendo 50 caracteres.
        Then Deve ser apresentado 50 caracteres no campo Descrição do Tipo de Credencial que corresponde ao valor máximo esperado.

    @verifyAuthenticationPersonCredentialType
    Scenario: verifyAuthenticationPersonCredentialType
        Given Que faça a busca e encontre um Tipo de Credencial com autenticação em "Pessoa".
        When Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Pessoa".
        Then Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Pessoa".

    @verifyAuthenticationVisitorCredentialType
    Scenario: verifyAuthenticationVisitorCredentialType
        Given Que faça a busca e encontre um Tipo de Credencial com autenticação em "Visitante".
        When Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Visitante".
        Then Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Visitante".

    @verifyAuthenticationCredentialCredentialType
    Scenario: verifyAuthenticationCredentialCredentialType
        Given Que faça a busca e encontre um Tipo de Credencial com autenticação em "Credencial".
        When Eu clico no ícone de alteração do Tipo de Credencial cadastrada com autenticação em "Credencial".
        Then Deve direcionar para a página de alteração de tipo de credencial cadastrada com autenticação em "Credencial".

    @saveAlreadyExistsCredentialType
    Scenario: saveAlreadyExistsCredentialType
        Given Que eu insira uma descrição que já existe, faça a busca e encontre um grupo de credenciais já existente que foi cadastrada pela Automação Pessoa.
        When Clicar no botão "Salvar" para validação de Tipo de Credencial já existente.
        Then Deve ser apresentada uma validação correspondente a mensagem esperada, indicando que o Tipo de Credencial já existe.