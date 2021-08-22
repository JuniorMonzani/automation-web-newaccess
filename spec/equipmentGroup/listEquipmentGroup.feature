@listEquipmentGrourp
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

    @verifyMessageDeteleEquipmentGropup
    Scenario: verifyMessageDeteleEquipmentGropup
        Given que eu tenha cadastrado o grupo de equipamentos
        When eu clico no ícone de "Excluir"
        Then validar a mensagem apresentada ao usuário
        And clicar no botão "Não"

    @deteleEquipmentGroup
    Scenario: deteleEquipmentGroup
        Given que eu tenha cadastrado o grupo de equipamentos
        When eu clico no ícone de "Excluir"
        Then ao ser exibida a mensagem clicar em "Sim"

    @verifyEquipmentExclusion
    Scenario: verifyEquipmentExclusion
        Given que eu tenha excluido o grupo de equipamento que foi cadastrado pela automação
        When eu verifico que existe o
