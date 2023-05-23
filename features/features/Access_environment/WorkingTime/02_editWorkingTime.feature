@editWorkingTime
Feature: Edit Working Time
    Como um usuário do sistema que tenha permissão para Alterar a Jornada.

    Background:
        Given Que o usuário esteja na página que lista as Jornadas.

@verifyResourcesPageListWorkingTime
    Scenario Outline: verifyResourcesPageListWorkingTime
        Then Comparar os resources apresentados com os esperados na página de listagem de Jornadas

@verifyValuesComboBoxTypeWorkingTime
    Scenario: verifyValuesComboBoxTypeWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'TesteAutomação'
        When Obter os valores do combobox Tipo da tela de alteração da Jornada
        Then Comparar com os valores esperados do campo tipo: 'Semanal', 'Mensal', 'Periódica'

@verifyValuesWorkingTimeFields
    Scenario: verifyValuesWorkingTimeFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'TesteAutomaçãoSemanal'
        When Obter os valores dos campos Descrição, Tipo e Segunda-Feira .
        Then Devem ser exatamente os valores que foram cadastrados 'TesteAutomaçãoSemanal' , 'Semanal' , '1'.

@editWorkingTimeFields
    Scenario: editWorkingTimeFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada: 'TesteAutomaçãoSemanal'
        Given Inserir no campo Descrição o valor 'TesteAutomação iiiiiiiiiiiiiiiiiiiiii' e no campo Tipo o valor 'Mensal'.
        Given Inserir no campo do dia 1 o valor '1'
        When Clicar no botão Salvar.
        Then A Situação de Pessoa deve ser salvo com sucesso: 'Jornada alterada com sucesso!'

@verifyLenghtFieldWorkingTimeDescription
    Scenario: verifyLenghtFieldWorkingTimeDescription
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada: 'TesteAutomação iiiiiiiiiiiiiiiiiiiiii'
        When Obter o tamanho do campo Descrição.
        Then O tamanho obtido do campo Descrição deve ser '30'.

 @verifyValuesAfterEditWorkingTime
    Scenario: verifyValuesAfterEditWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada: 'TesteAutomação iiiiiiiiiiiiiiiiiiiiii'
        When Obter os valores dos campos 'Descrição' e 'Tipo'.
        Then Devem ser exatamente os valores que foram alterados 'TesteAutomação iiiiiiiiiiiiii' e 'Mensal'

