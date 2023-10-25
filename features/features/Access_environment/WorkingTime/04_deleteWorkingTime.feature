@deleteWorkingTime
Feature: Delete Working Time
    Como um usuário do sistema que tenha permissão para Excluir Jornada.

    Background:
        Given Que o usuário esteja na página que lista as Jornadas cadastradas.

    @verifyFirstMessageForExclusionWorkingTime
    Scenario: verifyFirstMessageForExclusionWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada alterada pela automação com Descrição 'TesteAutomação iiiiiiiiiiiiii'.
        When Clicar para excluir a jornada.
        Then Uma mensagem deve ser apresentada ao usuário na tela de exclusão de Jornada: 'Confirma a exclusão?'

    @verifyNotDeletionWorkingTime
    Scenario: verifyNotDeletionWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada alterada pela automação com Descrição 'TesteAutomação iiiiiiiiiiiiii'.
        Given Clicar para excluir a jornada.
        When Na mensagem apresentada clicar no botão Não.
        Then A jornada não deve ser excluída sendo ainda apresentado na tela.

    @verifyDeletionWorkingTime
    Scenario: verifyDeletionWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada alterada pela automação com Descrição 'TesteAutomação iiiiiiiiiiiiii'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'

    @verifyDeletionWorkingTime2
    Scenario: verifyDeletionWorkingTime2
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'TesteAutomaçãoMensal'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'

    @verifyDeletionWorkingTime3
    Scenario: verifyDeletionWorkingTime3
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'TesteAutomaçãoPeriodica'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'



    @verifyDeletionWorkingTimeMesCompleto
    Scenario: verifyDeletionWorkingTimeMesCompleto
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'AutomaçãoMesCompleto'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'

    @verifyDeletionWorkingTimeMesUmDia
    Scenario: verifyDeletionWorkingTimeMesUmDia
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'AutomaçãoMesUmDia'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'

    @verifyDeletionWorkingTimeDiasUteis
    Scenario: verifyDeletionWorkingTimeDiasUteis
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'AutomaçãoDiasUteis'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'

    @verifyDeletionWorkingTimeFimSemana
    Scenario: verifyDeletionWorkingTimeFimSemana
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'AutomaçãoFimSemana'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'


     @verifyDeletionWorkingTimeClone
    Scenario: verifyDeletionWorkingTimeClone
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrada pela automação com Descrição 'TesteAutomaçãoClone'.
        Given Clicar para excluir a jornada.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A jornada deve ser excluída com sucesso apresentando na tela a mensagem: 'Jornada excluída com sucesso'