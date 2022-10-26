@registerHoliday
Feature: Register Holiday
    Como um usuário do sistema que tenha permissão para Cadastrar Feriado.

    Background:
        Given Que o usuário esteja na página de cadastro de Feriado.

    @verifyResourcesHoliday
    Scenario Outline: verifyResourcesHoliday
        Then Comparar os resources apresentados com os esperados na página de cadastro de Feriado.

    @verifyRequiredFieldsHoliday
    Scenario Outline: verifyRequiredFieldsHoliday
        Given Preencher o campo Descrição com valor "<descricao_input>".
        Given Preebcher o campo Data com valor "<data_input>".
        When Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade informando o motivo: "<mensagem_output>".

            Examples:
            |descricao_input|data_input|mensagem_output    |
            |               |0101      |Informe a Descrição|
            |Teste Automação|          |Informe a Data     |
            |Teste Automação|9999      |Data inválida      |
            |Teste Automação|teste     |Informe a Data     |

    @verifyMessageSaveWithoutEquipmentGroup
    Scenario: verifyMessageSaveWithoutEquipmentGroup
        Given Preencher o campo Descrição com valor 'Teste Automação'.
        Given Preencher o campo Data com valor 0101.
        When Clicar no botão Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- O feriado tem que ser associado a pelo menos um grupo de equipamentos'

    @verifyMessageSaveSameDescription
    Scenario: verifyMessageSaveSameDescription
        Given Preencher o campo Descrição com valor 'Feriado - Independência'.
        Given Preencher o campo Data com valor 0709.
        Given Associar o grupo 1.
        When Clicar no botão Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- O Feriado de descrição Feriado - Independência já existe no sistema'

    @saveHoliday
    Scenario: saveHoliday
        Given Preencher o campo Descrição com valor 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
        Given Preencher o campo Data com valor 0709.
        Given Associar o grupo 1.
        When Clicar no botão Salvar.
        Then O feriado deve ser salvo com sucesso.