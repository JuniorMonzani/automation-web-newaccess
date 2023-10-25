@editRegisterDocType
Feature: Edit Register Document Type
    Como um usuário do sistema que tenha permissão para Alterar o tipo de documento.

    Background:
        Given Que o usuário esteja na página que lista os tipos de documento.

    @verifyResourcesPageListDocType
    Scenario: verifyResourcesPageListDocType
        Then Comparar os resources apresentados com os esperados na página de listagem tipos de documento.

    @verifyValuesComboBoxValidacaoDocType
    Scenario Outline: verifyValuesComboBoxValidacaoDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar do tipo de documento 'DocTypeAutomacao'
        When Obter os valores do combobox Validação
        Then Comparar com os valores esperados do campo: "<validacao_output>"
            Examples:
            | validacao_output |
            | Nenhuma          |
            | Cpf              |
            | Pis              |

    @verifyValuesDocTypeFields
    Scenario: verifyValuesDocTypeFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar do tipo de documento: 'DocTypeAutomacao'
        When Obter os valores dos campos Sigla, Descrição, Validação e Tamanho .
        Then Devem ser exatamente os valores que foram cadastrados 'Auto', 'DocTypeAutomacao', 'Nenhuma' e '11'.

    @editDocTypeFields
    Scenario: editDocTypeFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar do tipo de documento: 'DocTypeAutomacao'
        Given Inserir no campo Descrição e Validação os valores 'DocTypeAutomacaoiiiiiiiiiiiiiiiiiii' e 'Cpf'
        When Clicar no botão Salvar.
        Then O Tipo de documento deve ser alterado com sucesso: 'Tipo de Documento alterada com sucesso'

    @verifyLenghtFieldDocTypeDescricao
    Scenario: verifyLenghtFieldDocTypeDescricao
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar do tipo de documento: 'DocTypeAutomacaoiiiiiiiiiiiiiiiiiii'
        When Obter o tamanho do campo Descrição.
        Then O tamanho obtido do campo Descrição deve ser '30'.

    @verifyValuesAfterEditDocType
    Scenario: verifyValuesAfterEditDocType
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Clico no botão alterar do tipo de documento: 'DocTypeAutomacaoiiiiiiiiiiiiiiiiiii'
        When Obter os valores dos campos 'Descrição' e 'Validação'.
        Then Devem ser exatamente os valores que foram alterados 'DocTypeAutomacaoiiiiiiiiiiiiii' e 'Cpf'