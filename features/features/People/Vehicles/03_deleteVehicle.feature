@deleteRegisterVehicle
Feature: Delete Register Vehicle
    Como um usuário do sistema que tenha permissão para Excluir veículo.

    Background:
        Given Que o usuário esteja na página que lista os veículos.

    @verifyFirstMessageForExclusionVehicle
    Scenario: verifyFirstMessageForExclusionVehicle
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Que faça a pesquisa pelo veículo alterado pela automação 'TST5678'
        When Clicar para excluir o veículo alterado pela automação: 'TST5678'.
        Then Uma mensagem deve ser apresentada na tela de exclusão de veículo: 'Confirma a exclusão?'

    @verifyNotDeletionVehicle
    Scenario: verifyNotDeletionVehicle
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Que faça a pesquisa pelo veículo alterado pela automação 'TST5678'
        When Clicar para excluir o veículo alterado pela automação: 'TST5678'.
        When Na mensagem apresentada clicar no botão 'Não'.
        Then Deve ver o veículo 'TST5678' cadastrada ainda.

    @verifyNotDeletionVehicleAssociated
    Scenario: verifyNotDeletionVehicleAssociated
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Que faça a pesquisa pelo veículo alterado pela automação 'AUT1234'
        When Clicar para excluir o veículo alterado pela automação: 'AUT1234'.
        When Na mensagem apresentada clicar no botão 'Sim'.
        Then Deve ver a mensagem na tela: '- O Veículo está em uso no sistema e não pode ser excluído'.    

    @verifyDeletionFirstDocType
    Scenario: verifyDeletionFirstDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Que faça a pesquisa pelo veículo alterado pela automação 'TST5678'
        When Clicar para excluir o veículo alterado pela automação 'TST5678'.
        When Na mensagem de confirmação apresentada clicar no botão 'Sim'.
        Then Deve ver a mensagem na tela: 'Veículo excluído com sucesso'

