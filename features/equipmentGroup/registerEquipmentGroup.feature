@registerEquipmentGroup
Feature: Register Equipment Group
    Como um usuário do sistema que tenha permissão para Cadastrar Grupos de Equipamentos
    
    Background:
        Given que estou na tela de cadastro de Grupo de Equipamento

    @verifyLabelsEquipmentGroup
    Scenario: verifyLabels
        Given que eu verifico e comparo todos os resources dos campos apresentados na tela.

    @fieldNumberRequiredEquipmentGroup
    Scenario: fieldNumberRequired
        Given informo alfanumérico no campo Número e preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão Salvar
        Then deve existgir uma validação no campo Número pois o mesmo é obrigatório e só aceita numérico

    @fieldDescriptionRequired
    Scenario: fieldDescriptionRequiredEquipmentGroup
        Given que eu não preencha o campo "Descrição"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado

    @fieldOriginAreaRequired
    Scenario: fieldOriginAreaRequiredEquipmentGroup
        Given informo alfanumérico no campo "Área origem"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Área origem" pois o mesmo é obrigatório e só aceita numérico

    @fieldDestinationAreaRequired
    Scenario: fieldDestinationAreaRequiredEquipmentGroup
        Given informo alfanumérico no campo "Área destino"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Área destino" pois o mesmo é obrigatório e só aceita numérico

    @fieldEquipmentRequired
    Scenario: fieldEquipmentRequiredEquipmentGroup
        Given eu não associe um equipamento ao grupo
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve exibir uma mensagem de erro com informação ao usuário

    @verifyValuesTimeZoneEquipmentGroup
    Scenario: verifyValuesTimeZone
        Given que eu obternha todos os valores do dropbox "Fuso horário"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup
    Scenario: verifyValuesControlSortitionNoHasDestinationArea
        Given que eu desmarque o campo "Grupo tem área de destino"
        And que eu obternha todos os valores do dropbox "Controla Sorteio"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup
    Scenario: fieldDestinationAreaDisabledHasDestinationArea
        Given que eu desmarque o campo "Grupo tem área de destino"
        Then o campo "Área destino" deve ficar desabilitado

    @registerEquipmentGroupSuccess
    Scenario: registerEquipmentGroupSuccess
        Given que eu preencha todos os campos obrigatórios de forma correta
        And marque o campo "Controla acesso de veículos"
        And marque o campo "Respeita horário de verão"
        And selecione o "Fuso Horário" como "03:00"
        And selecione o "Controla sorteio" como "Área origem"
        And adicione uma data válida no campo "Data inicial"
        And adicione uma data válida no campo "Data final"
        When eu clico no botão "Salvar"
        Then o grupo de equipamento deve ser salvo com sucesso