@about
Feature: Sobre o Sistema
    Realiza validações na página Sobre o Sistema.

    Background:
        Given Que o usuário esteja na página Sobre o Sistema.

    @verifyResourcesAboutSystem
    Scenario Outline: verifyResourcesAboutSystem
        Given Que o usuário esteja na página Sobre o Sistema.
        Then Comparar os resources apresentados com os esperados na página Sobre o Sistema.

    