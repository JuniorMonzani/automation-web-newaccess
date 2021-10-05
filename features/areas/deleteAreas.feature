#26
@deleteAreas
Feature: delete Areas
    Como um usuário do sistema que tenha permissão para Exclur Áreas.

    Background:
        Given Que o usuário esteja na página que lista as Áreas cadastradas.

 @verifyValuesFilterSearchArea
    Scenario: verifyValuesFilterSearchArea
        Given Desmarco a flag 10 últimas atualizações_01.
        When Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados.
        Then Deve conter todos os valores esperados.

    @searchByNumberAreaNotExsist
    Scenario: searchByNumberAreaNotExsist
        Given Desmarco a flag 10 últimas atualizações_02.
        When Eu preencho o textbox com um número de grupo que não existe.
        And Clico em Buscar_02.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_02.

    @searchByNumberAreaExsist
    Scenario: searchByNumberAreaExsist
        Given Desmarco a flag 10 últimas atualizações_03.
        When Eu preencho o textbox com um número de grupo que existe_03.
        And Clico em Buscar_03.
        Then Validar se foi encontrada a Área esperada_03.

    @searchByDescriptionAreaNotExsist
    Scenario: searchByDescriptionAreaNotExsist
        Given Desmarco a flag 10 últimas atualizações_04.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_04.
        When Eu preencho o textbox com um número de grupo que existe mas não faça parte de nenhuma descrição de grupo de equipamento.
        And Clico em Buscar_04.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_04.

    @searchByDescriptionAreaExsist
    Scenario: searchByDescriptionAreaExsist
        Given Desmarco a flag 10 últimas atualizações_05.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_05.
        When Eu preencho o textbox com uma descrição de uma Área que existe_05.
        And Clico em Buscar_05.
        Then Validar se foi encontrada a Área esperada.

    @verifyMessageDeteleAreaInUse
    Scenario:verifyMessageDeteleAreaInUse
        Given Desmarco a flag 10 últimas atualizações_06.
        And Eu preencho o textbox com um número da Área "1" (em uso).
        And Clico em Buscar_06.
        When Eu clico no ícone de Excluir_06.
        Then Validar a mensagem apresentada ao usuário_06.

    @verifyMessageDeteleArea
    Scenario: verifyMessageDeteleArea
        Given Desmarco a flag 10 últimas atualizações_07.
        And Que eu faça a busca e encontre a Área cadastrada pela automação_07.
        And Clico em Buscar_07.
        When Eu clico no ícone de Excluir_07.
        Then Validar a mensagem apresentada ao usuário_07.

    @deteleSuccessArea
    Scenario: deteleSuccessArea
        Given Desmarco a flag 10 últimas atualizações_08.
        And Preencha o textbox com um número da Área que foi inserida pela automação_08.
        And Clico em Buscar_08.
        When Eu clico no ícone de Excluir_08.
        And Ao ser exibida a mensagem clicar em "Sim".
        And Validar se a Área foi excluída.