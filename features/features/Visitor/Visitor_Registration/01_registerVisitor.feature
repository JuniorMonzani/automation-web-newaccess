@registerVisitor
Feature: Register Visitor
    Como um usuário do sistema que tenha permissão para Cadastrar Visitante.

    Background:
        Given Que o usuário esteja na página de cadastro de Visitante.

    @verifyResourcesVisitor
    Scenario: verifyResourcesVisitor
        Then Comparar os resources apresentados com os esperados na página de cadastro de Visitante.

    @verifyRequiredFieldVisitorDoc
    Scenario: verifyRequiredFieldVisitorDoc
        Given Preencher o campo Documento da tela de Visitante com ''.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Documento: 'Informe o Documento'.

    @verifyRequiredFieldVisitorName
    Scenario: verifyRequiredFieldVisitorName
        Given Preencher o campo Nome da tela de Visitante com ''.
        When Clicar no botão Salvar.
        Then Deve existir validação do campo Nome: 'Informe o Nome'.

    @verifyVisitorNotFound
    Scenario: verifyVisitorNotFound
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '132'
        When Clicar no botão 'Buscar' na tela de Visitante
        Then Deve exibir a mensagem '- Nenhum Visitante foi encontrado'

    @verifyDisabledFields
    Scenario: verifyDisabledFields
        Given Que esteja na tela de cadastro de Visitante
        When Verificar os campos 'Motivo persona non grata', 'Contato', 'Estrutura' e 'Perfil de Acesso'
        Then Deve ver os campos desabilitados para preenchimento

    @verifyInvalidDoc
    Scenario: verifyInvalidDoc
        Given Que esteja na tela de cadastro de Visitante
        Given Selecionar o tipo de documento como 'CPF'
        Given Preencher o campo Documento com '132'
        When Clicar no botão 'Buscar'
        Then Deve exibir a mensagem 'Documento inválido' no campo Documento

    @verifyRequiredCredencial
    Scenario: verifyRequiredCredencial
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar na lupa de Contato
        Given Preencher o campo Nome com 'Pessoa 1'
        Given Clicar no botão 'Buscar' na tela de Busca Avançada
        Given Selecionar o checkbox da 'Pessoa 1'
        Given Clicar no botão 'Ok' na tela de Busca Avançada
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem 'Informe a Credencial' no campo Credencial


    @verifyRequiredPerfilAcesso
    Scenario: verifyRequiredPerfilAcesso
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar na lupa de Contato
        Given Preencher o campo Nome com 'Pessoa 1'
        Given Clicar no botão 'Buscar' na tela de Busca Avançada
        Given Selecionar o checkbox da 'Pessoa 1'
        Given Clicar no botão 'Ok' na tela de Busca Avançada
        Given Clicar na lupa do campo Credencial
        Given Selecionar o checkbox da primeira Credencial
        Given Clicar no botão 'Ok' da tela de Credencial Disponível
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem 'Você deve cadastrar o Perfil de Acesso' no campo Perfil

    @verifyRequiredTime
    Scenario: verifyRequiredTime
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar na lupa de Contato
        Given Preencher o campo Nome com 'Pessoa 1'
        Given Clicar no botão 'Buscar' na tela de Busca Avançada
        Given Selecionar o checkbox da 'Pessoa 1'
        Given Clicar no botão 'Ok' na tela de Busca Avançada
        Given Clicar na lupa do campo Perfil de Acesso
        Given Selecionar o checkbox do primeiro Perfil de Acesso
        Given Clicar no botao 'Ok' da tela Perfil de Acesso
        Given Clicar na lupa do campo Credencial
        Given Selecionar o checkbox da primeira Credencial
        Given Clicar no botão 'Ok' da tela de Credencial Disponível
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem 'Campo inválido' no campo Validade

    @verifyBiometricFaceScreen
    Scenario: verifyBiometricFaceScreen
        Given Que esteja na tela de cadastro de Visitante
        When Clicar no botão de Captura de Foto
        Then Deve exibir a tela de Captura de Foto


    @verifyBiometricFingerScreen
    Scenario: verifyBiometricFingerScreen
        Given Que esteja na tela de cadastro de Visitante
        When Clicar no botão de Captura de Biometria
        Then Deve exibir a tela de Captura de Biometria

    @verifyDocPhotoCaptureScreen
    Scenario: verifyDocPhotoCaptureScreen
        Given Que esteja na tela de cadastro de Visitante
        When Clicar no botão de Captura de Documento
        Then Deve exibir a tela de Captura de Documento

     @verifyCredencialAlreadyInUse
    Scenario: verifyCredencialAlreadyInUse
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Documento com '132'
        Given Preencher o campo Nome da tela de Visitante com 'teste'
        Given Clicar na lupa de Contato
        Given Preencher o campo Nome com 'Pessoa 1'
        Given Clicar no botão 'Buscar' na tela de Busca Avançada
        Given Selecionar o checkbox da 'Pessoa 1'
        Given Clicar no botão 'Ok' na tela de Busca Avançada
        Given Clicar na lupa do campo Perfil de Acesso
        Given Selecionar o checkbox do primeiro Perfil de Acesso
        Given Clicar no botao 'Ok' da tela Perfil de Acesso
        Given Preencher a credencial com '11'
        Given Preencher o campo de horas com '12:00'
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem na tela '- Esta credencial está em uso no sistema e não pode ser vinculada'

    @verifyRegisteredFace
    Scenario: verifyRegisteredFace
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Documento com '1'
        When Clicar no botão 'Buscar' na tela de cadastro de Visitante
        Then Deve apresentar a face do usuário cadastrada

    @verifyRegisteredFinger
    Scenario: verifyRegisteredFinger
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Documento com '1'
        Given Clicar no botão 'Buscar' na tela de cadastro de Visitante
        When Clicar no botão de Captura de Biometria
        Then Deve apresentar a biometria cadastrada

    @verifySearchInvalidName
    Scenario: verifySearchInvalidName
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar na lupa do campo Nome
        Given Preencher o campo Nome da tela de busca com '5000'
        When Clicar no botão 'Buscar' na tela de Busca de Visitante
        Then Deve aprsentar a mensagem 'Nenhum resultado foi encontrado'

    @verifySearchName
    Scenario: verifySearchName
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar na lupa do campo Nome
        Given Preencher o campo Nome da tela de busca com 'Visitante 1'
        Given Clicar no botão 'Buscar' na tela de Busca de Visitante
        Given Clicar no checkbox do Visitante Um
        When Clicar no botão 'Ok' da tela de busca
        Then Deve aparecer o Nome 'Visitante 1 para testes de Automação' na tela de cadastro de Visitante

    @verifyComboboxValidade
    Scenario Outline: verifyComboboxValidade
        Given Que esteja na tela de cadastro de Visitante
        When Clicar no combobox do campo Validade
        Then Deve apresentar os valores: "<validade_output>"

        Examples:
        |validade_output|
        |Horas|
        |Dias|
 
 
 @verifySaveNewVisitor
    Scenario: verifySaveNewVisitor
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '132'
        Given Preencher o campo Nome na tela de Visitante com 'Automação Visitante'
        Given Clicar na lupa de Contato
        Given Preencher o campo Nome com 'Pessoa 1 outra estrutura'
        Given Clicar no botão 'Buscar' na tela de Busca Avançada
        Given Selecionar o checkbox da 'Pessoa 1 outra estrutura'
        Given Clicar no botão 'Ok' na tela de Busca Avançada
        Given Clicar na lupa do campo Perfil de Acesso
        Given Selecionar o checkbox do primeiro Perfil de Acesso
        Given Clicar no botao 'Ok' da tela Perfil de Acesso
        Given Clicar na lupa do campo Credencial
        Given Selecionar o checkbox da primeira Credencial
        Given Clicar no botão 'Ok' da tela de Credencial Disponível
        Given Preencher o campo de horas com '12:00'
        When Clicar no botão Salvar na tela de cadastro
        Then Deve exibir a mensagem de cadastro com sucesso 'Visitante salvo com sucesso'
        
