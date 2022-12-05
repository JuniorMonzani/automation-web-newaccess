# @editTimeSlot
# Feature: edit Time Slot
#     Como um usuário do sistema que tenha permissão para Alterar Faixa Horária.

#     Background:
#         Given Que o usuário esteja na página que lista as Faixas Horárias objetivando alteração.

#     @verifyEditTimeSlot
#     Scenario: verifyEditTimeSlot
#         Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_01 objetivando alteração.
#         When Eu clico no ícone de alteração da Faixa Horária_01 objetivando alteração.
#         Then Devo ver a mensagem: 'Alterar Faixa Horária'.

#     @verifyFieldNumberOfTimeSlotDisabled
#     Scenario: verifyFieldNumberOfTimeSlotDisabled
#         Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_02 objetivando alteração.
#         When Eu clico no ícone de alteração da Faixa Horária_02 objetivando alteração.
#         Then Devo ver o campo número como: 'disabled'

#     @verifyNumberTimeSlot
#     Scenario: verifyNumberTimeSlot
#         Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_03 objetivando alteração.
#         When Eu clico no ícone de alteração da Faixa Horária_03 objetivando alteração.
#         Then O número deve ser exatamente o número cadastrado para a Faixa Horária.

#     @verifyHoursTimeSlot
#     Scenario: verifyHoursTimeSlot
#         Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_04 objetivando alteração.
#         When Eu clico no ícone de alteração da Faixa Horária_04 objetivando alteração.
#         Then A "Hora inicial" e "Hora final" devem ser exatamente as mesmas cadastrado para a Faixa Horária.

#     @verifyHoursTimeSlot
#     Scenario: verifyHoursTimeSlot
#         Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_05 objetivando alteração.
#         When Eu clico no ícone de alteração da Faixa Horária_05 objetivando alteração.
#         And Alterar a "Hora inicial" e "Hora final".
#         And Clicar no botão Salvar para salvar as alterações na Faixa horária.
#         Then A Faixa horária deve ser salva com sucesso na edição.