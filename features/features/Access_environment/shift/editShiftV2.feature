@editShift
Feature: Edit Shift
    Como um usuário do sistema que tenha permissão para Editar Turno.

    Background:
        Given Que o usuário esteja na página que lista os turnos cadastrados.

    @verifyResourcesPageListShift
    Scenario: verifyResourcesPageListShift
        Then Comparar os resources apresentados com os esperados na página de listagem de Turnos.

    @verifyValuesComboBoxSearch
    Scenario: verifyValuesComboBoxSearch
        Given Que desmarque o checkbox 10 últimas atualizações.
        When Obter os valores do combobox de pesquisa da tela de listagem de Turnos.
        Then Comparar com os valores esperados: 'Número', 'Descrição' e 'Nº da faixa horária'

    @searchNoResultsShift
    Scenario Outline: searchNoResultsShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Selecionar o "<valorCombo_input>" e "<valorBusca_input>".
        When Clicar em Buscar.
        Then Validar a informação apresentada ao usuário: "<mensagem_output>".

              Examples:
            |valorCombo_input   |valorBusca_input|mensagem_output                |
            |Número             |9876            |Nenhum resultado foi encontrado|
            |Descrição          |9876            |Nenhum resultado foi encontrado|
            |Nº da faixa horária|9876            |Nenhum resultado foi encontrado|

    @searchCorrectShift
    Scenario Outline: searchCorrectShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Selecionar o "<valorCombo_input>" e "<valorBusca_input>".
        When Clicar em Buscar.
        Then Valida se o Turno foi encontrado.

            Examples:
            |valorCombo_input   |valorBusca_input              |
            |Número             |123456                        |
            |Descrição          |Teste Automação iiiiiiiiiiiiii|
            |Nº da faixa horária|1                             |  

    @disassociateTimeSlotVerifyRequire
    Scenario: disassociateTimeSlotVerifyRequire
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Desassociar a faixa horária 1.
        When Clicar em Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- Ao menos uma Faixa Horária deve ser selecionada'

    @clearFieldsVerifyRequiredDescription
    Scenario: clearFieldsVerifyRequiredDescription
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Preencher os campos Descrição '' e Hora virada '1200'.
        When Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade do campo descrição: 'Informe a Descrição'

    @clearFieldsVerifyRequiredNull
    Scenario: clearFieldsVerifyRequiredNull
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Preencher os campos Descrição 'Teste Automação iiiiiiiiiiiiii' e Hora virada ''.
        When Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade do campo hora virada: 'Informe a Hora virada'

    @clearFieldsVerifyRequiredInvalid
    Scenario: clearFieldsVerifyRequiredInvalid
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Preencher os campos Descrição 'Teste Automação iiiiiiiiiiiiii' e Hora virada '2400'.
        When Clicar no botão Salvar.
        Then Deve existir validação do valor inserido no campo hora virada: 'A hora digitada é inválida!'
    
    @clearFieldsVerifyRequiredWrong
    Scenario: clearFieldsVerifyRequiredWrong
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Devo apagar o campo Hora virada
        Given Preencher os campos Descrição 'Teste Automação iiiiiiiiiiiiii' e Hora virada '3333'.
        When Clicar no botão Salvar.
        Then Deve existir validação do valor do campo hora virada: 'Informe a Hora virada'


    @clearFieldsVerifyRequiredString
    Scenario: clearFieldsVerifyRequiredString
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Devo apagar o campo Hora virada
        Given Preencher os campos Descrição 'Teste Automação iiiiiiiiiiiiii' e Hora virada 'teste'.
        When Clicar no botão Salvar.
        Then Deve validar se o campo hora virada não foi preenchido com string: 'Informe a Hora virada' 

            
    @verifyValuesShift
    Scenario: verifyValuesShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Obter os valores dos campos Descrição, Hora virada e Faixa horária.
        Then Os valores dos campos devem ser:  'Teste Automação iiiiiiiiiiiiii' e '10:00' e 'Faixa 1 (08:00 - 17:30)'

    @editingShift
    Scenario: editingShift
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        Given Alterar o campo Descrição para 'Turno alterado pela automação'.
        Given Alterar o campo Hora virada para '11:59'.
        Given Desassociar a faixa 1.
        Given Associar a faixa '999999'.
        When Clicar no botão Salvar.
        Then O turno deve ser salvo com sucesso com as informações atualizadas.

    @verifyValuesShiftAfterEdit
    Scenario: verifyValuesShiftAfterEdit
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Procure e encontre o turno cadastrado pela automação.
        Given Clicar para editar o turno.
        When Obter os valores dos campos Descrição, Hora virada e Faixa horária.
        Then Os valores dos campos devem ser: 'Turno alterado pela automação' e '11:59' e 'Faixa 999999 (10:10 - 10:11)'