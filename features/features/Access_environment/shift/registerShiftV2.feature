@registerShift
Feature: Register Shift
    Como um usuário do sistema que tenha permissão para Cadastrar Turno.

    Background:
        Given Que o usuário esteja na página de cadastro de Turno.

    @verifyResourcesShift
    Scenario Outline: verifyResourcesShift
        Then Comparar os resources apresentados com os esperados na página de cadastro de Turno.

    @verifyRequiredShiftFieldNumber
    Scenario: 
        Given Que clico em 'Cadastrar'
        When Preencho os campos Número '' e Descrição 'Teste Automação' e Hora Virada '1000'
        And Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade do campo número: 'Informe o Número'

    
    @verifyRequiredShiftFieldHour
    Scenario: verifyRequiredFieldHour
        Given Que clico em 'Cadastrar'
        When Preencho os campos Número '9998' e Descrição 'Teste Automação' e Hora Virada '2400'
        And Clicar no botão Salvar.
        Then Deve informar que a hora virada é um valor inválido: 'A hora digitada é inválida!'

    
    @verifyRequiredShiftFieldWithoutHour
    Scenario: verifyRequiredFieldWithoutHour
        Given Que clico em 'Cadastrar'
        When Preencho os campos Número '9998' e Descrição 'Teste Automação' e Hora Virada ''
        And Clicar no botão Salvar.
        Then Deve informar que a hora virada não foi preenchida: 'Informe a Hora virada'

        
    @verifyRequiredShiftFieldWrongHour
    Scenario: verifyRequiredFieldNumber
        Given Que clico em 'Cadastrar'
        When Preencho os campos Número '9998' e Descrição 'Teste Automação' e Hora Virada '3333'
        And Clicar no botão Salvar.
        Then Deve solicitar o preenchimento do campo hora virada: 'Informe a Hora virada'

        
    @verifyRequiredShiftFieldStringHour
    Scenario: verifyRequiredFieldStringHour
        Given Que clico em 'Cadastrar'
        When Preencho os campos Número '9998' e Descrição 'Teste Automação' e Hora Virada 'teste'
        And Clicar no botão Salvar.
        Then Deve solicitar que o campo hora virada seja preenchido: 'Informe a Hora virada'
           
 
    @verifyMessageSaveWithoutTimeSlot
    Scenario: verifyMessageSaveWithoutTimeSlot
        Given Preencher o campo Número com valor '9998'.
        Given Preencher o campo Descrição com valor 'Teste Automação'.
        Given Preencher o campo Hora virada com valor '1000'.
        When Clicar no botão Salvar.
        Then Será apresentada uma mensagem ao usuário: '- Ao menos uma Faixa Horária deve ser selecionada'

    @verifyMessageSaveSameNumberShift
    Scenario Outline: verifyMessageSaveSameNumberShift
        When Preencho os campos "<numero_input>" e "<descricao_input>" e "<horavirada_input>"
        And Associar a faixa horária 1.
        When Clicar no botão Salvar.
        Then O turno não deve ser salvo apresentando as seguintes validações: "<mensagem_output>".

            Examples:
            |numero_input|descricao_input|horavirada_input|mensagem_output                                           |
            |1           |Teste Automação|1000            |- O Turno de número 1 já existe no sistema                |
            |9998        |Turno Integral |1000            |- O Turno de descrição Turno Integral já existe no sistema|

    @verifyMessageIntersectionBetweenTimesShift
    Scenario: verifyMessageIntersectionBetweenTimesShift
        Given Associar uma faixa horária '1'.
        When Tentar associar faixa horária '999999'.
        Then Deve ser apresentada uma mensagem ao usuário: '- Interseção entre horários:' e 'Faixa 999999 10:10 - 10:11 e Faixa 1 08:00 - 17:30'

    @saveShift
    Scenario: saveShift
        Given Preencher o campo Número com valor '1234567'.
        Given Preencher o campo Descrição com valor 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
        Given Preencher o campo Hora virada com valor '1000'.
        Given Associar a faixa horária '1'.
        When Clicar no botão Salvar.
        Then Deve exibir a mensagem 'Turno salvo com sucesso!'.