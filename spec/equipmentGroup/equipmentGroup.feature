@equipmentGrourp
Feature: EquipmentGroup
    Com um usuário que tenha permissão
    Que eu consiga Cadastrar, Aterar e Excluir Grupo de Equipamento

    Background: RegisterEquipmentGroup
        Given que estou na tela de cadastro de Grupo de Equipamento

    @verifyLabels
    Scenario: verifyLabels
        Given que eu verifico todos os resources (nomes dos campos) apresentados na página
        When eu comparo com os resources esperados
        Then não deve existir alteração nos resources apresentados

    @fieldNumberRequired
    Scenario: fieldNumberRequired
        Given informo alfanumérico no campo "Número"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Número" pois o mesmo é obrigatório e só aceita numérico

    @fieldDescriptionRequired
    Scenario: fieldDescriptionRequired
        Given que eu não preencha o campo "Descrição"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado

    @fieldOriginAreaRequired
    Scenario: fieldOriginAreaRequired
        Given informo alfanumérico no campo "Área origem"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Área origem" pois o mesmo é obrigatório e só aceita numérico

    @fieldDestinationAreaRequired
    Scenario: fieldDestinationAreaRequired
        Given informo alfanumérico no campo "Área destino"
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve existgir uma validação no campo "Área destino" pois o mesmo é obrigatório e só aceita numérico

    @fieldEquipmentRequired
    Scenario: fieldEquipmentRequired
        Given eu não associe um equipamento ao grupo
        And preencho corretamente todas os outros campos necessários para efetuar o cadastro
        When eu clico no botão "Salvar"
        Then deve exibir uma mensagem de erro com informação ao usuário

    @verifyValuesTimeZone
    Scenario: verifyValuesTimeZone
        Given que eu obternha todos os valores do dropbox "Fuso horário"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @verifyValuesControlSortitionNoHasDestinationArea
    Scenario: verifyValuesControlSortitionNoHasDestinationArea
        Given que eu desmarque o campo "Grupo tem área de destino"
        And que eu obternha todos os valores do dropbox "Controla Sorteio"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @fieldDestinationAreaDisabledHasDestinationArea
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