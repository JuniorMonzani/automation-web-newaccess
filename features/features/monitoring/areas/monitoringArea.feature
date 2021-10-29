#Sprint 3
#Feature referente ao issue: #32
#Autor: @JuniorMonzani

@monitoringArea
Feature: Monitoring Area
    Como um usuário do sistema que tenha permissão para acessar a Monitoração de Áreas.

    Background:
        Given Que o usuário esteja na página de monitoração da área.

        @verifyResourcesMonitoringArea
        Scenario: verifyResourcesMonitoringArea
            Given Que eu verifico e comparo todos os resources dos campos apresentados na tela de monitoração de área.

        @confirmCurrentAreaMonitoringTime
        Scenario: confirmCurrentAreaMonitoringTime
            Given Que eu obtenha a data/hora apresentados na tela de monitoração de área (cloud).
            Then A data/hora devem estar próximas da data/hora atual da máquina onde o teste é executado (local).

        @verifySameDateHourMonitoringAreaUpdateScreen
        Scenario: verifySameDateHourMonitoringAreaUpdateScreen
            Given Que ao acessar a tela de monitoração de área eu obtenha a data e hora que a 'monitoração foi iniciada' e a 'última atualização da tela'.
            Then A data e hora que a 'monitoração foi iniciada' deve bater exatamente com a 'última atualização da tela' (dd/mm/aaaa hh:mm).

        @verifyBackButtonMonitoringArea
        Scenario: verifyBackButtonMonitoringArea
            Given Que eu clique no botão 'Voltar' da página de monitoração de área.
            Then O usuário deve ser direcionado para a tela de seleção da área a ser monitorada.

        @verifyUpdateButtonMonitoringArea
        Scenario: verifyUpdateButtonMonitoringArea
            Given Que eu clique no botão 'Atualizar' da página de monitoração de área.
            Then O horário de última atualização da tela de monitoração de área deve ser alterado.


