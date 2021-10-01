
@login
Feature: Login
    Como um usuário do sistema DMPAccessII / MDAcesso
    Realizar o login no sistema
    Para ter acesso às funcionalidades de usuário logado

    Background:
        Given que o usuário "Admin" tem permissão

    @invalidUser
    Scenario: invalidUser
        Given que estou na página de login do sistema
        And que preenchi as informações inválidas
        When ao clicar no botão "Entrar"
        Then uma mensagem de erro é apresentada

    @invalidPass
    Scenario: invalidPass
        Given que estou na página de login do sistema
        And informei um usuário válido
        And informei a senha incorreta
        When ao clicar no botão "Entrar"
        Then uma mensagem de erro é apresentada
        
    @correctLogin
    Scenario: correctLogin
        Given que estou na página de login do sistema
        And que preenchi as informações válidas
        When ao clicar no botão "Entrar"
        Then o título da página deve ser "DMP Access II - Sistema de Controle de Acesso"