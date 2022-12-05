@editHoliday
Feature: Edit Holiday
    Como um usuário do sistema que tenha permissão para Alterar Feriado.

    Background:
        Given Que o usuário esteja na página que lista os feriados cadastrados.

    @verifyResourcesPageListHoliday
    Scenario Outline: verifyResourcesPageListHoliday
        Then Comparar os resources apresentados com os esperados na página de listagem de Feriados.

    @verifyLenghtFieldSearchHoliday
    Scenario: verifyLenghtFieldSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter o tamanho do campo Descrição.
        Then O tamanho obtido do campo Descrição deve ser 30.

    @verifyValuesComboBoxMonthSearchHoliday
    Scenario: verifyValuesComboBoxMonthSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox Mês da tela de listagem de feriados.
        Then Comparar com os valores esperados.

    @verifyValuesComboBoxGroupSearchHoliday
    Scenario: verifyValuesComboBoxGroupSearchHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox Grupo da tela de listagem de feriados.
        Then Os valores obtidos devem ser exatamente os valores esperados.

    @searchNoResultsHoliday
    Scenario Outline: searchNoResultsHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Inserir no campo de busca Descrição o valor "<descricao_input>".
        Given Selecionar no combobox Mês o valor "<comboMes_input>".
        Given Selecionar no combobox Grupo o valor "<comboGrupo_input>".
        When Clicar em Buscar.
        Then Validar a informação apresentada ao usuário: 'Nenhum resultado foi encontrado'.

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
        Then Devem ser exatamente os valores que foram cadastrados 'Teste Automação iiiiiiiiiiiiii', '0709' e '1 - Portaria'.

    @editHolidayFields
    Scenario: editHolidayFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com Descrição 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        Given Inserir no campo Descrição o valor 'Teste alteração Automação', no campo Data o valor '2512', desassociar o Grupo '1 - Portaria' e associar o grupo '2 - Laboratorio'
        When Clicar no botão Salvar.
        Then O feriado deve ser salvo com sucesso.

    @verifyValuesAfterEditHoliday
    Scenario: verifyValuesAfterEditHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com o grupo '2 - Laboratorio'.
        Given Clicar no botão de alteração do feriado cadastrado pela automação.
        When Obter os valores dos campos Descrição, Data e Grupo associado.
        Then Devem ser exatamente os valores que foram alterados 'Teste alteração Automação', '2512' e '2 - Laboratorio'.