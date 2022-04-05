@deleteCredential
Feature: delete Credential
    Como um usuário do sistema que tenha permissão para Excluir Credenciais.

    Background:
        Given Que o usuário esteja na página que lista as Credenciais para realizar exclusões.

    #Cenários de exclusão
    @verifyMessageAfterDeleteCredentialInUse
    Scenario: verifyMessageAfterDeleteCredentialInUse
        Given Que eu busque e encontre a credencial de número "1" cadastrada.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema.
        And Na mensagem apresentada, clicam em "Sim"_001.
        Then A mensagem apresentada deve corresponder com a mensagem esperada.

    @noDeleteCredential
    Scenario: noDeleteCredential
        Given Que eu busque e encontre a credencial de número "1000" cadastrada_001.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_001.
        And Na mensagem apresentada, clicam em "Não".
        And Que eu busque e encontre a credencial de número "1000" cadastrada_002.
        Then A credencial "1000" ainda deve estar cadastrada no sistema.

    @verifyDeleteCredencial1000
    Scenario: verifyDeleteCredencial1000
        Given Que eu busque e encontre a credencial de número "1000" cadastrada_003.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_002.
        And Na mensagem apresentada, clicam em "Sim"_002.
        And Que eu busque a credencial de número "1000".
        Then Validar a informação que o resultado não foi encontrado_001.

    @verifyDeleteCredencial1001
    Scenario: verifyDeleteCredencial1001
        Given Que eu busque e encontre a credencial de número "1001" cadastrada.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_003.
        And Na mensagem apresentada, clicam em "Sim"_003.
        And Que eu busque a credencial de número "1001".
        Then Validar a informação que o resultado não foi encontrado_002.

    @verifyDeleteCredencial1002
    Scenario: verifyDeleteCredencial1002
        Given Que eu busque e encontre a credencial de número "1002" cadastrada.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_004.
        And Na mensagem apresentada, clicam em "Sim"_004.
        And Que eu busque a credencial de número "1002".
        Then Validar a informação que o resultado não foi encontrado_003.

    @verifyDeleteCredencial1003
    Scenario: verifyDeleteCredencial1003
        Given Que eu busque e encontre a credencial de número "1003" cadastrada.
        When Clicar no ícone "Excluir" para tentar exlcuir a credencial do sistema_005.
        And Na mensagem apresentada, clicam em "Sim"_005.
        And Que eu busque a credencial de número "1003".
        Then Validar a informação que o resultado não foi encontrado_004.