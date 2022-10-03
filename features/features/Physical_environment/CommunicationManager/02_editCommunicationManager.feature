#20
@editCommunicationManager
Feature: Edit Communication Manager
    Como um usuário do sistema que tenha permissão para Editar Gerenciadores de Comunicação.
    
    Background:
        Given Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.

        @verifyValuesDropBoxSearchCommManager
        Scenario: verifyValuesDropBoxSearchCommManager
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            When Obter os valores presentes no combobox de pesquisa.
            Then Os valores presentes devem ser os mesmos valores esperados.

        @verifyMaxSizeTextBoxSearchCommManager
        Scenario: verifyMaxSizeTextBoxSearchCommManager
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Preencho o máximo de caracteres possíveis no campo textbox de pesquisa.
            When Obtenho do textbox o total de caracteres inseridos.
            Then A quantidade de caracteres deve ser igual a 50.

        @SearchCommManagerNotExsists
        Scenario: SearchCommManagerNotExsists
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Preencho o campo de pesquisa com uma descrição de gerenciador que não existe.
            When Clico no botão Buscar.
            Then Nenhum gerenciador de comunicação deve ser encontrado, confirmando o resource em tela: "Nenhum resultado foi encontrado".

        @SearchByDescription
        Scenario: SearchByDescription
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Preencho o campo de pesquisa com uma descrição de gerenciador que existe.
            When Clico no botão Buscar.
            Then Um gerenciador de comunicação deve ser encontrado coma descrição informada.

        @SearchByCommunicationService
        Scenario: SearchByCommunicationService
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que altere o tipo de pesquisa para "Serviço de Comunicação".
            And Preencho o campo de pesquisa com um serviço de comunicação que existe.
            When Clico no botão Buscar.
            Then Um gerenciador de comunicação deve ser encontrado com o serviço de comunicação informado.

        @verifyValuesRegisterCommunicationManagerClient
        Scenario: verifyValuesRegisterCommunicationManagerClient
            Given Acessar o cadastro do Gerenciador Client realizado pela automação.
            Then Validar todos os valores esperados que foram cadastrados (inclusive checkbox que foram marcados) nos campos do Gerenciador client. 

        @verifyValuesRegisterCommunicationManagerServer
        Scenario: verifyValuesRegisterCommunicationManagerServer
            Given Acessar o cadastro do Gerenciador Server realizado pela automação.
            Then Validar todos os valores esperados que foram cadastrados (inclusive checkbox que foram marcados) nos campos do Gerenciador server. 

        @verifyValuesRegisterCommunicationManagerExpImp
        Scenario: verifyValuesRegisterCommunicationManagerExpImp
            Given Acessar o cadastro do Gerenciador Exp/Imp realizado pela automação.
            Then Validar todos os valores esperados que foram cadastrados (inclusive checkbox que foram marcados) nos campos do Gerenciador Exp/Imp. 

        @AlterCommunicationServiceDescriptionRequired
        Scenario: AlterCommunicationServiceDescriptionRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Client cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Descrição".
            And Clico no botão Salvar.
            Then O campo Descrição deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServiceMachineNameRequired
        Scenario: AlterCommunicationServiceMachineNameRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Client cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Nome da máquina".
            And Clico no botão Salvar.
            Then O campo Nome da máquina deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServicePortRequired
        Scenario: AlterCommunicationServicePortRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Client cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Porta".
            And Clico no botão Salvar.
            Then O campo Porta deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServiceTypeServerIpAddressRequired
        Scenario: AlterCommunicationServiceTypeServerIpAddressRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Server cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Endereço IP".
            And Clico no botão Salvar.
            Then O campo Endereço IP deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServiceTypeServerPortRequired
        Scenario: AlterCommunicationServiceTypeServerPortRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Server cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Porta".
            And Clico no botão Salvar.
            Then O campo Porta do gerenciador server deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServiceTypeServerEncryptionKeyRequired
        Scenario: AlterCommunicationServiceTypeServerEncryptionKeyRequired
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Server cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Limpar o campo "Chave de criptografia".
            And Clico no botão Salvar.
            Then O campo Chave de criptografia deve sinalizar que é obrigatório e deve-se validar o texto apresentado.

        @AlterCommunicationServiceSameDescription
        Scenario: AlterCommunicationServiceSameDescription
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação client cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When No campo "Descrição" informar uma descrição já cadastrada para um gerenciador.
            And Clico no botão Salvar.
            Then Validar a mensagem apresentada impedindo de salvar um gerenciador com o mesmo nome.

        @AlterCommunicationServiceSamePortServer
        Scenario: AlterCommunicationServiceSamePortServer
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação server cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When No campo "Porta" do modo server, informar uma porta já cadastrada para um gerenciador server.
            And Clico no botão Salvar.
            Then Validar a mensagem apresentada impedindo de salvar um gerenciador com o mesmo número de porta server.

        @AlterCommunicationServiceServerToClient
        Scenario: AlterCommunicationServiceServerToClient
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre o gerenciador server "Minha Maquina Server".
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When ALterar o campo "Tipo do gerenciador" para Client.
            And Clico no botão Salvar.
            Then Validar a mensagem apresentada impedindo de alterar o tipo de gerenciador server que já está em uso.

        @AlterCommunicationServiceClientToServer
        Scenario: AlterCommunicationServiceClientToServer
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre o gerenciador client "Minha Maquina Client".
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When ALterar o campo "Tipo do gerenciador" para Server.
            And Clico no botão Salvar.
            Then Validar a mensagem apresentada impedindo de alterar o tipo de gerenciador client que já está em uso.

        @AlterCommunicationServiceAlerts
        Scenario: AlterCommunicationServiceAlerts
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador que tenha todos os campos da aba Alertas preenchidos.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            And Acessar a aba "Alertas".
            When Desmarcar todos os checkbox e limpar o campo de email.
            And Clico no botão Salvar.
            Then Deve permntir salvar o gerenciador desmarcando todos os campos da aba Alerta.

        @AlterCommunicationServiceSerialPorts
        Scenario: AlterCommunicationServiceSerialPorts
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador que tenha todos os campos da aba Portas Seriais preenchidos.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            And Acessar a aba "Portas Seriais".
            When Desmarcar todos os checkbox.
            And Clico no botão Salvar.
            Then Deve permntir salvar o gerenciador desmarcando todos os campos da aba Portas Seriais.

    #ALTERAÇÃO NO GERENCIADOR CLIENT
        @verifyEditCommunicationManagerClient
        Scenario: verifyEditCommunicationManagerClient
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Client cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Alterar o campo "Descrição", "Nome da máquina" e "Porta".
            And Clico no botão Salvar.
            Then Validar se o Gerenciador de Comunicação client foi salvo com sucesso.

    #ALTERAÇÃO NO GERENCIADOR SERVER
        @verifyEditCommunicationManagerServer
        Scenario: verifyEditCommunicationManagerServer
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador de comunicação Server cadastrado pela automação.
            And Entre no cadastro desse gerenciador para alteração clicando no botão Alterar.
            When Alterar o campo "Endereço IP", "Porta do servidor" e "Chave de criptografia".
            And Clico no botão Salvar.
            Then Validar se o Gerenciador de Comunicação server foi salvo com sucesso.