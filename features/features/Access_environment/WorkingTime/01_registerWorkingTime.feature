@registerWorkingTime
Feature: Register Working Time
    Como um usuário do sistema que tenha permissão para Cadastrar Jornada.

    Background:
        Given Que o usuário esteja na página de cadastro de Jornada.

    @verifyResourcesWorkingTime
    Scenario Outline: verifyResourcesWorkingTime
        Then Comparar os resources apresentados com os esperados na página de cadastro de Jornada.

    @verifyRequiredFieldWorkingTimeDescription
        Scenario: verifyRequiredFieldWorkingTimeDescription
        Given Preencher o campo Descrição da tela de Jornada com ''.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Descrição: 'Informe a Descrição'.

    @verifyWorkingTimeTypeSemanal
        Scenario: verifyWorkingTimeTypeSemanal
        Given Que esteja na tela de cadastro de Jornada
        When Selecionar o tipo como 'Semanal'
        Then Deve exibir os dias da semana para preencher os turnos
    
    @verifyWorkingTimeTypeMensal
        Scenario: verifyWorkingTimeTypeMensal
        Given Que esteja na tela de cadastro de Jornada
        When Selecionar o tipo como 'Mensal'
        Then Deve exibir os dias do mês para preencher os turnos

    @verifyWorkingTimeTypePeriodo
        Scenario: verifyWorkingTimeTypePeriodo
        Given Que esteja na tela de cadastro de Jornada
        When Selecionar o tipo como 'Periódica'
        Then Deve exibir os campos 'Período' e 'Data inicial'    


    @verifyRequiredFieldWorkingTimeShift
        Scenario: verifyRequiredFieldWorkingTimeShift
        Given Preencher os campos Descrição e Tipo da tela de Jornada com 'Teste' e 'Semanal'
        When Clicar no botão Salvar.
        Then Deve exibir a mensagem: '- Pelo menos um Turno deve ser preenchido'

    @verifyFieldAutoCompletarSemanalFunction
        Scenario: verifyFieldAutoCompletarSemanalFunction
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Semanal' selecionado
        When Clicar em 'Auto Completar' na tela de Jornada
        Then Deve exibir a tela com os campos para preenchimento: 'Fim de Semana: Turno' e 'Dias Úteis: Turno'

    @verifyFieldAutoCompletarMensalFunction
        Scenario: verifyFieldAutoCompletarMensalFunction
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Mensal' selecionado
        When Clicar em 'Auto Completar' na tela de Jornada
        Then Deve exibir a tela mensal com os campos para preenchimento: 'Dias' e 'Turno'

    @verifyFieldAutoCompletarPeriodicaFunction
        Scenario: verifyFieldAutoCompletarPeriodicaFunction
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Periódica' selecionado
        When Preencher o campo Período com '2'
        Then Deve exibir a tela com os campos para preenchimento: 'Período' e 'Data inicial'


    @verifyFieldsAutoCompletarFimSemana
        Scenario: verifyFieldsAutoCompletarFimSemana
        Given Que esteja na tela de cadastro de Jornada
        Given Clicar em 'Auto Completar' na tela de Jornada
        When Clicar na lupa Fim de Semana
        Then Deve ver os campos 'Adicionar' e 'Número' e 'Descrição'

    @verifyFieldsAutoCompletarDiasUteis
        Scenario: verifyFieldsAutoCompletarDiasUteis
        Given Que esteja na tela de cadastro de Jornada
        Given Clicar em 'Auto Completar' na tela de Jornada
        When Clicar na lupa Dias Úteis
        Then Deve ver os campos 'Adicionar' e 'Número' e 'Descrição' 
    
    
     @verifyDaysLimitTypePeriodica
        Scenario: verifyDaysLimitTypePeriodica
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Periódica' selecionado
        When Preencher o campo Período com '367'
        And Clicar no campo Data inicial
        Then Deve ver a mensagem: 'A quantidade de dias da jornada não pode ser maior que 366'        

    @verifyDaysTypePeriodica
        Scenario: verifyDaysTypePeriodica
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Periódica' selecionado
        When Preencher o campo Período com '366'
        And Clicar no campo Data inicial
        Then Deve ver a quantidade de dias '366' criados
    
    
    @verifyWorkingTimeAlreadyRegistered
        Scenario: verifyWorkingTimeAlreadyRegistered
        Given Preencher o campo Descrição da tela de Jornada com 'Jornada Integral Semanal'.
        When Preencher o campo Segunda-Feira com '1'.
        And Clicar em 'Salvar'
        Then Deve exibir a mensagem: '- A Jornada de descrição Jornada Integral Semanal já existe no sistema'

    @saveWorkingTimeSemanal
        Scenario: saveWorkingTimeSemanal
        Given Que esteja na tela de cadastro de Jornada
        Given Preencher o campo Descrição com 'TesteAutomaçãoSemanal'
        When Preencher o campo Segunda-Feira com '1'.
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'

    @saveWorkingTimeMensal
    Scenario: saveWorkingTimeMensal
        Given Que esteja na tela de cadastro de Jornada
        Given Preencher os campos Descrição e Tipo com 'TesteAutomaçãoMensal' e 'Mensal'
        When Preencher o campo do dia primeiro com '1' no cadastro Mensal
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'

    @saveWorkingTimePeriodica
    Scenario: saveWorkingTimePeriodica
        Given Preencher os campos Descrição e Tipo com 'TesteAutomaçãoPeriodica' e 'Periódica'
        Given Preencher os campos Dias e Data Inicial com '1' e '28/04/2023'
        When Preencher o campo do dia primeiro com '1' no cadastro Períodica
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'
        


