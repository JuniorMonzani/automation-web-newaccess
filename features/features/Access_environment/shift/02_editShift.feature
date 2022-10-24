@editShift
Feature: Edit Shift
    Como um usuário do sistema que tenha permissão para Editar Turno.

    Background:
        Given Que o usuário esteja na página que lista os turnos cadastrados.

    @verifyValuesComboBoxSearch
    Scenario: verifyValuesComboBoxSearch
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox de pesquisa da tela de listagem de Turnos.
        Then Comparar com os valores esperados.

    @searchNoResultsShift
    Scenario Outline: searchNoResultsShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Selecionar o "<valorCombo_input>".
        Given Inserir no campo de busca o valor "<valorBusca_input>".
        When Clicar em Buscar.
        Then Validar a informação apresentada ao usuário: 'Nenhum resultado foi encontrado'.

            Examples:
            |valorCombo_input   |valorBusca_input|
            |Número             |9876            |
            |Descrição          |9876            |
            |N° da faixa horária|9876            |

    @searchCorrectShift
    Scenario Outline: searchCorrectShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Selecionar o "<valorCombo_input>".
        Given Inserir no campo de busca o valor "<valorBusca_input>".
        When Clicar em Buscar.
        Then Valida se o Turno foi encontrado.

            Examples:
            |valorCombo_input   |valorBusca_input              |
            |Número             |123456                        |
            |Descrição          |Teste Automação iiiiiiiiiiiiii|
            |N° da faixa horária|1                             |  

    @disassociateTimeSlotVerifyRequire
    Scenario: disassociateTimeSlotVerifyRequire
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Desassociar a faixa horária 1.
        When Clicar em Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- Ao menos uma Faixa Horária deve ser selecionada'

    @clearFieldsVerifyRequired
    Scenario Outline: clearFieldsVerifyRequired
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Preencher o campo Descrição com valor "<descricao_input>".
        Given Preebcher o campo Hora virada com valor "<horavirada_input>".
        When Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade informando o motivo: "<mensagem_output>".

            Examples:
            |descricao_input               |horavirada_input|mensagem_output            |
            |                              |1200            |Informe a Descrição        |
            |Teste Automação iiiiiiiiiiiiii|                |Informe a Hora virada      |
            |Teste Automação iiiiiiiiiiiiii|2400            |A hora digitada é inválida!|
            |Teste Automação iiiiiiiiiiiiii|3333            |Informe a Hora virada      |
            |Teste Automação iiiiiiiiiiiiii|teste           |Informe a Hora virada      |

    @verifyValuesShift
    Scenario: verifyValuesShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Obter os valores dos campos Descrição, Hora virada e Faixa horária.
        Then Os valores dos campos devem ser "<value_output>"

            Examples:
            |value_output                  |
            |Teste Automação iiiiiiiiiiiiii|
            |10:00                         |
            |Faixa 1 (08:00 - 17:30)       |

    @editShift
    Scenario: editShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Alterar o campo Descrição para 'Turno alterado pela automação'.
        Given Alterar o campo Hora virada para '11:59'.
        Given Desassociar a faixa horária 1.
        Given Associar a faixa horária 999999.
        When Clicar no botão Salvar.
        Then O turno deve ser salvo com sucesso com as informações atualizadas.

    @verifyValuesShiftAfterEdit
    Scenario: verifyValuesShiftAfterEdit
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Obter os valores dos campos Descrição, Hora virada e Faixa horária.
        Then Os valores dos campos devem ser "<value_output>"

            Examples:
            |value_output                 |
            |Turno alterado pela automação|
            |11:59                        |
            |Faixa 999999 (10:10 - 10:11) |