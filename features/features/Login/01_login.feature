@login
Feature: Login
    Realiza testes de login no sistema.

    Background:
        Given Que o usuário esteja na página de login do sistema.

    @invalidLoginTests
    Scenario Outline: invalidLoginTests
        Given Que insira o login do usuário no campo "<login_input>" 
        And Informe a senha no campo "<senha_input>"
        When Clicar em Entrar.
        Then Validar a mensagem de alerta: "<mensagem_output>"

            Examples:
            |login_input    |senha_input    |mensagem_output                                            |
            |teste123       |teste123       |- Senha ou login não conferem. Por favor, tente novamente. |
            |Admin          |teste123       |- Senha ou login não conferem. Por favor, tente novamente. |

    @correctLogin
    Scenario: correctLogin
        Given Que no campo "Login" eu informe um usuário que existe cadastrado com a senha válida.
        When Clicar em Entrar.
        Then O login deve ser realizado com sucesso sendo direcionado para a página inicial.