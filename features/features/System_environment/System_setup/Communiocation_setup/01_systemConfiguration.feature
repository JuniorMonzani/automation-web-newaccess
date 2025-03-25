#encoding: UTF-8
@alterSystemConfiguration
Feature: Alter System Configuration
    Como um usuário do sistema que tenha permissão para a Configuração do Sistema.
    
    Background:
        Given Que o usuário esteja na página de Configuração do Sistema.

    @checkSynchronizePeople
    Scenario: checkSynchronizePeople
        Given Que eu encontre e marque o checkbox "Sincronizar dados de pessoas e credenciais".
        When Encontrar e marcar o checkbox "Sincronizar biometria de pessoas entre".
        And Inserir os valores nos campos "de" e "até".
        Then Clicar no botão Salvar.
    
    @unCheckSynchronizePeople
    Scenario: unCheckSynchronizePeople
        Given Que eu encontre e desmarque o checkbox "Sincronizar dados de pessoas e credenciais".
        When O checkbox "Sincronizar biometria de pessoas entre" deve ficar desativado.
        Then Clicar no botão Salvar.
