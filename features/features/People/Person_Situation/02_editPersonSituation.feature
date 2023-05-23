@editPersonSituation
Feature: Edit Person Situation
    Como um usuário do sistema que tenha permissão para Alterar a Situação de Pessoa.

    Background:
        Given Que o usuário esteja na página que lista as Situações de Pessoas.

    @verifyResourcesPageListPersonSituation
    Scenario Outline: verifyResourcesPageListPersonSituation
        Then Comparar os resources apresentados com os esperados na página de listagem de Situação de Pessoas.

    @verifyValuesComboBoxTypePersonSituation
    Scenario Outline: verifyValuesComboBoxTypePersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Situação: 'Aut.Permitido'
        When Obter os valores do combobox Tipo da tela de alteração da Situação de Pessoas
        Then Comparar com os valores esperados do campo tipo: "<tipos_output>"

            Examples:
            | tipos_output                 |
            | Acesso permitido             |
            | Acesso bloqueado             |
            | Múltipla                     |
            | Acesso bloqueado por período |
            | Acesso liberado por período  |
    
    @verifyValuesPersonSituationFields
    Scenario: verifyValuesPersonSituationFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Situação: 'Aut.Permitido'
        When Obter os valores dos campos Descrição e Tipo .
        Then Devem ser exatamente os valores que foram cadastrados 'Aut.Permitido' e 'Acesso permitido'.


    @editPersonSituationFields
    Scenario: editPersonSituationFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Situação: 'Aut.Permitido'
        Given Inserir no campo Descrição o valor 'Aut.Permitido iiiiiiiiiiiiiiiiiiiiii' e no campo Tipo o valor 'Acesso bloqueado'.
        When Clicar no botão Salvar.
        Then A Situação de Pessoa deve ser salvo com sucesso: 'Situação Pessoa alterada com sucesso!'

    @verifyLenghtFieldPersonSituationDescription
    Scenario: verifyLenghtFieldPersonSituationDescription
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Situação: 'Aut.Permitido iiiiiiiiiiiiiiiiiiiiii'
        When Obter o tamanho do campo Descrição.
        Then O tamanho obtido do campo Descrição deve ser '20'.

    @verifyValuesAfterEditPersonSituation
    Scenario: verifyValuesAfterEditPersonSituation
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar da Situação: 'Aut.Permitido iiiiiiiiiiiiiiiiiiiiii'
        When Obter os valores dos campos 'Descrição' e 'Tipo'.
        Then Devem ser exatamente os valores que foram alterados 'Aut.Permitido iiiiii' e 'Acesso bloqueado'