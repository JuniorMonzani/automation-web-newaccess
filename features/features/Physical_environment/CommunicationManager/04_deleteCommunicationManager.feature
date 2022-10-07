@deleteCommunicationManager
Feature: Delete Communication Manager
    Como um usuário do sistema que tenha permissão para Excluir um Gerenciadores de Comunicação.
    
    Background:
        Given Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.

    @verifyFirstMessageDeleteCommunicationManager
    Scenario: verifyFirstMessageDeleteCommunicationManager
        Given Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação.
        When Ao clicar no botão de exclusão.
        Then A mensagem apresentada deve ser: "Confirma a exclusão?"

    @noDeleteCommunicationManager
    Scenario: noDeleteCommunicationManager
        Given Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação.
        When Ao clicar no botão de exclusão.
        And Clicar no botão Não para não excluir o gerenciador.
        Then Pesquisar e encontrar o gerenciador cadastrado pela automaçao confirmando que não foi excluído.

    @verifySecondMessageDeleteCommunicationManager
    Scenario: verifySecondMessageDeleteCommunicationManager
        Given Que pesquise e encontre o gerenciador de comunicação "<descricao_input>".
        When Ao clicar no botão de exclusão.
        And Clicar no botão Sim da primeira mensagem apresentada.
        Then A mensagem apresentada deve ser validada conforme o esperado. "<mensagem_output>"

        #Exemples:
        #|descricao_input     | mensagem_output                                                               |
        #|Minha Maquina Client| - O Gerenciador de Comunicação está em uso no sistema e não pode ser excluído |

    @deleteCommunicationManager
    Scenario: deleteCommunicationManager
        Given Que pesquise e encontre o gerenciador de comunicação cadastrado pela automação.
        When Ao clicar no botão de exclusão.
        And Clicar no botão Sim para excluir o gerenciador.
        Then Pesquisar e não encontrar o gerenciador cadastrado pela automaçao confirmando que foi excluído.

    @deleteAllCommunicationManager
    Scenario: deleteAllCommunicationManager
        Given Que pesquise e encontre os gerenciadores de comunicação cadastrados pela automação.
        When Ao clicar no botão de exclusão.
        And Clicar no botão Sim para excluir o gerenciador.
        Then Pesquisar e encontrar o gerenciador cadastrado pela automaçao confirmando que foi excluído.

    