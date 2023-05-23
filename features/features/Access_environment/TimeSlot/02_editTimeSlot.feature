@editTimeSlot
Feature: edit Time Slot
    Como um usuário do sistema que tenha permissão para Alterar Faixa Horária.

    Background:
        Given Que o usuário esteja na página de faixa horária
        #Os demais Given abaixo, foram comentados pois já está implementado aqui no background


    @verifySearchField
    Scenario: verifySearchField
        # Given Que o usuário esteja na página de faixa horária
        When Ao clicar checkbox 'As 10 últimas atualizações'
        Then O campo busca deve ficar habilitado

    @verifySearchAlfanumeric
    Scenario: verifySearchAlfanumeric
        # Given Que o usuário esteja na página de faixa horária
        When Ao clicar checkbox 'As 10 últimas atualizações'
        And Faço a pesquisa inserindo as letras 'abc'
        Then Devo retornar para a página de cadastro

    @verifySearchInvalidNumber
    Scenario: verifySearchNumeri
        # Given Que o usuário esteja na página de faixa horária
        When Ao clicar checkbox 'As 10 últimas atualizações'
        And Faço a pesquisa por um número não cadastrado: '2'
        Then Devo ver a mensagem: 'Nenhum resultado foi encontrado'

    @verifySearchNumber
    Scenario: verifySearchNumber
        # Given Que o usuário esteja na página de faixa horária
        When Ao clicar checkbox 'As 10 últimas atualizações'
        And Faço a pesquisa pelo número '888888'
        Then Devo ver como resultado da pesquisa o cadastro do número: '888888'


    @verifyEditTimeSlot
    Scenario: verifyEditTimeSlot
        # Given Que o usuário esteja na página de faixa horária 
        And faça a busca
        When Eu clico no ícone de alteração da Faixa Horária.
        Then Devo ver a mensagem: 'Alterar Faixa Horária'.

    @verifyFieldNumberOfTimeSlotDisabled
    Scenario: verifyFieldNumberOfTimeSlotDisabled
        #Given Que o usuário esteja na página de faixa horária 
        And faça a busca
        When Eu clico no ícone de alteração da Faixa Horária.
        Then Devo ver o campo número como: 'disabled'

    @verifyNumberTimeSlot
    Scenario: verifyNumberTimeSlot
        #Given Que o usuário esteja na página de faixa horária 
        And faça a busca
        When Eu clico no ícone de alteração da Faixa Horária.
        Then O número deve ser exatamente o número cadastrado para a Faixa Horária: '888888'.

    @verifyHoursTimeSlot
    Scenario: verifyHoursTimeSlot
        #Given Que o usuário esteja na página de faixa horária 
        And faça a busca
        When Eu clico no ícone de alteração da Faixa Horária.
        Then A Hora inicial e Hora final devem ser exatamente as mesmas cadastrado para a Faixa Horária: '10:00', '11:00'

    @verifyEditHoursTimeSlot
    Scenario: verifyEditHoursTimeSlot
        #Given Que o usuário esteja na página de faixa horária 
        And faça a busca
        When Eu clico no ícone de alteração da Faixa Horária.
        And Alterar a Hora inicial e Hora final com "10:20" e "11:20"
        And Clicar no botão Salvar para salvar as alterações na Faixa horária.
        Then A seguinte mensagem será exibida: 'Faixa Horária alterada com sucesso!'.