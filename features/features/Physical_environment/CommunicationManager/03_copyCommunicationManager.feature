@copyCommunicationManager
Feature: Copy Communication Manager
    Como um usuário do sistema que tenha permissão para Copiar um Gerenciadores de Comunicação.
    
    Background:
        Given Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.

        @verifyValuesCopyCommunicationManagerClient
        Scenario: verifyValuesCopyCommunicationManagerClient
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador Client que tenha a aba de Alertas e Portas Seriais com os campos marcados.
            When Clicar no botão de cópia.
            Then O cadastro do gerenciador aberto deve exibir os mesmos dados do gerenciador copiado, como o "Tipo de gerenciador", "Nome da máquina", "Porta", os campos das abas "Alerta" e "Portas Seriais".

        @verifyValuesCopyCommunicationManagerServer
        Scenario: verifyValuesCopyCommunicationManagerServer
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador Server cadastrado pela automação.
            When Clicar no botão de cópia.
            Then O cadastro do gerenciador aberto deve exibir os mesmos dados do gerenciador server copiado, como o "Tipo de gerenciador", "Endereço IP", "Porta do server" e "Chave de Criptografia".

        @saveCopyCommunicationManagerClient
        Scenario: saveCopyCommunicationManagerClient
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador Client cadastrado pela automação.
            And Clicar no botão de cópia.
            When Preencher os campos obrigatórios para salvar um novo gerenciador client.
            And Clico no botão Salvar.
            Then O gerenciador client copiado deve ser salvo com sucesso.

        @saveCopyCommunicationManagerServer
        Scenario: saveCopyCommunicationManagerServer
            Given Que eu desmarque o checkbox "10 últimas atualizações".
            And Que pesquise e encontre um gerenciador Server cadastrado pela automação.
            And Clicar no botão de cópia.
            When Preencher os campos obrigatórios para salvar um novo gerenciador server.
            And Clico no botão Salvar.
            Then O gerenciador server copiado deve ser salvo com sucesso.