# Os cenários abaixo foram inseridos depois, usados para validar os campos de lupa
    @saveWorkingTimeAutoCompletarFimSemana
        Scenario: saveWorkingTimeAutoCompletarFimSemana
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Semanal' selecionado
        Given Preencher a Descrição com 'AutomaçãoFimSemana'
        Given Clicar em 'Auto Completar' na tela de Jornada
        When Clicar na lupa Fim de Semana
        And Selecionar o checkbox da opção 'Turno Integral'
        And Clicar em 'Ok' na tela de seleção de turno
        And Clicar em 'Ok' na tela de Auto Completar
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'

    @saveWorkingTimeAutoCompletarDiasUteis
        Scenario: saveWorkingTimeAutoCompletarDiasUteis
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Semanal' selecionado
        Given Preencher a Descrição com 'AutomaçãoDiasUteis'
        Given Clicar em 'Auto Completar' na tela de Jornada
        When Clicar na lupa Dias Uteis
        And Selecionar o checkbox da opção 'Turno Integral'
        And Clicar em 'Ok' na tela de seleção de turno
        And Clicar em 'Ok' na tela de Auto Completar
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'

    @saveWorkingTimeAutoCompletarMensalUmDia
        Scenario: saveWorkingTimeAutoCompletarMensalUmDia
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Mensal' selecionado
        Given Preencher a Descrição com 'AutomaçãoMesUmDia'
        When Clicar em 'Auto Completar' na tela de Jornada
        And Preencher o campo Dias com '1' e '1'
        And Clicar na lupa
        And Selecionar o checkbox da opção 'Turno Integral'
        And Clicar em 'Ok' na tela de seleção de turno
        And Clicar em 'Ok' na tela de Auto Completar
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'

    @verifyFilledFieldsAutoCompletarMensalTodosDias
        Scenario: verifyFilledFieldsAutoCompletarMensalTodosDias
        Given Que esteja na tela de cadastro de Jornada com o Tipo 'Mensal' selecionado
        Given Preencher a Descrição com 'AutomaçãoMesCompleto'
        When Clicar em 'Auto Completar' na tela de Jornada
        And Preencher o campo Dias com '1' e '31'
        And Clicar na lupa
        And Selecionar o checkbox da opção 'Turno Integral'
        And Clicar em 'Ok' na tela de seleção de turno
        And Clicar em 'Ok' na tela de Auto Completar
        And Clicar em 'Salvar'
        Then Deve ver a mensagem ao cadastrar corretamente: 'Jornada salva com sucesso'


