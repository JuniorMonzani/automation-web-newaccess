#26
@deleteAreas
Feature: delete Areas
    Como um usuário do sistema que tenha permissão para Exclur Áreas.

    Background:
        Given Que o usuário esteja na página que lista as Áreas objetivando exclusão.

    @verifyValuesFilterSearchArea
    Scenario: verifyValuesFilterSearchArea
        Given Desmarco a flag 10 últimas atualizações_01 objetivando exclusão de Área.
        When Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados.
        Then Deve conter todos os valores esperados.

    @searchByNumberAreaNotExsist
    Scenario: searchByNumberAreaNotExsist
        Given Desmarco a flag 10 últimas atualizações_02 objetivando exclusão de Área.
        When Eu preencho o textbox com um número de grupo que não existe objetivando exclusão de Área.
        And Clico em Buscar_02 objetivando exclusão de Área.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_02 objetivando exclusão de Área.

    @searchByNumberAreaExsist
    Scenario: searchByNumberAreaExsist
        Given Desmarco a flag 10 últimas atualizações_03 objetivando exclusão de Área.
        When Eu preencho o textbox com um número de grupo que existe_03 objetivando exclusão de Área.
        And Clico em Buscar_03 objetivando exclusão de Área.
        Then Validar se foi encontrada a Área esperada_03 objetivando exclusão de Área.

    @searchByDescriptionAreaNotExsist
    Scenario: searchByDescriptionAreaNotExsist
        Given Desmarco a flag 10 últimas atualizações_04 objetivando exclusão de Área.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_04 objetivando exclusão de Área.
        When Eu preencho o textbox com um número de área que existe mas não faça parte de nenhuma descrição de área cadastrada.
        And Clico em Buscar_04 objetivando exclusão de Área.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_04 objetivando exclusão de Área.

    @searchByDescriptionAreaExsist
    Scenario: searchByDescriptionAreaExsist
        Given Desmarco a flag 10 últimas atualizações_05 objetivando exclusão de Área.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_05 objetivando exclusão de Área.
        When Eu preencho o textbox com uma descrição de uma Área que existe_05.
        And Clico em Buscar_05 objetivando exclusão de Área.
        Then Validar se foi encontrada a Área esperada.

    @verifyMessageDeteleAreaInUse
    Scenario:verifyMessageDeteleAreaInUse
        Given Desmarco a flag 10 últimas atualizações_06 objetivando exclusão de Área.
        And Eu preencho o textbox com um número da Área "1" em uso, objetivando exclusão de Área.
        And Clico em Buscar_06 objetivando exclusão de Área.
        When Eu clico no ícone de Excluir_06 objetivando exclusão de Área.
        Then Validar a mensagem apresentada ao usuário_06 objetivando exclusão de Área.

    @verifyMessageDeteleArea
    Scenario: verifyMessageDeteleArea
        Given Desmarco a flag 10 últimas atualizações_07 objetivando exclusão de Área.
        And Que eu faça a busca e encontre a Área cadastrada pela automação_07 objetivando exclusão de Área.
        And Clico em Buscar_07 objetivando exclusão de Área.
        When Eu clico no ícone de Excluir_07 objetivando exclusão de Área.
        Then Validar a mensagem apresentada ao usuário_07 objetivando exclusão de Área.

    @deteleSuccessArea
    Scenario: deteleSuccessArea
        Given Desmarco a flag 10 últimas atualizações_08 objetivando exclusão de Área.
        And Preencha o textbox com um número da Área que foi inserida pela automação_08 objetivando exclusão de Área.
        And Clico em Buscar_08 objetivando exclusão de Área.
        When Eu clico no ícone de Excluir_08 objetivando exclusão de Área.
        And Ao ser exibida a mensagem clicar em "Sim" objetivando exclusão de Área.
        And Validar se a Área foi excluída.