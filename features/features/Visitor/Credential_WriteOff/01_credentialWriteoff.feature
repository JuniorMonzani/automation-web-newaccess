@credentialWriteoff
Feature: Credential Writeoff
    Como um usuário do sistema que tenha permissão para Baixar Credenciais.

    Background:
        Given Que o usuário esteja na página de baixa de credenciais.

    @verifyResourcesCredentialWriteoff
    Scenario: verifyResourcesCredentialWriteoff
        Then Comparar os resources apresentados com os esperados na página de baixa de credencial.

    @verifyCredentialNotFound
    Scenario: verifyCredentialNotFound
        Given Preencher os campos Credencial e Até com '999' e '999'
        When Clicar no botão 'Buscar' na tela de baixa de credencial
        Then Deve apresentar a mensagem 'Nenhum resultado foi encontrado'

    @verifySearchByCredential
    Scenario: verifySearchByCredential
        Given Preencher os campos Credencial e Até com '11' e '11'
        When Clicar no botão 'Buscar' na tela de baixa de credencial
        Then Deve apresentar o nome 'Cred em uso'

    @verifySearchByName
    Scenario: verifySearchByName
        Given Preencher o campo nome com 'Cred em uso'
        When Clicar no botão 'Buscar' na tela de baixa de credencial
        Then Deve apresentar a credencial '11'
        
    @verifySearchByDate
    Scenario: verifySearchByDate
        Given Preencher o campo data com '29/01/2024'
        When Clicar no botão 'Buscar' na tela de baixa de credencial
        Then Deve apresentar a credencial '11'

    @verifyStatusComboboxOptions
    Scenario: verifyStatusComboboxOptions
        Given Que ao clicar no combobox Status
        When Obter os valores do combobox
        Then Os valores devem ser 'Todos', 'Em andamento' e 'Expirada' no campo Status

    @removeFirstCredencial
    Scenario: removeFirstCredencial
        Given Preencher os campos Credencial e Até com '12' e '12'
        Given Clicar no botão 'Buscar' na tela de baixa de credencial
        Given Selecionar o checkbox da primeira credencial
        When Clicar no botão 'Baixar' na tela de Baixa de Credencial
        Then Deve apresentar a mensagem 'Credencial baixada com sucesso'

    @removeSecondCredencial
    Scenario: removeSecondCredencial
        Given Preencher os campos Credencial e Até com '14' e '14'
        Given Clicar no botão 'Buscar' na tela de baixa de credencial
        Given Selecionar o checkbox da primeira credencial
        When Clicar no botão 'Baixar' na tela de Baixa de Credencial
        Then Deve apresentar a mensagem 'Credencial baixada com sucesso'