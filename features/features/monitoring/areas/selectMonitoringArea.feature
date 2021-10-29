#Sprint 3
#Feature referente ao issue: #32
#Autor: @JuniorMonzani

@selectMonitoringArea
Feature: Select Monitoring Area
    Como um usuário do sistema que tenha permissão para acessar a Monitoração de Áreas.

    Background:
        Given Que o usuário esteja na página para selecionar a área a ser monitorada.

   @verifyResourcesSelectMonitoringArea
   Scenario: verifyResourcesSelectMonitoringArea
        Given Que eu verifico e comparo todos os resources dos campos apresentados na tela de seleção da área para monitoração.
   
    @checkFieldValues​​SelectArea
    Scenario: checkFieldValues​​SelectArea
        Given Que obtenha os valores apresentados no dropBox 'Selecuina a área'.
        Then Os valores apresentados tem que ser extamente iguais aos valores esperados, área 'Dentro' e 'Fora'.

    @uncheckAutomaticallyUpdaet
    Scenario: uncheckAutomaticallyUpdaet
        Given Que eu desmarque o checkbox 'Automatically update the screen information'.
        When Clicar no botão 'Monitorar'.
        Then a página de monitoração apresentada não pode conter o contador para atualização da página, indicando que não será atualizada.
