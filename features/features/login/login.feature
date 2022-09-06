@login
Feature: Login
    Realiza testes de login no sistema.

    Background:
        Given Que o usuário esteja na página de login do sistema.

    @invalidUser
    Scenario: invalidUser
        Given Que no campo "Login" eu informe um usuário que não existe cadastrado e informe a senha.
        When Quando clicar em "Entrar".
        Then Uma mensagem deve ser apresentada informando que o usuário é inexistente.

    @invalidPassword
    Scenario: invalidPassword
        Given Que no campo "Login" eu informe um usuário que existe cadastrado informando a senha errada.
        When Quando clicar em "Entrar".
        Then Uma mensagem deve ser apresentada informando a senha ou login não conferem.

    @correctLogin
    Scenario: correctLogin
        Given Que no campo "Login" eu informe um usuário que existe cadastrado com a senha válida.
        When Quando clicar em "Entrar".
        Then O login deve ser realizado com sucesso sendo direcionado para a página inicial.