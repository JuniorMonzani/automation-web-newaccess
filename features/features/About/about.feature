@about
Feature: About System
    Realiza validações na página Sobre o Sistema.

    Background:
        Given Que o usuário esteja na página Sobre o Sistema.

    @verifyResourcesAboutSystem
    Scenario: verifyResourcesAboutSystem
        # Given Que o usuário esteja na página Sobre o Sistema.
        Then Comparar os resources apresentados com os esperados na página Sobre o Sistema.

    @verifyVersionsAbout
    Scenario: verifyVersionsAbout
        # Given Que o usuário esteja na página Sobre o Sistema.
        When Que obtenha os valores dos campos WebClient, Banco de Dados e Comunicação
        Then Os valores devem ser '3.31.3', '3.31.0' e '3.24.5'

    @verifyStatusAbout
    Scenario: verifyStatusAbout
        When Que obtenha o valor atual do Status
        Then O valor deve ser correspondente ao dia atual

    