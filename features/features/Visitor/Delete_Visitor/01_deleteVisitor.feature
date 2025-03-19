@deleteVisitor
Feature: Delete Visitor
    Como um usuário do sistema que tenha permissão para Excluir Visitantes.

    Background:
        Given Que o usuário esteja na página de exclusão de visitantes

@verifySearchComboBox
    Scenario: verifySearchComboBox
    Given Obter os valores do combobox do tipo de busca
    Then Os valores devem ser 'Documento' e 'Nome'

@verifyDocNotFound
    Scenario: verifyDocNotFound
    Given Preencher o campo de busca com '999'
    When Clicar no botão Buscar na tela de Exclusão de Visitante
    Then Deve ver a mensagem 'Nenhum resultado foi encontrado'

@verifyCredAssociated
    Scenario: verifyCredAssociated
    Given Preencher o campo de busca com '20'
    Given Clicar no botão Buscar na tela de Exclusão de Visitante
    Given Selecionar o checkbox da credencial '20'
    When Clicar no botão Excluir na tela de Exclusão de Visitante
    Then Deve ver a mensagem 'Não foi possível excluir o Visitante, pois ele possui, ou já possuiu, uma credencial associada' na tela de Exclusão de Visitante

@delVisitorFirstAuto
    Scenario: delVisitorFirstAuto
    Given Preencher o campo de busca com '132'
    Given Clicar no botão Buscar na tela de Exclusão de Visitante
    Given Selecionar o checkbox da credencial '132' 
    When Clicar no botão Excluir na tela de Exclusão de Visitante
    Then Deve ver a mensagem 'Visitante excluído com sucesso' na tela de Exclusão de Visitante


@delVisitorSecondAuto
    Scenario: delVisitorSecondAuto
    Given Preencher o campo de busca com '133'
    Given Clicar no botão Buscar na tela de Exclusão de Visitante
    Given Selecionar o checkbox da credencial '133'
    When Clicar no botão Excluir na tela de Exclusão de Visitante
    Then Deve ver a mensagem 'Visitante excluído com sucesso' na tela de Exclusão de Visitante

@delVisitorThirdAuto
    Scenario: delVisitorThirdAuto
    Given Preencher o campo de busca com '134'
    Given Clicar no botão Buscar na tela de Exclusão de Visitante
    Given Selecionar o checkbox da credencial '134'
    When Clicar no botão Excluir na tela de Exclusão de Visitante
    Then Deve ver a mensagem 'Visitante excluído com sucesso' na tela de Exclusão de Visitante