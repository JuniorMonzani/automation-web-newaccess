# @registerTimeSlot
# Feature: Register Time Slot
#     Como um usuário do sistema que tenha permissão para Cadastrar Faixa Horária.

#     Background:
#         Given Que o usuário esteja na página de cadastro de Faixa Horária.

#     @verifyLabelsTimeSlot
#     Scenario: verifyLabelsTimeSlot
#         Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de faixa horária.

#     @fieldNumberRequiredTimeSlot
#     Scenario: fieldNumberRequiredTimeSlot
#         Given Informar caractere alfanumérico no campo "Número" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
#         When Clicar no botão Salvar para validar o campo "Número" da tela Faixa Horária.
#         Then Deve existir uma validação no campo "Número" da tela Faixa Horária pois o mesmo é obrigatório e só aceita caracteres numéricos.

#     @fieldTimeSlotThenZero
#     Scenario: fieldTimeSlotThenZero
#         Given Informar valor zero no campo "Número" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
#         When Clicar no botão Salvar para validar o campo "Número" da tela Faixa Horária com o valor zero.
#         Then Deve existir uma validação no campo "Número" da tela Faixa Horária pois no mesmo é obrigatório um valor acima de zero.

#     @fieldStartDateRequiredTimeSlot
#     Scenario: fieldStartDateRequiredTimeSlot
#         Given Informar caractere alfanumérico no campo "Hora inicial" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
#         When Clicar no botão Salvar para validar o campo "Hora inicial" da tela Faixa Horária.
#         Then Deve existir uma validação no campo "Hora inicial" da tela Faixa Horária pois o mesmo é obrigatório e só aceita caracteres numéricos.

#     @fieldEndDateRequiredTimeSlot
#     Scenario: fieldEndDateRequiredTimeSlot
#         Given Informar caractere alfanumérico no campo "Hora final" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
#         When Clicar no botão Salvar para validar o campo "Hora final" da tela Faixa Horária.
#         Then Deve existir uma validação no campo "Hora final" da tela Faixa Horária pois o mesmo é obrigatório e só aceita caracteres numéricos.

#     @fieldsEqualDatesRequiredTimeSlot
#     Scenario: fieldsEqualDatesRequiredTimeSlot
#         Given Informar valores iguais nos campos "Hora inicial" e "Hora final" da tela Faixa Horária e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
#         When Clicar no botão Salvar para validar os campos "Hora inicial" e "Hora final" da tela Faixa Horária com valores iguais.
#         Then Deve existir uma validação nos campos "Hora inicial" e "Hora final" da tela Faixa Horária pois ambos não podem conter o mesmo valor.

#     @timeSlotAlreadyExsists
#     Scenario: timeSlotAlreadyExsists
#         Given Preencher o campo Número com o valor "1".
#         And Preencher os campos "Hora inicial" e "Hora final" corretamente para efetuar o cadastro.
#         When Clicar no botão Salvar para salvar a faixa horária.
#         Then Deve existir uma validação no campo "Número" informando que a faixa já existe.
        
#     @verifyMessagetimeSlotAlreadyExsists
#     Scenario: verifyMessagetimeSlotAlreadyExsists
#         Given Preencher o campo Número com o valor "1".
#         And Preencher os campos "Hora inicial" e "Hora final" corretamente para efetuar o cadastro.
#         When Clicar no botão Salvar para salvar a faixa horária.
#         Then Validar a mensagem apresentada ao usuário informando que a faixa já existe.

#     @registerTimeSlotSuccess
#     Scenario: registerTimeSlotSuccess
#         Given Preencher o campo Número com o valor "999999".
#         And Preencher os campos "Hora inicial" e "Hora final" corretamente para efetuar o cadastro.
#         When Clicar no botão Salvar para salvar a faixa horária.
#         Then A faixa horária deve ser salva com sucesso no cadastro.