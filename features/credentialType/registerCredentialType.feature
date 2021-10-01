@registerCredentialType
Feature: Register Credential Type
    Como um usuário do sistema que tenha permissão para Cadastrar Tipos de Credenciais.

    Background:
        Given Que o usuário esteja na página de cadastro de Tipo de Credencial.

    @verifyLabelsCredentialType
    Scenario: verifyLabelsCredentialType
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de tipo de credencial.

    @fieldDescriptionRequiredCredentialType
    Scenario: fieldDescriptionRequiredCredentialType
        Given Não preencher o campo "Descrição" e preencher corretamente todos os outros campos necessários para efetuar o cadastro de tipo de credencial.
        When Clicar no botão Salvar para validação do campo "Descrição".
        Then Deve existir uma validação no campo "Descrição" pois o mesmo é obrigatório e não foi informado.

    @fieldDescriptionMaxSizeCredentialType
    Scenario: fieldDescriptionMaxSizeCredentialType
        Given Que eu tente preencher o campo obrigatório "Descrição" na tela de cadastro de tipo de credencial informando 55 caracteres alfanuméricos.
        Then Clicando em "Salvar" o campo "Descrição" deve ser preenchido com 50 caracteres que é a quantidade máxima permitida no cadastro de o Tipo de Credencial.

    @verifyValuesAuthenticationRegisterCredentialType
    Scenario: verifyValuesAuthenticationRegisterCredentialType
        Given Obter todos os valores do dropbox "Autenticação" na tela de cadastro de tipo de credencial e comparar com os valores esperados.
        Then Deve conter todos os valores esperados no campo "Autenticação" na tela de cadastro. 
        
    @saveWithPersonAuthenticationCredentialType
    Scenario: saveWithPersonAuthenticationCredentialType
        Given Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Pessoa".
        And Selecionar o "Pessoa" como "Autenticação".
        When Clicar no botão "Salvar" para incluir o tipo de credencial "Pessoa".
        Then O Tipo de Credencial com autenticação "Pessoa" deve ser salvo com sucesso.

    @saveWithVisitorAuthenticationCredentialType
    Scenario: saveWithVisitorAuthenticationCredentialType
        Given Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Visitante".
        And Selecionar o "Visitante" como "Autenticação".
        When Clicar no botão "Salvar" para incluir o tipo de credencial "Visitante".
        Then O Tipo de Credencial com autenticação "Visitante" deve ser salvo com sucesso.

    @saveWithCredentialAuthenticationCredentialType
    Scenario: saveWithCredentialAuthenticationCredentialType
        Given Que eu preencha o campo obrigatório "Descrição" para cadastro de um novo Tipo de Credencial como "Credencial".
        And Selecionar o "Credencial" como "Autenticação".
        When Clicar no botão "Salvar" para incluir o tipo de credencial "Credencial".
        Then O Tipo de Credencial com autenticação "Credencial" deve ser salvo com sucesso.