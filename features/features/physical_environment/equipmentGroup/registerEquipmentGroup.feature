#encoding: UTF-8
@registerEquipmentGroup
Feature: Register Equipment Group
    Como um usuário do sistema que tenha permissão para Cadastrar Grupos de Equipamentos.
    
    Background:
        Given Que o usuário esteja na página de cadastro de Grupo de Equipamento.

    @verifyLabelsEquipmentGroup
    Scenario: verifyLabelsEquipmentGroup
        Given Que eu verifico e comparo todos os resources dos campos apresentados na tela.

    @fieldNumberRequiredEquipmentGroup
    Scenario: fieldNumberRequiredEquipmentGroup
        Given Informar caractere alfanumérico no campo "Número" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Número".
        Then Deve existgir uma validação no campo "Número" pois o mesmo é obrigatório e só aceita caractere numérico.

    @fieldDescriptionRequiredEquipmentGroup
    Scenario: fieldDescriptionRequiredEquipmentGroup
        Given Não preencher o campo "Descrição" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Descrição".
        Then Deve existgir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado.

    @fieldOriginAreaRequiredEquipmentGroup
    Scenario: fieldOriginAreaRequiredEquipmentGroup
        Given Informar caractere alfanumérico no campo "Área origem" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Área origem".
        Then Deve existgir uma validação no campo "Área origem" pois o mesmo é obrigatório e não foi informado.

    @fieldDestinationAreaRequiredEquipmentGroup
    Scenario: fieldDestinationAreaRequiredEquipmentGroup
        Given Informar caractere alfanumérico no campo "Área destino" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar o campo "Área destino".
        Then Deve existgir uma validação no campo "Área destino" pois o mesmo é obrigatório e não foi informado.

    @fieldEquipmentRequiredEquipmentGroup
    Scenario: fieldEquipmentRequiredEquipmentGroup
        Given Não associar equipamento ao grupo mas preencher corretamente todos os outros campos necessários para efetuar o cadastro.
        When Clicar no botão Salvar para validar ao menos um equipamento associado.
        Then Deve exibir uma mensagem de erro com informação ao usuário.

    @verifyValuesTimeZoneEquipmentGroup
    Scenario: verifyValuesTimeZoneEquipmentGroup
        Given Obter todos os valores do dropbox "Fuso horário" e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Fuso horário".

    @verifyValuesControlSortitionHasDestinationAreaEquipmentGroup
    Scenario: verifyValuesControlSortitionHasDestinationAreaEquipmentGroup
        Given Obter todos os valores do dropbox "Controla Sorteio" e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Controla Sorteio".

    @verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup
    Scenario: verifyValuesControlSortitionNoHasDestinationAreaEquipmentGroup
        Given Desmarcar o campo "Grupo tem área de destino" para alterar os valores no dropbox.
        And Obter todos os valores do dropbox "Controla Sorteio" após desmarcar o checkbox e compara com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Controla Sorteio" após desmarcar o checkbox.

    @fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup
    Scenario: fieldDestinationAreaDisabledHasDestinationAreaEquipmentGroup
        Given Desmarcar o campo "Grupo tem área de destino".
        Then O campo "Área destino" deve ficar desabilitado.

    @registerEquipmentGroupSuccess
    Scenario: registerEquipmentGroupSuccess
        Given Que eu preencha todos os campos obrigatórios de forma correta.
        And Selecionar o "Fuso Horário" como "03:00".
        And Selecionar o "Controla sorteio" como "Área origem".
        And Adicionar uma data válida no campo "Data inicial".
        And Adicionar uma data válida no campo "Data final".
        When Clicar no botão "Salvar" para incluir o grupo.
        Then O grupo de equipamento deve ser salvo com sucesso.