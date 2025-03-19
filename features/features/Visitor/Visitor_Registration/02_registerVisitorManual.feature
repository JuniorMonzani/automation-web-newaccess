@registerVisitorManual
Feature: Register Visitor
    Como um usuário do sistema que tenha permissão para Cadastrar Visitante.

    Background:
        Given Que o usuário esteja na página de cadastro de Visitante.

    @verifyFirstAditionalFieldName
    Scenario: verifyFirstAditionalFieldName
        Given Que esteja na tela de cadastro de Visitante
        When Obter o nome do primeiro campo adicional
        Then Deve ser o nome '1TesteAutomação' no primeiro campo

    @verifySecondAditionalFieldName
    Scenario: verifySecondAditionalFieldName
        Given Que esteja na tela de cadastro de Visitante
        When Obter o nome do segundo campo adicional
        Then Deve ser o nome '2TesteAutomação' no segundo campo

    @verifyThirdAditionalFieldName
    Scenario: verifyThirdAditionalFieldName
        Given Que esteja na tela de cadastro de Visitante
        When Obter o nome do terceiro campo adicional
        Then Deve ser o nome '3TesteAutomação' no terceiro campo

    @verifyFourthAditionalFieldName
    Scenario: verifyFourthAditionalFieldName
        Given Que esteja na tela de cadastro de Visitante
        When Obter o nome do quarto campo adicional
        Then Deve ser o nome '4TesteAutomação' no quarto campo

    @verifyFistAditionalFieldMandatory
    Scenario: verifyFistAditionalFieldMandatory
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o primeiro campo adicional na tela de cadastro de visitante com ''
        When Clicar no botão 'Salvar'
        Then Deve ver a mensagem 'Preencha o campo' no primeiro campo adicional

    @verifyThirdAditionalFieldMandatory
    Scenario: verifyThirdAditionalFieldMandatory
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o terceiro campo adicional na tela de cadastro de visitante com ''
        When Clicar no botão 'Salvar'
        Then Deve ver a mensagem 'Preencha o campo' no terceiro campo adicional

    @verifyForthAditionalFieldMandatory
    Scenario: verifyForthAditionalFieldMandatory
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o quarto campo adicional na tela de cadastro de visitante com ''
        When Clicar no botão 'Salvar'
        Then Deve ver a mensagem 'Preencha o campo' no quarto campo adicional


    @verifyDefaultAccessProfile
    Scenario: verifyDefaultAccessProfile
        Given Que esteja na tela de cadastro de Visitante
        When Obter o valor do campo Perfil de Acesso
        Then Deve ser o valor 'Perfil de Visitante'

    @verifyVisitorDefaultDuration
    Scenario: verifyVisitorDefaultDuration
        Given Que esteja na tela de cadastro de Visitante
        When Obter o valor do campo de Hora da Validade
        Then Deve ser o valor '01:00' no campo hora

    @verifyDefaultValueSortition
    Scenario: verifyDefaultValueSortition
        Given Que esteja na tela de cadastro de Visitante
        When Obter o valor do campo Porcentagem padrão de sorteio para visita
        Then Deve ser o valor '99' no campo porcentagem

    @verifyForthAdicionalFieldInvalid
    Scenario: verifyForthAdicionalFieldInvalid
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o quarto campo adicional na tela de Visitante com 'teste.teste'
        When Clicar no botão 'Salvar'
        Then Deve ver a mensagem no quarto campo 'E-mail inválido'

    @verifyForthAdicionalFieldInvalid2
    Scenario: verifyForthAdicionalFieldInvalid2
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o quarto campo adicional na tela de Visitante com 'teste@teste'
        When Clicar no botão 'Salvar'
        Then Deve ver a mensagem no quarto campo 'E-mail inválido'


    @saveNewVisitorAllFields
    Scenario: saveNewVisitorAllFields
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '133'
        Given Preencher o campo Nome na tela de Visitante com 'Alteração Configuração Visitante'
        Given Selecionar o checkbox na tela de Visitante 'Persona non grata'
        Given Preencher o campo Motivo persona non grata com 'Non grata'
        Given Preencher o campo Empresa com 'Empresa teste automação'
        Given Preencher os campos DDI, DDD e Celular com '55', '11', '999008800'
        Given Marcar o checkbox do segundo campo extras
        Given Preencher os campos extras com 'TestePreenchimentoManual', '01/01/2025 12:00:00', 'teste@preenchimento.com.br'
        Given Preencher o campo Contato com 'ContatoAutomação'
        Given Preencher o campo Credencial com '14'
        Given Clicar na lupa do campo Estrutura
        Given Preencher o campo de busca na tela de Estrutura com '1 Estrutura Teste 1'
        Given Clicar no botão 'Buscar' na tela de Estrutura
        Given Clicar no checkbox da Estrutura '1 Estrutura Teste 1'
        Given Clicar no botão 'OK' na tela de Busca de Estrutura
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem 'Imprimir Etiqueta'

    @saveNewFutureVisitor
    Scenario: saveNewFutureVisitor
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '134'
        Given Preencher o campo Nome na tela de Visitante com 'Agendamento de Visitante'
        Given Preencher o campo Empresa com 'Empresa teste automação'
        Given Preencher os campos DDI, DDD e Celular com '55', '11', '999008800'
        Given Marcar o checkbox do segundo campo extras
        Given Preencher os campos extras com 'TestePreenchimentoManual', '01/01/2030 12:00:00', 'teste@preenchimento.com.br'
        Given Preencher a Data da Visita com '01/01/2050'
        Given Preencher o campo Contato com 'ContatoAutomação'
        Given Preencher o campo Credencial com '15'
        Given Clicar na lupa do campo Estrutura
        Given Preencher o campo de busca na tela de Estrutura com '1 Estrutura Teste 1'
        Given Clicar no botão 'Buscar' na tela de Estrutura
        Given Clicar no checkbox da Estrutura '1 Estrutura Teste 1'
        Given Clicar no botão 'OK' na tela de Busca de Estrutura
        When Clicar no botão 'Salvar'
        Then Deve exibir a mensagem 'Imprimir Etiqueta'

    @verifyScheduleVisitDate
    Scenario: verifyScheduleVisitDate
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '134'
        Given Clicar no botão 'Buscar' na tela de Visitante
        When Clicar no botão 'Visita Agendada' na tela de Visitante Cadastrado
        Then Deve ver a data da visita como '01/01/2050'

    @verifyScheduleVisitInfo
    Scenario: verifyScheduleVisitInfo
        Given Que esteja na tela de cadastro de Visitante
        Given Preencher o campo Tipo de Documento com 'RG'
        Given Preencher o campo Documento com '134'
        Given Clicar no botão 'Buscar' na tela de Visitante
        When Clicar no botão 'Visita Agendada' na tela de Visitante Cadastrado
        Then Deve ver nos campos Contato, Estrutura e Porcentagem os valores 'ContatoAutomação', '1 Estrutura Teste 1', '99'

    @verifyRetainCredentialNotFound
    Scenario: verifyRetainCredentialNotFound
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar em 'Baixar Credencial' na tela de Visitante
        Given Preencher o campo Credencial e Até com '9999' e '9999'
        When Clicar no botão 'Buscar' na tela de Baixar Credencial
        Then Deve ver a mensagem 'Nenhum resultado foi encontrado' na tela de Baixar Credencial

    @verifySearchRetainCredentialByDate
    Scenario: verifySearchRetainCredentialByDate
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar em 'Baixar Credencial' na tela de Visitante
        Given Preencher o campo Data com '01/01/2050'
        When Clicar no botão 'Buscar' na tela de Baixar Credencial
        Then Deve ver a credencial '15'

    @verifySearchRetainCredentialByName
    Scenario: verifySearchRetainCredentialByName
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar em 'Baixar Credencial' na tela de Visitante
        Given Preencher o campo Nome com 'Agendamento de Visitante' na tela de Baixar Credencial
        When Clicar no botão 'Buscar' na tela de Baixar Credencial
        Then Deve ver a credencial '15'

    @retainCredential
    Scenario: retainCredential
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar em 'Baixar Credencial' na tela de Visitante
        Given Preencher o campo Nome com 'Agendamento de Visitante' na tela de Baixar Credencial
        Given Clicar no botão 'Buscar' na tela de Baixar Credencial
        Given Selecionar o checkbox da credencial '15'
        When Clicar no botão Baixar na tela de Baixar Credencial
        Then Deve ver a mensagem 'Credencial baixada com sucesso'

    @verifyCredencialRetained
    Scenario: verifyCredencialRetained
        Given Que esteja na tela de cadastro de Visitante
        Given Clicar em 'Baixar Credencial' na tela de Visitante
        Given Preencher o campo Credencial e Até com '15' e '15'
        When Clicar no botão 'Buscar' na tela de Baixar Credencial
        Then Deve ver a mensagem 'Nenhum resultado foi encontrado'

    @verifyAvailableCredencial
    Scenario: verifyAvailableCredencial
        Given Que esteja na tela de cadastro de Visitante
        When Clicar na lupa do campo Credencial
        Then Deve ver a credencial '15' Disponível







