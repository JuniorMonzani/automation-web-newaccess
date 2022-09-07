#20
@editCommunicationManager
Feature: Edit Communication Manager
    Como um usuário do sistema que tenha permissão para Editar Gerenciadores de Comunicação.
    
    Background:
        Given Que o usuário esteja na página que lista os Gerenciadores de Comunicação cadastrados.

        @verifyValuesDropBoxSearchCommManager
        Scenario: verifyValuesDropBoxSearchCommManager
            Given teste
            When teste
            Then teste
            

    #ALTERAÇÃO NO GERENCIADOR CLIENT
        @verifyEditCommManagerSameDescription
        Scenario: verifyEditCommManagerSameDescription
            Given Preencher os campos "Descrição", "Nome da máquina" e "Porta".
            And Selecionar o tipo de gerenciador para "Server".
            And Acessar a aba "Alertas"_02.
            And Marcar todas as opções (checkBox) da aba de Portas Seriais_02.
            And inserir o email "teste@teste.com" no campo "E-mails para notificação"_2.
            When Clicar em "Salvar" para salvar um Gerenciador de Comunicação do tipo Server.
            Then Validar se o Gerenciador de Comunicação server foi salvo com sucesso.




    #ALTERAÇÃO NO GERENCIADOR SERVER




    #ALTERAÇÃO NO GERENCIADOR EXP/IMP