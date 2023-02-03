@registerPersonSituation
Feature: Register Person Situation
    Como um usuário do sistema que tenha permissão para Cadastrar Situação de Pessoa.

    Background:
        Given Que o usuário esteja na página de cadastro de Situação de Pessoa.

    @verifyResourcesPersonSituation
    Scenario: verifyResourcesPersonSituation
        Then Comparar os resources apresentados com os esperados na página de cadastro de Situação de Pessoa.

    @verifyRequiredFieldsPersonSituationDescription
    Scenario: verifyRequiredFieldsPersonSituationDescription
        Given Preencher o campo Descrição da tela Situação de Pessoa com valor ''.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Descrição: 'Informe a Descrição'.



    @verifyMessageSaveSamePersonSituationDescription
    Scenario: verifyMessageSaveSamePersonSituationDescription
        Given Preencher o campo Descrição da tela Situação de Pessoa com valor 'Teste Automação'.
        When Clicar no botão Salvar.
        Then Deve ser apresentada uma mensagem ao usuário: '- A descrição já existe no sistema'

    @savePersonSituation
    Scenario Outline: savePersonSituation
        Given Preencher o campo Descrição e Tipo da tela Situação de Pessoa com valor "<descricao_input>" e "<tipo_input>".
        When Clicar no botão Salvar.
        Then Deve apresentar a mensagem de validação: "<mensagem_output>".

            Examples:
            | descricao_input     | tipo_input                   |mensagem_output|
            | Aut.Permitido       | Acesso permitido             |Situação Pessoa salva com sucesso!|
            | Aut.Bloqueado       | Acesso bloqueado             |Situação Pessoa salva com sucesso!|
            | Aut.Mult            | Múltipla                     |Situação Pessoa salva com sucesso!|
            | Aut.BloqPeriodo     | Acesso bloqueado por período |Situação Pessoa salva com sucesso!|
            | Aut.LiberadoPeriodo | Acesso liberado por período  |Situação Pessoa salva com sucesso!|