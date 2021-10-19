#19
@deleteEquipmentGroup

Feature: deleteEquipmentGroup
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Grupo de Equipamento

    Background: 
        Given Que estou na tela que lista os Grupos de Equipamentos cadastrados para realizar buscas e exxlusões.

    @verifyValuesFilterSearchEquipmentGroup
    Scenario: verifyValuesFilterSearchEquipmentGroup
        Given Desmarco a flag 10 últimas atualizações do Grupo de Equipamento.
        When Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados para o campo da tela Grupo de Eqp.
        Then Deve conter todos os valores esperados para o campo da tela de Grupo de Eqp.

    @searchByNumberNotExsist
    Scenario: searchByNumberNotExsist
        Given Desmarco a flag 10 últimas atualizações_02.
        When Eu preencho o textbox com um número de grupo que não existe.
        And Clico em Buscar_02.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_02.

    @searchByNumberExsist
    Scenario: searchByNumberExsist
        Given Desmarco a flag 10 últimas atualizações_03.
        When Eu preencho o textbox com um número de grupo que existe_03.
        And Clico em Buscar_03.
        Then Validar se foi encontrado o grupo de equipamento esperado_03.

    @searchByDescriptionNotExsist
    Scenario: searchByDescriptionNotExsist
        Given Desmarco a flag 10 últimas atualizações_04.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_04.
        When Eu preencho o textbox com um número de grupo que existe mas não faça parte de nenhuma descrição de grupo de equipamento.
        And Clico em Buscar_04.
        Then Validar o label apresentado que informa que nenhum resultado foi encontrado_04.

    @searchByDescriptionExsist
    Scenario: searchByDescriptionExsist
        Given Desmarco a flag 10 últimas atualizações_05.
        And Seleciono o valor Descrição no dropbox de filtro de pesquisa_05.
        When Eu preencho o textbox com uma descrição de grupo que existe_05.
        And Clico em Buscar_05.
        Then Validar se foi encontrado o grupo de equipamento esperado.

    @verifyMessageDeteleEquipmentGropupInUse
    Scenario:verifyMessageDeteleEquipmentGropupInUse
        Given Desmarco a flag 10 últimas atualizações_06.
        And Eu preencho o textbox com um número de grupo que esteja em uso.
        And Clico em Buscar_06.
        When Eu clico no ícone de Excluir_06.
        Then Validar a mensagem apresentada ao usuário_06.

    @verifyMessageDeteleEquipmentGropup
    Scenario: verifyMessageDeteleEquipmentGropup
        Given Desmarco a flag 10 últimas atualizações_07.
        And Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_07.
        And Clico em Buscar_07.
        When Eu clico no ícone de Excluir_07.
        Then Validar a mensagem apresentada ao usuário_07.

    @deteleSuccessEquipmentGroup
    Scenario: deteleSuccessEquipmentGroup
        Given Desmarco a flag 10 últimas atualizações_08.
        And Preencha o textbox com um número do grupo que foi inserido pela automação_08.
        And Clico em Buscar_08.
        When Eu clico no ícone de Excluir_08.
        And Ao ser exibida a mensagem clicar em Sim.
        And Validar se o grupo foi excluído.