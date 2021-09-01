@listEquipmentGroup
Feature: ListEquipmentGrourp
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Grupo de Equipamento

    Background: ListEquipmentGrourp
        Given que estou na tela quie lista os Grupos de Equipamentos cadastrados

    @verifyValuesFilterSearchEquipmentGroup
    Scenario: verifyValuesFilterSearchEquipmentGroup
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        When encontro o dropbox de filtro da pesquisa
        And eu comparo com o valores esperados
        Then deve conter todos os valores esperados

    @searchByNumberNotExsist
    Scenario: searchByNumberNotExsist
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        And o valor no dropbox de filtro de pesquisa seja 'Número'
        When eu preencho o textbox com um número de grupo que não existe
        And clico em Buscar
        Then validar o label apresentado que informa que nenhum resultado foi encontrado

    @searchByNumberExsist
    Scenario: searchByNumberExsist
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        And o valor no dropbox de filtro de pesquisa seja 'Número'
        When eu preencho o textbox com um número de grupo que existe
        And clico em Buscar
        Then validar se foi encontrado o grupo de equipamento esperado

    @searchByDescriptionNotExsist
    Scenario: searchByDescriptionNotExsist
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        And seleciono o valor 'Descrição' no dropbox de filtro de pesquisa
        When eu preencho o textbox com um número de grupo que existe mas não faça parte de nenhuma descrição de grupo de equipamento
        And clico em Buscar
        Then validar o label apresentado que informa que nenhum resultado foi encontrado

    @searchByDescriptionExsist
    Scenario: searchByDescriptionExsist
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        And seleciono o valor 'Descrição' no dropbox de filtro de pesquisa
        When eu preencho o textbox com uma descrição de grupo que existe
        And clico em Buscar
        Then validar se foi encontrado o grupo de equipamento esperado  

    @verifyMessageDeteleEquipmentGropupIsInUse
    Scenario:verifyMessageDeteleEquipmentGropupIsInUse
        Given que eu faça a busca e encontre o grupo de equipamentos que esteja em uso
        When eu clico no ícone de "Excluir"
        Then validar a mensagem apresentada ao usuário

    @verifyMessageDeteleEquipmentGropup
    Scenario: verifyMessageDeteleEquipmentGropup
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de "Excluir"
        Then validar a mensagem apresentada ao usuário
        And clicar no botão "Não"

    @deteleEquipmentGroup
    Scenario: deteleEquipmentGroup
        Given que eu esteja na página que lista os Grupos de Equipamentos cadstrados
        And desmarco a flag '10 últimas atualizações'
        And o valor no dropbox de filtro de pesquisa seja 'Número'
        And preencha o textbox com um número do grupo que foi inserido pela automação
        And clico em Buscar
        When eu clico no ícone de "Excluir"
        Then ao ser exibida a mensagem clicar em "Sim"
        And valido se o grupo foi excluído