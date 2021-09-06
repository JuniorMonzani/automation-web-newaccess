#18
@editEquipmentGroup
Feature: EditEquipmentGrourp
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Grupo de Equipamento

    Background: EditEquipmentGrourp
        Given que estou na tela quie lista os Grupos de Equipamentos cadastrados


    @verifyEditEquipmentGropup
    Scenario: verifyEditEquipmentGropup
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        Then deve direcionar para a página de alteração de grupo de equipamento

    @verifyFieldNumberDisabled
    Scenario: verifyFieldNumberDisabled
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        And na tela de alteração eu verifico o campo 'Número'
        Then o campo Número deverá estar 'Desabilitado'

    @verifyFieldOriginAreaDisabled
    Scenario: verifyFieldOriginAreaDisabled
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        And na tela de alteração eu verifico o campo 'Área origem'
        Then o campo Área origem deverá estar 'Desabilitado'

    @verifyFieldDestinationAreaDisabled
    Scenario: verifyFieldDestinationAreaDisabled
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        And na tela de alteração eu verifico o campo 'Área destino'
        Then o campo Área Destino deverá estar 'Desabilitado'

    @verifyFieldGroupHasDestinationAreaDisabled
    Scenario: verifyFieldGroupHasDestinationAreaDisabled
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        And na tela de alteração eu verifico o campo 'Grupo tem área de destino'
        Then o campo Grupo tem área de destino deverá estar 'Desabilitado'

    @editSuccessEquipmentGroup
    Scenario: editSuccessEquipmentGroup
        Given que eu faça a busca e encontre o grupo de equipamentos cadastrado pela automação
        When eu clico no ícone de alteração do grupo de equipamento
        And na tela de alteração eu altero a 'Descrição' do grupo de equipamentos
        And desassocio o equipamento '6 - Concentradora'
        And associo o equipamento '0 - Câmera'
        And clico em Salvar
        And que eu faça a busca utilizando a nova Descrição do grupo de equipamentos
        Then o sistema deve retornar o grupo de equipamentos alterado