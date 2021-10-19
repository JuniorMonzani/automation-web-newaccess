require 'login/login'
require 'areas/Areas'
require 'common/findElements'
require 'common/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Áreas objetivando exclusão.') do
      areas.visit_List_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyValuesFilterSearchArea
      Given('Desmarco a flag 10 últimas atualizações_01.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Encontro o dropbox de filtro da pesquisa e comparo com o valores esperados.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Deve conter todos os valores esperados.') do
        expect(page).to have_content('Alterar Área')
      end