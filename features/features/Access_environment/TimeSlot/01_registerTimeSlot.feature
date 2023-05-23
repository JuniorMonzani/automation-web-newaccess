@registerTimeSlot
Feature: Register Time Slot
    Como um usuário do sistema que tenha permissão para Cadastrar Faixa Horária.

    Background:
        Given Que o usuário esteja na página de cadastro de Faixa Horária.

    @verifyLabelsTimeSlot
    Scenario: verifyLabelsTimeSlot
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de faixa horária.


    @fieldNumberRequiredTimeSlot
    Scenario: fieldNumberRequiredTimeSlot
        Given Informar caractere alfanumérico no campo "Número" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número" da tela Faixa Horária.
        Then Deve existir uma validação no campo "Número" da tela Faixa Horária pois o mesmo é obrigatório e só aceita caracteres numéricos.


    @OutlineRegister
    #esquema do cenário em PT-BR
    Scenario Outline: Tentar Cadastrar

        #Given Que o usuário esteja na página de cadastro de Faixa Horária.
        #Given foi removido porque já consta no background
        When Informo os dados de cadastro com "<numero_input>" e "<faixaIni_input>" e "<faixaFim_input>"
        Then vejo a mensagem de alerta: "<mensagem_output>"
            #Exemplos em PT-BR
            Examples:
            | numero_input | faixaIni_input | faixaFim_input | mensagem_output                                    |
            | 0            | 11:00          | 12:00          | - O campo Número não pode ser igual a zero         |
            | 1            | ABC            | 12:00          | - Hora Inicial inválida!                           |
            | 1            | 11:00          | ABC            | - Hora Final inválida!                             |
            | 5            | 11:00          | 11:00          | - A hora final não pode ser igual a hora inicial   |
            | 1            | 11:00          | 12:00          | - A faixa horária de número 1 já existe no sistema |

    @registerTimeSlotSuccess
    Scenario: registerTimeSlotSuccess
        Given Preencher o campo Número com o valor "888888".
        And Preencher os campos Hora inicial e Hora final com "10:00" e "11:00"
        When Clicar no botão Salvar para salvar a faixa horária.
        Then Deve ver a mensagem: 'Faixa Horária salva com sucesso!'.



