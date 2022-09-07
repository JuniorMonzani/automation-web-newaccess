@editTimeSlots
Feature: edit Time Slots
    Como um usuário do sistema que tenha permissão para Alterar Faixas Horárias.

    Background:
        Given Que o usuário esteja na página que lista as Faixas Horárias objetivando alteração.

    @verifyEditTimeSlots
    Scenario: verifyEditTimeSlots
        Given Que eu faça a busca e encontre o conjunto de Faixa Horária cadastrada pela automação_01 objetivando alteração.
        When Eu clico no ícone de alteração de conjunto de Faixa Horária_01 objetivando alteração.
        Then Deve direcionar para a página de alteração de conjunto de Faixa Horária.

    @verifyFieldNumberOfTimeSlotsDisabled
    Scenario: verifyFieldNumberOfTimeSlotsDisabled
        Given Que eu faça a busca e encontre o conjunto de Faixa Horária cadastrada pela automação_02 objetivando alteração.
        When Eu clico no ícone de alteração de conjunto de Faixa Horária_02 objetivando alteração.
        Then Na tela de alteração de conjunto de Faixa Horária eu verifico o campo Número e o mesmo deve estar desabilitado.

    @verifyNumberTimeSlots
    Scenario: verifyNumberTimeSlots
        Given Que eu faça a busca e encontre o conjunto de Faixa Horária cadastrada pela automação_03 objetivando alteração.
        When Eu clico no ícone de alteração de conjunto de Faixa Horária_03 objetivando alteração.
        Then O número deve ser exatamente o número cadastrado para o conjunto de Faixa Horária.

    @verifyHoursTimeSlots
    Scenario: verifyHoursTimeSlots
        Given Que eu faça a busca e encontre o conjunto de Faixa Horária cadastrada pela automação_04 objetivando alteração.
        When Eu clico no ícone de alteração de conjunto de Faixa Horária_04 objetivando alteração.
        Then A "Hora inicial" e "Hora final" obrigatórias devem ser exatamente as mesmas cadastradas para o conjunto de Faixa Horária.

    @verifyHoursTimeSlots
    Scenario: verifyHoursTimeSlots
        Given Que eu faça a busca e encontre o conjunto de Faixa Horária cadastrada pela automação_05 objetivando alteração.
        When Eu clico no ícone de alteração de conjunto de Faixa Horária_05 objetivando alteração.
        And Alterar a "Hora inicial" e "Hora final" obrigatórias.
        And Clicar no botão Salvar para salvar as alterações no conjunto de Faixa horária.
        Then O conjunto de Faixa horária deve ser salva com sucesso na edição.