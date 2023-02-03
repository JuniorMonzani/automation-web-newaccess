require 'login/login'
require 'common/findElements'
require 'holiday/holidayElements'

login = Login.new
findElements = FindElements.new
holidayElements = Holiday.new

#@verifyValueDescriltionCopyHoliday
Given('Buscar e encontrar o feriado cadastrado pela automação com o mês {string}.') do |mes|
    find('#MainContentMainMaster_TableFiltersHolder_ddlMonthSearch').select mes
    click_button 'Buscar'
    sleep 3
  end
  
  When('Clicar no botão de cópia do feriado cadastrado pela automação.') do
    find('#MainContentMainMaster_MainContent_gv_Holiday_IMG_BUTTON_COPY_0').click
  end
  
  Then('O cadastro apresentado não deve ter valor no campo Descrição.') do
    expect(find('#MainContentMainMaster_MainContent_txtHolidayDescription')).to have_content ''
  end
  
  #@verifyValueDateCopyHoliday
  Then('O cadastro apresentado não deve ter valor no campo Data.') do
    expect(find('#MainContentMainMaster_MainContent_txtHolidayDate')).to have_content ''
  end
  
  #@verifyValueGroupCopyHoliday
  Then('O feriado deve ter associado o grupo {string}.') do |grupo|
    expect(find('#MainContentMainMaster_MainContent_lstEquipmentGroup_lstRight')).to have_content grupo
  end