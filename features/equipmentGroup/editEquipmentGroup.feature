#18
@editEquipmentGroup
Feature: EditEquipmentGrourp
    Com um usuário que tenha permissão.
    Que eu consiga Cadastrar, Aterar e Excluir Grupo de Equipamento.

    Background:
        Given Que estou na tela que lista os Grupos de Equipamentos cadastrados para realizar alterações.


    @verifyEditEquipmentGropup
    Scenario: verifyEditEquipmentGropup
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_01.
        When Eu clico no ícone de alteração do grupo de equipamento_01.
        Then Deve direcionar para a página de alteração de grupo de equipamento.

    @verifyFieldNumberDisabled
    Scenario: verifyFieldNumberDisabled
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_02.
        When Eu clico no ícone de alteração do grupo de equipamento_02.
        Then Na tela de alteração eu verifico o campo Número e o mesmo deve estar desabilitado.

    @verifyFieldOriginAreaDisabled
    Scenario: verifyFieldOriginAreaDisabled
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_03.
        When Eu clico no ícone de alteração do grupo de equipamento_03.
        Then Na tela de alteração eu verifico o campo Área origem e o mesmo deve estar desabilitado.

    @verifyFieldDestinationAreaDisabled
    Scenario: verifyFieldDestinationAreaDisabled
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_04.
        When Eu clico no ícone de alteração do grupo de equipamento_04.
        Then Na tela de alteração eu verifico o campo Área destino e o mesmo deve estar desabilitado.

    @verifyFieldGroupHasDestinationAreaDisabled
    Scenario: verifyFieldGroupHasDestinationAreaDisabled
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_05.
        When Eu clico no ícone de alteração do grupo de equipamento_05.
        Then Na tela de alteração eu verifico o campo Grupo tem área destino e o mesmo deve estar desabilitado.

    @editSuccessEquipmentGroup
    Scenario: editSuccessEquipmentGroup
        Given Que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação_06.
        When Eu clico no ícone de alteração do grupo de equipamento_06.
        And Na tela de alteração eu altero a Descrição do grupo de equipamentos.
        And Desassocio o equipamento 6 - Concentradora.
        And Associo o equipamento 101 - Câmera.
        And Clico em Salvar.
        And Que eu faça a busca utilizando a nova Descrição do grupo de equipamentos.
        Then O sistema deve retornar o grupo de equipamentos alterado.