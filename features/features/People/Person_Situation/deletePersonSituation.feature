@deletePersonSituation
Feature: Delete Person Situation
    Como um usuário do sistema que tenha permissão para Excluir Situação de Pessoa.

    Background:
        Given Que o usuário esteja na página que lista as Situações de Pessoas.

    @verifyFirstMessageForExclusionPersonSituation
    Scenario: verifyFirstMessageForExclusionHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a Situação Pessoa alterada pela automação: 'Aut.Permitido iiiiii'.
        Then Uma mensagem deve ser apresentada na tela de exclusão de situação pessoa: 'Confirma a exclusão?'

    @verifyNotDeletionPersonSituation
    Scenario: verifyNotDeletionPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a Situação Pessoa alterada pela automação: 'Aut.Permitido iiiiii'.
        When Na mensagem apresentada clicar no botão Não.
        Then A Situação Pessoa não deve ser excluída sendo ainda apresentado na tela.

    @verifyDeletionPersonSituationUsed
    Scenario: verifyDeletionPersonSituationUsed
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a Situação Pessoa: 'Permitido'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa não deve ser excluída apresentando na tela a mensagem: '- A situação está em uso ou foi utilizada no sistema e não pode ser excluída'


    @verifyDeletionFirstPersonSituation
    Scenario: verifyDeletionFirstPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a primeira Situação Pessoa: 'Aut.Permitido iiiiii'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: 'Situação de Pessoa excluída com sucesso'


        @verifyDeletionSecondPersonSituation
    Scenario: verifyDeletionSecondPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a segunda Situação Pessoa: 'Aut.Bloqueado'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: 'Situação de Pessoa excluída com sucesso'


        @verifyDeletionThirdPersonSituation
    Scenario: verifyDeletionThirdPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a terceira Situação Pessoa: 'Aut.Mult'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: 'Situação de Pessoa excluída com sucesso'


        @verifyDeletionFourthPersonSituation
    Scenario: verifyDeletionFourthPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a quarta Situação Pessoa: 'Aut.BloqPeriodo'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: 'Situação de Pessoa excluída com sucesso'


        @verifyDeletionFifthPersonSituation
    Scenario: verifyDeletionFifthPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Clicar para excluir a quinta Situação Pessoa: 'Aut.LiberadoPeriodo'.
        When Na mensagem de confirmação apresentada clicar no botão Sim.
        Then A Situação Pessoa deve ser excluída com sucesso apresentando na tela a mensagem: 'Situação de Pessoa excluída com sucesso'