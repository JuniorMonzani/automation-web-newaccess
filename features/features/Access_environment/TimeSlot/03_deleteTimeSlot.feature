@deleteTimeSlot
Feature: delete Time Slot
    Como um usuário do sistema que tenha permissão para Exclur Faixa horária.

    Background:
        Given Que o usuário esteja na página que lista as Faixas horárias objetivando exclusão.

    
    @verifyMessageDeteleTimeSlotInUse
    Scenario:verifyMessageDeteleTimeSlotInUse
        Given Desmarco a flag '10 últimas atualizações' objetivando exclusão de Faixa horária.
        And Eu preencho o textbox com um número da Faixa horária "1" em uso, objetivando exclusão de Faixa horária.
        And Clico em 'Buscar' objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir objetivando exclusão de Faixa horária.
        And Confirmo a exclusão
        Then Validar a mensagem apresentada: '- Esta Faixa Horária está em uso no sistema e não pode ser excluída'

    @verifyMessageDeteleTimeSlot
    Scenario: verifyMessageDeteleTimeSlot
        Given Desmarco a flag '10 últimas atualizações' objetivando exclusão de Faixa horária.
        And Que eu faça a busca pelo código "888888" objetivando exclusão de Faixa horária.
        And Clico em 'Buscar' objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir objetivando exclusão de Faixa horária.
        Then Devo ver a seguinte mensagem: 'Confirma a exclusão?'.

    @deteleSuccessTimeSlot
    Scenario: deteleSuccessTimeSlot
        Given Desmarco a flag '10 últimas atualizações' objetivando exclusão de Faixa horária.
        And Que eu faça a busca pela faixa "888888" cadastrada pela automação objetivando exclusão de Faixa horária.
        And Clico em 'Buscar' objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir objetivando exclusão de Faixa horária.
        And Ao ser exibida a mensagem clicar em "Sim" objetivando exclusão de Feixa horária.
        Then A seguinte mensagem será exibida: 'Faixa Horária excluída com sucesso'