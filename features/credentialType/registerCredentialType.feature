@registerCredentialType
Feature: Register Credential Type
    Como um usuário do sistema que tenha permissão para Cadastrar Tipos de Credenciais.

    Background:
        Given Que o usuário esteja na página de cadastro de Tipo de Credencial.

    @verifyLabelsCredentialType
    Scenario: verifyLabelsCredentialType
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página.

    @fieldDescriptionRequiredCredentialType
    Scenario: fieldDescriptionRequiredCredentialType
        Given eu encontro o campo "Descrição"
        And não preencho o campo "Descrição"
        When eu clico no botão "Salvar"
        Then deve existir uma validação no campo "Descrição" pois o mesmo é obrigatório

    @fieldDescriptionMaxSizeCredentialType
    Scenario: fieldDescriptionMaxSizeCredentialType
        Given eu encontro o campo "Descição"
        And eu informo 55 caracteres alfanuméricos
        When eu clico no botão "Salvar"
        Then o Tipo de Credencial deve ser salvo com 50 caracteres na Descrição

    @verifyValuesAuthenticationCredentialType
    Scenario: verifyValuesAuthenticationCredentialType
        Given que eu obternha todos os valores do dropbox "Autenticação"
        When eu comparo com os valores esperados
        Then deve conter todos os valores esperados

    @saveWithPersonAuthenticationCredentialType
    Scenario: saveWithPersonAuthenticationCredentialType
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Pessoa" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Pessoa"

    @saveWithVisitorAuthenticationCredentialType
    Scenario: saveWithVisitorAuthenticationCredentialType
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Visitante" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Visitante"

    @saveWithCredentialAuthenticationCredentialType
    Scenario: saveWithCredentialAuthenticationCredentialType
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Credencial" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Credencial"