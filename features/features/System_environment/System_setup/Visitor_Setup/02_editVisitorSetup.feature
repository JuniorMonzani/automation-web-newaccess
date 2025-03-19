@editVisitorSetup
Feature: Edit Visitor Setup
    Como um usuário do sistema que tenha permissão para alterar as configurações de sistema.

    Background:
        Given Que o usuário esteja na aba de Visitante na tela de Configurações de Sistema.

    @editaditionalfield1
    Scenario: editaditionalfield1
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o primeiro campo adicional com ''
        Given Desmarcar o checkbox 'Campo obrigatório' do primeiro campo obrigatório
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editaditionalfield2
    Scenario: editaditionalfield2
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o segundo campo adicional com ''
        Given Desmarcar o checkbox 'Campo obrigatório' do segundo campo obrigatório
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editaditionalfield3
    Scenario: editaditionalfield3
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o terceiro campo adicional com ''
        Given Desmarcar o checkbox 'Campo obrigatório' do terceiro campo obrigatório
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editaditionalfield4
    Scenario: editaditionalfield4
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o quarto campo adicional com ''
        Given Desmarcar o checkbox 'Campo obrigatório' do quarto campo obrigatório
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


    @removeDefaultAccessProfile
    Scenario: removeDefaultAccessProfile
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Clicar no botão remover do perfil padrão
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @removeDefaultVisitTime
    Scenario: removeDefaultVisitTime
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given When Preencher o campo Tempo Padrão de visita com '00:00'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @removeDefaultSortPercent
    Scenario: removeDefaultSortPercent
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o campo de Porcentagem de Sorteio com '0'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


    @removeContactCheckbox
    Scenario: removeContactCheckbox
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox do campo Permitir digitação do campo contato
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @removeAvailableVehicleCheckbox
    Scenario: removeAvailableVehicleCheckbox
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox do campo Disponibilizar cadastro de veículo
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @removeIncludeVisitBlocked
    Scenario: removeIncludeVisitBlocked
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox do campo Incluir visita bloqueada
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @removeIncludeContactRegist
    Scenario: removeIncludeContactRegist
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox do campo Incluir a matricula no campo contato
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


    @removeCheckboxTagPrint
    Scenario: removeCheckboxTagPrint
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox Disponibilizar impressão de etiqueta
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


    @removeFieldTasyIntegration
    Scenario: removeFieldTasyIntegration
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Desmarcar o checkbox Integração Tasy
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'
