@registerTimeSlots
Feature: Register Time Slots
    Como um usuário do sistema que tenha permissão para Cadastrar Faixas Horárias.

    Background:
        Given Que o usuário esteja na página de cadastro de Faixas Horárias.

    @verifyLabelsTimeSlots
    Scenario: verifyLabelsTimeSlots
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de faixas horárias.

    @fieldNumberRequiredTimeSlots
    Scenario: fieldNumberRequiredTimeSlots
        Given Informar caractere alfanumérico no campo "Número" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número" da tela Faixas Horárias.
        Then Deve existir uma validação no campo "Número" da tela Faixas Horárias pois o mesmo é obrigatório e só aceita caracteres numéricos.

    @fieldTimeSlotThen0
    Scenario: fieldTimeSlotThen0
        Given Informar valor "0" no campo "Número" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número" da tela Faixas Horárias com o valor zero.
        Then Deve existir uma validação no campo "Número" da tela Faixas Horárias pois no mesmo é obrigatório um valor acima de zero.

    @fieldTimeSlotThen256
    Scenario: fieldTimeSlotThen256
        Given Informar valor "256" no campo "Número" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número" da tela Faixas Horárias com o valor "256".
        Then Deve existir uma validação no campo "Número" da tela Faixas Horárias pois no mesmo é obrigatório um valor abaixo de duzentos e cinquenta e seis.

    @fieldDescriptionRequiredTimeSlots
    Scenario: fieldDescriptionRequiredTimeSlots
        Given Não preencher o campo "Descrição" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Descrição" da tela Faixas Horárias.
        Then Deve existir uma validação no campo "Descrição" da tela Faixas Horárias pois o mesmo é obrigatório e não foi informado.

    @fieldStartDateRequiredTimeSlots
    Scenario: fieldStartDateRequiredTimeSlots
        Given Informar caractere alfanumérico no campo "Hora inicial" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Hora inicial" da tela Faixas Horárias.
        Then Deve existir uma validação no campo "Hora inicial" da tela Faixas Horárias pois o mesmo é obrigatório e só aceita caracteres numéricos.

    @fieldEndDateRequiredTimeSlots
    Scenario: fieldEndDateRequiredTimeSlots
        Given Informar caractere alfanumérico no campo "Hora final" da tela Faixas Horárias e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Hora final" da tela Faixas Horárias.
        Then Deve existir uma validação no campo "Hora final" da tela Faixas Horárias pois o mesmo é obrigatório e só aceita caracteres numéricos.

    @verifyMessageBaseboard
    Scenario: verifyMessageBaseboard
        Given Que eu verifico e comparo a mensagem de rodapé na página de cadastro de Faixas Horárias.
       
    @registerTimeSlotsSuccess
    Scenario: registerTimeSlotsSuccess
        Given Preencher o campo Número com o valor "255".
        And Preencher o campo Descrição com o máximo de caracteres possíveis no campo.
        And Preencher todos os campos de "Hora inicial" e "Hora final" corretamente para efetuar o cadastro.
        When Clicar no botão Salvar para salvar a faixas horárias.
        Then A faixa horária deve ser salva com sucesso no cadastro.