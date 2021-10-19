#26
@registerAreas
Feature: Register Areas
    Como um usuário do sistema que tenha permissão para Cadastrar Áreas.

    Background:
        Given Que o usuário esteja na página de cadastro de Áreas.

    @verifyLabelsAreas
    Scenario: verifyLabelsAreas
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de áreas.

    @verifyFieldCapacityDisabled
    Scenario: verifyFieldCapacityDisabled
        Given Desmarcar o checkbox Capacity Control da tela Áreas.
        Then O campo Capacity da tela Áreas deve ficar desabilitado.

    @fieldNumberRequiredAreas
    Scenario: fieldNumberRequiredAreas
        Given Informar caractere alfanumérico no campo "Número" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número" da tela Áreas.
        Then Deve existir uma validação no campo "Número" da tela Áreas pois o mesmo é obrigatório e só aceita caractere numérico.

    @fieldDescriptionRequiredAreas
    Scenario: fieldDescriptionRequiredAreas
        Given Não preencher o campo "Descrição" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Descrição" da tela Áreas.
        Then Deve existir uma validação no campo "Descrição" da tela Áreas pois o mesmo é obrigatório e não foi informado.

    @fieldCapacityRequiredAreas
    Scenario: fieldCapacityRequiredAreas
        Given Informar caractere alfanumérico no campo "Capacidade" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Capacidade" da tela Áreas com caracter alfanumérico.
        Then Deve existir uma validação no campo "Capacidade" da tela Áreas pois o mesmo é obrigatório e não foi informado.

    @fieldCapacityThanZero
    Scenario: fieldCapacityThanZero
        Given Informar valor zero no campo "Capacidade" da tela Áreas.
        When Clicar no botão Salvar para validar o campo "Capacidade" da tela Áreas com valor 0.
        Then Deve existir uma validação no campo "Capacidade" da tela Áreas pois no mesmo é obrigatório um valor acima de zero.

    @fieldNumberThanZero
    Scenario: fieldNumberThanZero
        Given Informar valor zero no campo "Número" da tela Áreas.
        When Clicar no botão Salvar para validar o campo "Número" da tela Áreas com valor 0.
        Then Deve existir uma validação no campo "Número" da tela Áreas pois no mesmo é obrigatório um valor acima de zero.

    @registerAreasSuccess
    Scenario: registerAreasSuccess
        Given Preencher o campo Número com "9999".
        And Preencher o campo Descrição com o máximo de caracteres possíveis no campo.
        And Preencher o campo Capacidade com "99999".
        And Marcar todos os checkbox exceto Controle de Capacidade.
        When Clicar no botão Salvar para salvar a área.
        Then A Área deve ser salva com sucesso no cadastro.