@registerVisitorSetup
Feature: Register Visitor Setup
    Como um usuário do sistema que tenha permissão para alterar as configurações de sistema.

    Background:
        Given Que o usuário esteja na aba de Visitante na tela de Configurações de Sistema.

    @verifyComboxCampoAdicional1
    Scenario: verifyComboxCampoAdicional1
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Clicar no combobox do primeiro campo adicional
        Then Deve apresentar os valores 'Alfanumérico', 'Verdadeiro/Falso', 'Numérico', 'Data/Hora', 'Hora', 'Data', 'E-mail'

    @verifyComboxCampoAdicional2
    Scenario: verifyComboxCampoAdicional2
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Clicar no combobox do segundo campo adicional
        Then Deve apresentar os valores 'Alfanumérico', 'Verdadeiro/Falso', 'Numérico', 'Data/Hora', 'Hora', 'Data', 'E-mail'

    @verifyComboxCampoAdicional3
    Scenario: verifyComboxCampoAdicional3
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Clicar no combobox do terceiro campo adicional
        Then Deve apresentar os valores 'Alfanumérico', 'Verdadeiro/Falso', 'Numérico', 'Data/Hora', 'Hora', 'Data', 'E-mail'

    @verifyComboxCampoAdicional4
    Scenario: verifyComboxCampoAdicional4
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Clicar no combobox do quarto campo adicional
        Then Deve apresentar os valores 'Alfanumérico', 'Verdadeiro/Falso', 'Numérico', 'Data/Hora', 'Hora', 'Data', 'E-mail'


    @saveaditionalfield1
    Scenario: saveaditionalfield1
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o primeiro campo adicional com '1TesteAutomaçãoAdicional'
        Given Selecionar o tipo 'Alfanumérico' no primeiro campo adicional
        Given Marcar o checkbox 'Campo obrigatório'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @saveaditionalfield2
    Scenario: saveaditionalfield2
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o segundo campo adicional com '2TesteAutomaçãoAdicional'
        Given Selecionar o tipo 'Verdadeiro/Falso' no segundo campo adicional
        Given Marcar o checkbox 'Campo obrigatório' no segundo campo adicional
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @saveaditionalfield3
    Scenario: saveaditionalfield3
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o terceiro campo adicional com '3TesteAutomaçãoAdicional'
        Given Selecionar o tipo 'Data/Hora' no terceiro campo adicional
        Given Marcar o checkbox 'Campo obrigatório' no terceiro campo adicional
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @saveaditionalfield4
    Scenario: saveaditionalfield4
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o quarto campo adicional com '4TesteAutomaçãoAdicional'
        Given Selecionar o tipo 'E-mail' no quarto campo adicional
        Given Marcar o checkbox 'Campo obrigatório' no quarto campo adicional
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @verifyMessageAltTypeAditionalField1
    Scenario: verifyMessageAltTypeAditionalField1
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Alterar o valor para 'E-mail' no primeiro campo adicional
        Then Deve apresentar a mensagem 'Caso o tipo do campo adicional seja modificado os dados deste serão limpos!'

    @verifyMessageAltTypeAditionalField2
    Scenario: verifyMessageAltTypeAditionalField2
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Alterar o valor para 'E-mail' no segundo campo adicional
        Then Deve apresentar a mensagem 'Caso o tipo do campo adicional seja modificado os dados deste serão limpos!'

    @verifyMessageAltTypeAditionalField3
    Scenario: verifyMessageAltTypeAditionalField3
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Alterar o valor para 'E-mail' no terceiro campo adicional
        Then Deve apresentar a mensagem 'Caso o tipo do campo adicional seja modificado os dados deste serão limpos!'

    @verifyMessageAltTypeAditionalField4
    Scenario: verifyMessageAltTypeAditionalField4
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Alterar o valor para 'Numérico' no quarto campo adicional
        Then Deve apresentar a mensagem 'Caso o tipo do campo adicional seja modificado os dados deste serão limpos!'


    @verifyLengthAditionalField1
    Scenario: verifyLengthAditionalField1
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do primeiro campo 'Rotulo do campo 1'
        Then O tamanho do primeiro campo deve ser '15'

    @verifyLengthAditionalField2
    Scenario: verifyLengthAditionalField2
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do segundo campo 'Rotulo do campo 2'
        Then O tamanho do segundo campo deve ser '15'


    @verifyLengthAditionalField3
    Scenario: verifyLengthAditionalField3
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do terceiro campo 'Rotulo do campo 3'
        Then O tamanho do terceiro campo deve ser '15'

    @verifyLengthAditionalField4
    Scenario: verifyLengthAditionalField4
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do quarto campo 'Rotulo do campo 4'
        Then O tamanho do quarto campo deve ser '15'

    @editDefaultAccessProfile
    Scenario: editDefaultAccessProfile
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Clicar na lupa do Perfil de acesso padrão
        Given Clicar no checkbox do primeiro perfil de acesso
        Given Clicar no botão de 'Ok'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editDefaultVisitTime
    Scenario: editDefaultVisitTime
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given When Preencher o campo Tempo Padrão de visita com '01:00'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editDefaultSortPercent
    Scenario: editDefaultSortPercent
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o campo de Porcentagem de Sorteio com '999'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @verifyLengthSortPercent
    Scenario: verifyLengthSortPercent
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When  Obter o tamanho do campo 'Porcentagem de Sorteio'
        Then O tamanho deve ser '2'

    @editContactCheckbox
    Scenario: editContactCheckbox
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox do campo 'Permitir digitação do campo contato'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editAvailableVehicleCheckbox
    Scenario: editAvailableVehicleCheckbox
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox do campo Disponibilizar cadastro de veículo
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editIncludeVisitBlocked
    Scenario: editIncludeVisitBlocked
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox do campo Incluir visita bloqueada
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @editIncludeContactRegist
    Scenario: editIncludeContactRegist
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox do campo Incluir a matricula no campo contato
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


     @verifyCheckboxTagPrint
    Scenario: verifyCheckboxTagPrint
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox Disponibilizar impressão de etiqueta
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'


    @verifyComboboxPrintTemplate
    Scenario: verifyComboboxPrintTemplate
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter os valores do combobox modelos de impressão
        Then Os valores devem ser: 'Deskjet', 'PIMACO', 'Todas', 'Zebra', 'PIMACO SLP650', 'D-Print'
    
   
    @editLabelFreeField
    Scenario: editLabelFreeField
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Preencher o campo livre para etiqueta com 'Campo de Etiqueta Teste Automação IIIIIIIIIIIIIIIIIIIIIIIIIII'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @verifyLengthLabelFreeField
    Scenario: verifyLengthLabelFreeField
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do campo livre para etiqueta
        Then O tamanho do campo livre para etiqueta deve ser '50'

    @verifyComboBoxPrintMode
    Scenario: verifyComboBoxPrintMode
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter os valores do campo Modo de impressão
        Then OS valores devem ser 'Perguntar antes de imprimir', 'Não imprimir automaticamente', 'Imprimir automaticamente'

    @editFieldTasyIntegration
    Scenario: editFieldTasyIntegration
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        Given Marcar o checkbox Integração Tasy
        Given Preencher o campo endereço com 'Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy - Teste automação integração Tasy'
        When Clicar no botão 'Salvar'
        Then Deve apresentar a mensagem 'Configurações de sistema salva com sucesso!'

    @verifyLengthTasyIntegration
    Scenario: verifyLengthTasyIntegration
        Given Que esteja na aba de Visitante da tela de Configurações de Sistema
        When Obter o tamanho do campo endereço
        Then O tamanho do campo Integração Tasy deve ser '255'
