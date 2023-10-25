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
        Given Clico no botão alterar da Jornada 'Jornada Integral Semanal'
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
        Given Clico no botão alterar da Jornada 'TesteAutomaçãoSemanal'
        Given Inserir no campo Descrição o valor 'TesteAutomação iiiiiiiiiiiiiiiiiiiiii' e no campo Tipo o valor 'Mensal' na tela de Jornada.
        Given Inserir no campo do dia primeiro o valor '1'
        When Clicar no botão Salvar.
        Then A Situação de Pessoa deve ser salvo com sucesso: 'Jornada alterada com sucesso!'

@verifyLenghtFieldWorkingTimeDescription
    Scenario: verifyLenghtFieldWorkingTimeDescription
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'TesteAutomação iiiiiiiiiiiiiii'
        When Obter o tamanho do campo Descrição da tela de Jornada.
        Then O tamanho obtido do campo Descrição da Jornada deve ser '30'.

 @verifyValuesAfterEditWorkingTime
    Scenario: verifyValuesAfterEditWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'TesteAutomação iiiiiiiiiiiiiii'
        When Obter os valores dos campos 'Descrição' e 'Tipo' da Jornada.
        Then Devem ser exatamente os valores que foram alterados na Jornada 'TesteAutomação iiiiiiiiiiiiiii' e 'Mensal'





#cenários adicionados depois, validar os campos de autopreenchimento
@verifyWorkingTimeAutoCompletarFimSemana
        Scenario: verifyWorkingTimeAutoCompletarFimSemana
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'AutomaçãoFimSemana'
        When Obter os valores dos campos Domingo e Sábado.
        Then Devem ser exatamente os valores que foram cadastrados na Jornada '1' e '1'

    @verifyWorkingTimeAutoCompletarDiasUteis
        Scenario: verifyWorkingTimeAutoCompletarDiasUteis
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'AutomaçãoDiasUteis'
        When Obter os valores dos campos de dias úteis.
        Then Devem ser exatamente os valores que foram cadastrados na Jornada '1', '1', '1', '1', '1'

    @verifyWorkingTimeAutoCompletarMensalUmDia
        Scenario: verifyWorkingTimeAutoCompletarMensalUmDia
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'AutomaçãoMesUmDia'
        When Obter os valores dos campos do dia primeiro e trinta e um.
        Then Devem ser exatamente os valores que foram cadastrados na Jornada Mensal '1' e ''

    @verifyWorkingTimeAutoCompletarMensalTodosDias
        Scenario: verifyWorkingTimeAutoCompletarMensalTodosDias
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Jornada 'AutomaçãoMesCompleto'
        When Obter os valores dos campos do dia primeiro e trinta e um.
        Then Devem ser exatamente os valores que foram cadastrados na Jornada Total '1' e '1'



