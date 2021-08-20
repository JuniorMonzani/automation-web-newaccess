@credentialType
Feature: CredentialType
    Com um usuário que tenha permissão.
    Que eu consiga Cadastrar, Aterar e Excluir um Tipo de Credencial.

    Background: RegisterCredentialType
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

    @verifyDescriptionMaxSizeCredentialType
    Scenario: verifyDescriptionMaxSize
        Given que estou na lista de Tipos de Credencial cadastradas
        And tenho um Tipo de Credencial cadastrado com o máximo permitido de caracteres no campo "Descrição" (50 caracteres)
        When eu verifico a quantidade de caracteres da descrição
        Then o tamanho da Descrição do Tipo de Credencial deve corresponder o o valor máximo esperado (50 caracteres)

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

    @verifyAuthenticationPersonCredentialType
    Scenario: verifyAuthenticationPerson
        Given que tenha cadastrado um Tipo de Credencial com autenticação em "Pessoa"
        When eu verifico o tipo de autenticação
        Then deve ser do tipo "Pessoa"

    @saveWithVisitorAuthenticationCredentialType
    Scenario: saveCredentialTypeWithVisitorAuthentication
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Visitante" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Visitante"

    @verifyAuthenticationVisitorCredentialType
    Scenario: verifyAuthenticationVisitor
        Given que tenha cadastrado um Tipo de Credencial com autenticação em "Visitante"
        When eu verifico o tipo de autenticação
        Then deve ser do tipo "Visitante"

    @saveWithCredentialAuthenticationCredentialType
    Scenario: saveCredentialTypeWithCredentialAuthentication
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição
        And seleciono o valor "Credencial" no campo "Autenticação"
        When eu clico no botão "Salvar"
        Then deve salvar o Tipo de Credencial com autenticação em "Credencial"

    @verifyAuthenticationCredentialCredentialType
    Scenario: verifyAuthenticationCredential
        Given que tenha cadastrado um Tipo de Credencial com autenticação em "Credencial"
        When eu verifico o tipo de autenticação
        Then deve ser do tipo "Credencial"

    @saveAlreadyExistsCredentialType
    Scenario: saveCredentialTypeAlreadyExists
        Given que eu esteja na tela de cadastro de um novo Tipo de Credencial
        And insiro uma descrição que já existe cadatrada para outro Tipo de Credencial
        When eu clico no botão "Salvar"
        Then uma validação deve ser apresentada onde a mensagem deve correspender a mensagem esperada

    @verifyMessageDeleteCredentialType
    Scenario: verufyMessageDeleteCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu clico no ícone "Excluir" de um Tipo de Credencial (que não esteja sendo usado no sistema)
        Then uma validação deve ser apresentada onde a mensagem deve correspender a mensagem esperada
        And deve existir os botões "Sim" e "Não" (para a exclusão do Tipo de Credemncial) conforme esperado

    @deleteCredentialType
    Scenario: deleteCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu clico no ícone "Excluir" de um Tipo de Credencial (que não esteja sendo usado no sistema)
        Then na mensagem apresentada clicar em "Sim" para excluir o Tipo de Credencial

    @verifyDeletionCredentialType
    Scenario: verifyDeletionCredentialType
        Given que estou na lista de Tipos de Credencial cadastradas
        When eu busco o Tipo de Credencial que foi exlcuído do sistema
        Then não deve retornar o Tipo de Credencial pois o mesmo não existe no sistema