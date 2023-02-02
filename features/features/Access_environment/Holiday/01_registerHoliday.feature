@registerHoliday
Feature: Register Holiday
    Como um usuário do sistema que tenha permissão para Cadastrar Feriado.

    Background:
        Given Que o usuário esteja na página de cadastro de Feriado.

    @verifyResourcesHoliday
    Scenario Outline: verifyResourcesHoliday
        Then Comparar os resources apresentados com os esperados na página de cadastro de Feriado.

    
    @verifyRequiredFieldsHolidayDescription
    Scenario: verifyRequiredFieldsHolidayDescription
        Given Preencher o campo Descrição e Data da tela Feriado com valor '' e '0101'.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Descrição: 'Informe a Descrição'.
    
    
    @verifyRequiredFieldsHolidayWithoutData
    Scenario: verifyRequiredFieldsHolidayDescription
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Teste Automação' e ''.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Data: 'Informe a Data'.

        @verifyRequiredFieldsHolidayWrongData
    Scenario: verifyRequiredFieldsHolidayDescription
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Teste Automação' e '9999'.
        When Clicar no botão Salvar.
        Then Deve existir validação do valor inserido no campo Data: 'Data inválida'.

        @verifyRequiredFieldsHolidayStringData
    Scenario: verifyRequiredFieldsHolidayDescription
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Teste Automação' e 'teste'.
        When Clicar no botão Salvar.
        Then Deve existir validação do preenchimento do campo data: 'Informe a Data'.

    @verifyMessageSaveWithoutEquipmentGroup
    Scenario: verifyMessageSaveWithoutEquipmentGroup
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Teste Automação' e '0101'.
        When Clicar no botão Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- O feriado tem que ser associado a pelo menos um grupo de equipamentos'

    @verifyMessageSaveSameDescription
    Scenario: verifyMessageSaveSameDescription
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Feriado - Independência' e '0709'.
        Given Associar o grupo 1.
        When Clicar no botão Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- O Feriado de descrição Feriado - Independência já existe no sistema'

    @saveHoliday
    Scenario: saveHoliday
        Given Preencher o campo Descrição e Data da tela Feriado com valor 'Teste Automação iiiiiiiiiiiiii' e '0709'.
        Given Associar o grupo 1.
        When Clicar no botão Salvar.
        Then Deve apresentar a mensagem: 'Feriado salvo com sucesso!'.