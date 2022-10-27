@deleteHoliday
Feature: Delete Holiday
    Como um usuário do sistema que tenha permissão para Excluir Feriado.

    Background:
        Given Que o usuário esteja na página que lista os feriados cadastrados.

    @verifyFirstMessageForExclusionHoliday
    Scenario: verifyFirstMessageForExclusionHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste alteração Automação'.
        When Clicar para excluir o feriado.
        Then Uma mensagem deve ser apresentada ao usuário: 'Confirma a exclusão?'

    @verifyNotDeletionHoliday
    Scenario: verifyNotDeletionHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste alteração Automação'.
        Given Clicar para excluir o feriado.
        When Na mensagem apresentada clicar no botão Não.
        Then O feriado não deve ser excluído sendo ainda apresentado na tela.

    @verifyDeletionHoliday
    Scenario: verifyDeletionHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste alteração Automação'.
        Given Clicar para excluir o feriado.
        When Na mensagem apresentada clicar no botão Sim.
        Then O feriado deve ser excluído com sucesso apresentando na tela a mensagem: 'Feriado excluído com sucesso'