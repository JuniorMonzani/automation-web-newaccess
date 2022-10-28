@registerWorkingTime
Feature: Register Working Time
    Como um usuário do sistema que tenha permissão para Cadastrar Jornada.

    Background:
        Given Que o usuário esteja na página de cadastro de Jornada.

    @verifyResourcesWorkingTime
    Scenario Outline: verifyResourcesWorkingTime
        Then Comparar os resources apresentados com os esperados na página de cadastro de Jornada.

    @verifyRequiredFields
    Scenario Outline: verifyRequiredFields
        Given Preencher o campo Número com valor "<numero_input>".
        Given Preencher o campo Descrição com valor "<descricao_input>".
        Given Preebcher o campo Hora virada com valor "<horavirada_input>".
        When Clicar no botão Salvar.
        Then Deve existir validação de obrigatoriedade informando o motivo: "<mensagem_output>".

            Examples:
            |numero_input|descricao_input|horavirada_input|mensagem_output            |
            |            |Teste Automação|1000            |Informe o Número           |
            |9998        |               |1000            |Informe a Descrição        |
            |9998        |Teste Automação|                |Informe a Hora virada      |
            |9998        |Teste Automação|2400            |A hora digitada é inválida!|
            |9998        |Teste Automação|3333            |Informe a Hora virada      |
            |9998        |Teste Automação|teste           |Informe a Hora virada      |