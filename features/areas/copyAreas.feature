#26
@copyAreas
Feature: copy Areas
    Como um usuário do sistema que tenha permissão para Copiar Áreas.

    Background:
        Given Que o usuário esteja na página que lista as Áreas objetivando cópia.

    @verifyCopyAreas
    Scenario: verifyCopyAreas
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_01 objetivando cópia.
        When Eu clico no ícone de Cópia da Área_01 objetivando cópia.
        Then Deve direcionar para a página de alteração de Área_01.

    @verifyNumberCopyArea
    Scenario: verifyNumberCopyArea
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_02 objetivando cópia.
        When Eu clico no ícone de Cópia da Área_02 objetivando cópia.
        Then Ao abrir a página de cadastro da nova área, a textbox "Número" não deve conter valor.

    @verifyDescriptionCopyArea
    Scenario: verifyDescriptionCopyArea
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_03 objetivando cópia.
        When Eu clico no ícone de Cópia da Área_03 objetivando cópia.
        Then Ao abrir a página de cadastro da nova área, a textbox "Descrição" não deve conter valor.

    @verifyCapacityCopyArea
    Scenario: verifyCapacityCopyArea
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_04 objetivando cópia.
        When Eu clico no ícone de Cópia da Área_04 objetivando cópia.
        Then Ao abrir a página de cadastro da nova área, a capacidade deve ser "99999".

    @verifyDisableCheckboxCopyArea
    Scenario: verifyEnableCheckboxCopyArea
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_05 objetivando cópia.
        When Eu clico no ícone de Cópia da Área_05 objetivando cópia.
        Then Ao abrir a página de cadastro da nova área, todos os checkbox devem estar desmarcados assim como na área que foi copiada.

    @verifyEnableCheckboxCopyArea
    Scenario: verifyDisableCheckboxCopyArea
        Given Que eu faça a busca e encontre a Área cadastrada pela automação_06 objetivando cópia.
        And Eu clico no ícone de Alteração da Área_06 objetivando cópia.
        And Ao abrir a página de alteração da área, marcar todos os checkbox do cadastro.
        And Clicar em Salvar_06.
        And Que eu faça a busca e encontre a Área cadastrada pela automação_06.1.
        When Eu clico no ícone de Cópia da Área_06.
        Then Ao abrir a página de cadastro da nova área, todos os checkbox devem estar marcados assim como na área que foi copiada.
        And O campo "Capacidade" deve estar desabilitado.