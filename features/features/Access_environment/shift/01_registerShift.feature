# @registerShift
# Feature: Register Shift
#     Como um usuário do sistema que tenha permissão para Cadastrar Turno.

#     Background:
#         Given Que o usuário esteja na página de cadastro de Turno.

#     @verifyResourcesShift
#     Scenario Outline: verifyResourcesShift
#         Then Comparar os resources apresentados com os esperados na página de cadastro de Turno.

#     @verifyRequiredFields
#     Scenario Outline: verifyRequiredFields
#         Given Preencher o campo Número com valor "<numero_input>".
#         Given Preencher o campo Descrição com valor "<descricao_input>".
#         Given Preebcher o campo Hora virada com valor "<horavirada_input>".
#         When Clicar no botão Salvar.
#         Then Deve existir validação de obrigatoriedade informando o motivo: "<mensagem_output>".

#             Examples:
#             |numero_input|descricao_input|horavirada_input|mensagem_output            |
#             |            |Teste Automação|1000            |Informe o Número           |
#             |9998        |               |1000            |Informe a Descrição        |
#             |9998        |Teste Automação|                |Informe a Hora virada      |
#             |9998        |Teste Automação|2400            |A hora digitada é inválida!|
#             |9998        |Teste Automação|3333            |Informe a Hora virada      |
#             |9998        |Teste Automação|teste           |Informe a Hora virada      |
 
#     @verifyMessageSaveWithoutTimeSlot
#     Scenario: verifyMessageSaveWithoutTimeSlot
#         Given Preencher o campo Número com valor 9998.
#         Given Preencher o campo Descrição com valor 'Teste Automação'.
#         Given Preencher o campo Hora virada com valor 1000.
#         When Clicar no botão Salvar.
#         Then Deve ser apresentada uma mensagem ao usuário: '- Ao menos uma Faixa Horária deve ser selecionada'

#     @verifyMessageSaveSameNumberShift
#     Scenario Outline: verifyMessageSaveSameNumberShift
#         Given Preencher o campo Número com valor "<numero_input>".
#         Given Preencher o campo Descrição com valor "<descricao_input>".
#         Given Preebcher o campo Hora virada com valor "<horavirada_input>".
#         Given Associar a faixa horária 1.
#         When Clicar no botão Salvar.
#         Then O turno não deve ser salvo apresentando as seguintes validações: "<mensagem_output>".

#             Examples:
#             |numero_input|descricao_input|horavirada_input|mensagem_output                                           |
#             |1           |Teste Automação|1000            |- O Turno de número 1 já existe no sistema                |
#             |9998        |Turno Integral |1000            |- O Turno de descrição Turno Integral já existe no sistema|

#     @verifyMessageIntersectionBetweenTimesShift
#     Scenario: verifyMessageIntersectionBetweenTimesShift
#         Given Associar uma faixa horária 1.
#         When Tentar associar faixa horária 999999.
#         Then Deveser apresentada uma mensagem ao usuário: '- Interseção entre horários: Faixa 999999 10:10 - 10:11 e Faixa 1 08:00 - 17:30'

#     @saveShift
#     Scenario: saveShift
#         Given Preencher o campo Número com valor 1234567.
#         Given Preencher o campo Descrição com valor 'Teste Automação iiiiiiiiiiiiiiiiiiiii'.
#         Given Preencher o campo Hora virada com valor 1000.
#         Given Associar a faixa horária 1.
#         When Clicar no botão Salvar.
#         Then O turno deve ser salvo com sucesso.