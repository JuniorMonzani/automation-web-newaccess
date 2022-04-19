@copyTimeSlots
Feature: copy Time Slots
    Como um usuário do sistema que tenha permissão para Copiar Faixas Horárias.

    Background:
        Given Que o usuário esteja na página que lista as Faixas Horárias objetivando cópia.

    @verifyCopyTimeSlots
    Scenario: verifyCopyTimeSlots
        Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_01 objetivando cópia.
        When Eu clico no ícone de Cópia da Faixa Horária_01 objetivando cópia.
        Then Deve direcionar para a página de alteração de Faixas Horárias_01.

    @verifyNumberCopyTimeSlots
    Scenario: verifyNumberCopyTimeSlots
        Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_02 objetivando cópia.
        When Eu clico no ícone de Cópia da Faixa Horária_02 objetivando cópia.
        Then Ao abrir a página de cadastro da nova Faixa Horária, a textbox "Número" não deve conter valor.

    @verifyDescriptionCopyTimeSlots
    Scenario: verifyDescriptionCopyTimeSlots
        Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_03 objetivando cópia.
        When Eu clico no ícone de Cópia da Faixa Horária_03 objetivando cópia.
        Then Ao abrir a página de cadastro da nova Faixa Horária, a textbox "Descrição" não deve conter valor.

    @verifyDisableCheckboxCopyTimeSlots
    Scenario: verifyDisableCheckboxCopyTimeSlots
        Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_04 objetivando cópia.
        When Eu clico no ícone de Cópia da Faixa Horária_04 objetivando cópia.
        Then Ao abrir a página de cadastro da nova Faixa Horária, todos os textbox das faixas horárias que não possuem obrigatoriedade devem estar desmarcados assim como na Faixa Horária que foi copiada.

    @verifyEnableCheckboxCopyTimeSlots
    Scenario: verifyEnableCheckboxCopyTimeSlots
        Given Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_05 objetivando cópia.
        And Eu clico no ícone de Cópia da Faixa Horária objetivando edição.
        And Ao abrir a página de alteração da Faixa Horária, preencher todos os campos de "Hora inicial" e "Hora final" corretamente para efetuar o cadastro.
        And Preencher o campo Número com "254" objetivando cópia.
        And Clicar em Salvar_06.
        And Que eu faça a busca e encontre a Faixa Horária cadastrada pela automação_06.1.
        When Eu clico no ícone de Cópia da Faixa Horária_06 objetiando cópia.
        Then Ao abrir a página de cadastro da nova Faixa Horária, todos os textbox devem estar preenchidos assim como na Faixa Horária que foi copiada.
        And O campo "Número" deve estar habilitado e conter o valor cadastrado.