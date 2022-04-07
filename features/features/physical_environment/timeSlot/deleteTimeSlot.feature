@deleteAreas
Feature: delete Time Slot
    Como um usuário do sistema que tenha permissão para Exclur Faixa horária.

    Background:
        Given Que o usuário esteja na página que lista as Faixas horárias objetivando exclusão.

    @searchByNumberTimeSlotNotExsist
    Scenario: searchByNumberTimeSlotNotExsist
        Given Desmarco a flag 10 últimas atualizações_01 objetivando exclusão de Faixa horária.
        When Eu preencho o textbox com um número de faixa horária que não existe objetivando exclusão de Faixa horária.
        And Clico em Buscar_01 objetivando exclusão de Feixa horária.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_01 objetivando exclusão de Feixa horária.

    @searchByNumberTimeSlotExsist
    Scenario: searchByNumberTimeSlotExsist
        Given Desmarco a flag 10 últimas atualizações_02 objetivando exclusão de Faixa horária.
        When Eu preencho o textbox com um número de grupo que existe_02 objetivando exclusão de Faixa horária.
        And Clico em Buscar_02 objetivando exclusão de Área.
        Then Validar se foi encontrada a Faixa horária esperada_01 objetivando exclusão de Faixa horária.

    @verifyMessageDeteleTimeSlotInUse
    Scenario:verifyMessageDeteleTimeSlotInUse
        Given Desmarco a flag 10 últimas atualizações_03 objetivando exclusão de Faixa horária.
        And Eu preencho o textbox com um número da Faixa horária "1" em uso, objetivando exclusão de Faixa horária.
        And Clico em Buscar_03 objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir_01 objetivando exclusão de Faixa horária.
        Then Validar a mensagem apresentada ao usuário_01 objetivando exclusão de Faixa horária.

    @verifyMessageDeteleTimeSlot
    Scenario: verifyMessageDeteleTimeSlot
        Given Desmarco a flag 10 últimas atualizações_04 objetivando exclusão de Faixa horária.
        And Que eu faça a busca e encontre a Faixa horária cadastrada pela automação_01 objetivando exclusão de Faixa horária.
        And Clico em Buscar_04 objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir_02 objetivando exclusão de Faixa horária.
        Then Validar a mensagem apresentada ao usuário_02 objetivando exclusão de Feixa horária.

    @deteleSuccessTimeSlot
    Scenario: deteleSuccessTimeSlot
        Given Desmarco a flag 10 últimas atualizações_05 objetivando exclusão de Faixa horária.
        And Que eu faça a busca e encontre a Faixa horária cadastrada pela automação_02 objetivando exclusão de Faixa horária.
        And Clico em Buscar_05 objetivando exclusão de Faixa horária.
        When Eu clico no ícone de Excluir_03 objetivando exclusão de Faixa horária.
        And Ao ser exibida a mensagem clicar em "Sim" objetivando exclusão de Feixa horária.
        And Validar se a Feixa horária foi excluída.