@deleteShift
Feature: Delete Shift
    Como um usuário do sistema que tenha permissão para Excluir Turno.

    Background:
        Given Que o usuário esteja na página que lista os turnos cadastrados.

    @verifyFirstMessageForExclusion
    Scenario: verifyFirstMessageForExclusion
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno alterado pela automação.
        When Clicar para excluir o turno.
        Then Uma mensagem deve ser apresentada ao usuário: 'Confirma a exclusão?'

    @verifySecondMessageForExclusion
    Scenario: verifySecondMessageForExclusion
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno 1.
        Given Clicar para excluir o turno.
        When Na mensagem apresentada clicar no botão Sim.
        Then Uma mensagem deve ser apresentada ao usuário: '- O Turno está em uso no sistema e não pode ser excluído'

    @verifyNotDeletionShift
    Scenario: verifyNotDeletionShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para excluir o turno.
        When Na mensagem apresentada clicar no botão Não.
        Then O turno não deve ser excluído sendo ainda apresentado na tela.

    @verifyDeletionShift
    Scenario: verifyDeletionShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para excluir o turno.
        When Na mensagem apresentada clicar no botão Sim.
        Then O turno deve ser excluído com sucesso apresentando na tela a mensagem: 'Turno excluído com sucesso'