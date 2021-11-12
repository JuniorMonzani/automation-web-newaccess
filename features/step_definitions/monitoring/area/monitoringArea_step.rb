#Sprint 4
#Feature referente ao issue: #
#Autor: @JuniorMonzani

require 'login/login'
require 'monitoring/area/monitoringArea'
require 'common/findElements'

monitoringArea = MonitoringArea.new
login = Login.new

#background
  Given('Que o usuário esteja na página de monitoração da área.') do
    monitoringArea.visit_Monitoring_Area
    login.make_Login('admin', $password)
    sleep 0.3
    click_button 'Monitorar'
  end

  #verifyResourcesMonitoringArea
    Given('Que eu verifico e comparo todos os resources dos campos apresentados na tela de monitoração de área.') do
      expect(page).to have_content('Monitoração da área Dentro iniciada em')
      expect(page).to have_content('Pessoas/Credenciais/Visitantes na área')
      expect(page).to have_content('Quantidade: 0')
      expect(page).to have_content('Credencial')
      expect(page).to have_content('Nome')
      expect(page).to have_content('Matrícula')
      expect(page).to have_content('Tipo de credencial')
      expect(page).to have_content('Estrutura')
      expect(page).to have_content('Foto')
      expect(page).to have_content('Movimento de entrada')
      expect(page).to have_content('Movimento de saída')
      expect(page).to have_content('Status')
      expect(page).to have_content('Hora')
      expect(page).to have_content('Última atualização da tela -')
    end

  #confirmCurrentAreaMonitoringTime
    Given('Que eu obtenha a data e hora apresentadas na tela de monitoração de área "cloud".') do
      #obtem a data e hora do início da monitoração
      $dateTimeInitMonitoring = (find('#MainContentMainMaster_MainContent_lblHeader').text).sub(/Monitoração da área Dentro iniciada em /, "")
    end
  
    Then('A data e hora "data + hora e minuto" devem ser exatamente iguais à data atual "data + hora e minuto" atual da máquina onde o teste é executado "local".') do
      #obtem a data e hor atual e formata
      dateNow = (DateTime.now).strftime("%d/%m/%Y %H:%M")
      #compara se a data e hora do início da monitoração é ao 'dd/mm/aaa hh:mm' atual
      eql = ($dateTimeInitMonitoring.match? dateNow)
      expect(eql).to be(true)
    end

  #verifySameDateHourMonitoringAreaUpdateScreen
    Given('Que ao acessar a tela de monitoração de área eu obtenha a data e hora que a "monitoração foi iniciada" e a "última atualização da tela".') do
      $dateTimeInitMonitoring = (find('#MainContentMainMaster_MainContent_lblHeader').text).sub(/Monitoração da área Dentro iniciada em /, "")
      $lastUpdateScreen = find('#MainContentMainMaster_MainContent_lblDatetime').text
    end
  
    Then('A data e hora que a "monitoração foi iniciada" deve ser exatamente igual a "última atualização da tela".') do
      eql = $dateTimeInitMonitoring == $lastUpdateScreen
      expect(eql).to be(true)
    end

  #verifyBackButtonMonitoringArea
  Given('Que eu clique no botão "Voltar" da página de monitoração de área.') do
    click_button 'Voltar'
    sleep 0.3
  end

  Then('O usuário deve ser direcionado para a tela de seleção da área a ser monitorada.') do
    expect(page).to have_content('Selecione a área')
  end

  #verifyUpdateButtonMonitoringArea
  Given('Que eu clique no botão "Atualizar" da página de monitoração de área.') do
    $dateTimeInitMonitoring = (find('#MainContentMainMaster_MainContent_lblHeader').text).sub(/Monitoração da área Dentro iniciada em /, "")
    sleep 1
    click_button 'Atualizar'
    sleep 0.3
  end

  Then('O horário de última atualização da tela de monitoração de área deve ser alterado.') do
    lastUpdateScreen = find('#MainContentMainMaster_MainContent_lblDatetime').text
    eql = $dateTimeInitMonitoring == lastUpdateScreen
    expect(eql).to be(false)
  end