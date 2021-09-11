@registerCredentialType
Feature: registerCredentialType
    Com um usuário que tenha permissão.
    Que eu consiga Cadastrar, Aterar e Excluir um Tipo de Credencial.

    Background: registerCredentialType
        Given que estou na tela de cadastro de Tipo de Credencial

    @verifyLabelsCredentialType
    Scenario: verifyLabels
        Given que eu verifico todos os resources (nomes dos campos) apresentados na página
        When eu comparo com os resources esperados
        Then não deve existir alteração nos resources apresentados

    @fieldDescriptionRequiredCredentialType
    Scenario: fieldDescriptionRequired
        Given eu encontro o campo "Descrição"
        And não preencho o campo "Descrição"
        When eu clico no botão "Salvar"
        Then deve existir uma validação no campo "Descrição" pois o mesmo é obrigatório

    @fieldDescriptionMaxSizeCredentialType
    Scenario: fieldDescriptionMaxSize
        Given eu encontro o campo "Descição"
        And eu informo 55 caracteres alfanuméricos
        When eu clico no botão "Salvar"
        Then o Tipo de Credencial deve ser salvo com 50 caracteres na Descrição

    @verifyValuesAuthenticationCredentialType
    Scenario: verifyValuesAuthentication
        Given que eu obternha todos os valores do dropbox "Autenticação"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @saveWithPersonAuthenticationCredentialType
    Scenario: saveCredentialTypeWithPersonAuthentication
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Pessoa" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Pessoa"

    @saveWithVisitorAuthenticationCredentialType
    Scenario: saveCredentialTypeWithVisitorAuthentication
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Visitante" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Visitante"

    @saveWithCredentialAuthenticationCredentialType
    Scenario: saveCredentialTypeWithCredentialAuthentication
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Credencial" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Credencial"