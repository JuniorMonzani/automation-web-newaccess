@registerAreas
Feature: Register Areas
    Como um usuário do sistema que tenha permissão para Cadastrar Áreas.

    Background:
        Given Que o usuário esteja na página de cadastro de Áreas.

    @verifyLabelsAreas
    Scenario: verifyLabelsAreas
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de áreas.