@editHoliday
Feature: Edit Holiday
    Como um usuário do sistema que tenha permissão para Alterar Feriado.

    Background:
        Given Que o usuário esteja na página que lista os feriados cadastrados.

    @verifyResourcesPageListHoliday
    Scenario Outline: verifyResourcesPageListHoliday
        Then Comparar os resources apresentados com os esperados na página de listagem de Feriados.
    
    @verifyValuesComboBoxMonthSearchHoliday
    Scenario Outline: verifyValuesComboBoxMonthSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox Mês da tela de listagem de feriados.
        Then Comparar com os valores esperados: "<meses_output>"

            Examples:
            |meses_output|
            |Todos|
            |Janeiro|
            |Fevereiro|
            |Março|
            |Abril|
            |Maio|
            |Junho|
            |Julho|
            |Agosto|
            |Setembro|
            |Outubro|
            |Novembro|
            |Dezembro|

    @verifyValuesComboBoxGroupSearchHoliday
    Scenario: verifyValuesComboBoxGroupSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox Grupo da tela de listagem de feriados.
        Then Os valores obtidos devem ser exatamente os valores esperados: 'Todos', 'Portaria', 'Laboratorio'

    @searchNoResultsHoliday
    Scenario Outline: searchNoResultsHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Inserir os valores nos campos descrição "<descricao_input>" mês "<comboMes_input>" e grupo "<comboGrupo_input>".
        When Clicar em Buscar.
        Then Validar a informação apresentada ao usuário na tela de feriado: 'Nenhum resultado foi encontrado'.

            Examples:
            |descricao_input|comboMes_input|comboGrupo_input|
            |abcd           |Todos         |Todos           |
            |               |Janeiro       |Todos           |
            |               |Fevereiro     |Todos           |
            |               |Março         |Todos           |
            |               |Abril         |Todos           |
            |               |Maio          |Todos           |
            |               |Junho         |Todos           |
            |               |Julho         |Todos           |
            |               |Agosto        |Todos           |
            |               |Outubro       |Todos           |
            |               |Novembro      |Todos           |
            |               |Dezembro      |Todos           |
            |               |Todos         |Laboratorio     |

    @verifyValuesHolidayFields
    Scenario: verifyValuesHolidayFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        When Obter os valores dos campos Descrição, Data e Grupo associado.
        Then Devem ser exatamente os valores que foram cadastrados 'Teste Automação iiiiiiiiiiiiii', '07/09' e '1 - Portaria'.

    
    @editHolidayFields
    Scenario: editHolidayFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        Given Inserir no campo Descrição o valor 'Teste alteração Automação iiiiiiiiiiiiiiiii', no campo Data o valor '2512', desassociar o Grupo '1 - Portaria' e associar o grupo '2 - Laboratorio'
        When Clicar no botão Salvar.
        Then O feriado deve ser salvo com sucesso.

    @verifyLenghtFieldSearchHoliday
    Scenario: verifyLenghtFieldSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado alterado pela automação com Descrição 'Teste alteração Automação iiiiiiiiiiiiiiiii'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        When Obter o tamanho do campo Descrição e Data.
        Then O tamanho obtido do campo Descrição deve ser '30' e o campo Data deve ser '5'.

    @verifyValuesAfterEditHoliday
    Scenario: verifyValuesAfterEditHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado alterado pela automação com o grupo 'Laboratorio'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        When Obter os valores dos campos Descrição, Data e Grupo associado.
        Then Devem ser exatamente os valores que foram alterados 'Teste alteração Automação iiii', '25/12' e '2 - Laboratorio'.