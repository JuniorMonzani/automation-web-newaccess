#Sprint 4
#Feature referente ao issue: #
#Autor: @JuniorMonzani

require 'login/login'
require 'monitoring/area/monitoringArea'
require 'common/findElements'
require 'common/constants'

monitoringArea = MonitoringArea.new
findElements = FindElements.new
login = Login.new

#background
  Given('Que o usuário esteja na página para selecionar a área a ser monitorada.') do
    monitoringArea.visit_Monitoring_Area
      login.make_Login('admin', $password)
  end

  #verifyResourcesSelectMonitoringArea
    Given('Que eu verifico e comparo todos os resources dos campos apresentados na tela - Monitoração de áreas.') do
      expect(page).to have_content('Monitorar Áreas')
      expect(page).to have_content('Selecione a área')
      expect(page).to have_content('Atualizar automaticamente as informações da tela')
      expect(page).to have_content('Monitorar')
    end

  #checkFieldValues​​SelectArea
    Given('Que obtenha os valores apresentados no dropBox "Selecione a área".') do
      $valueSelectAreaMonitoringAreas = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlSelectArea', $SELECT_AREA_MONITORING_AREAS)
    end

    Then('Os valores apresentados tem que ser extamente iguais aos valores esperados, área "Dentro" e "Fora".') do
      expect($valueSelectAreaMonitoringAreas).to be_truthy
    end

  #uncheckAutomaticallyUpdaet
    Given('Que eu desmarque o checkbox "Atualizar automaticamente as informações da tela".') do
      uncheck('MainContentMainMaster_MainContent_chkAutomaticUpdate')
    end

    When('Clicar no botão "Monitorar".') do
      click_button 'Monitorar'
      sleep 1
    end

    Then("A página de monitoração apresentada não pode conter o contador para atualização da página, indicando que não será atualizada.") do
      verifyElement = monitoringArea.verify_Exsists_Element('MainContentMainMaster_MainContent_lblTimer')
      expect(verifyElement).to be(false)
    end