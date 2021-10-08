require 'login/login'
require 'areas/Areas'
require 'commom/findElements'
require 'commom/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Áreas cadastradas.') do
      areas.visit_List_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyResourcesListArea
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de edição de áreas.') do
        #uncheck('MainContentMainMaster_chkLastTenModified')
        expect(page).to have_content('Número')
        #findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlSearchField', 'Descrição')
        expect(page).to have_content('Descrição')
      end

    @verifyEditAreas
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_01.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de alteração da Área_01.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Deve direcionar para a página de alteração de Área.') do
        expect(page).to have_content('Alterar Área')
      end

    @verifyFieldNumberOfAreaDisabled
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_02.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de alteração da Área_02.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Na tela de alteração de Área eu verifico o campo Número e o mesmo deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaNumber').disabled?).to be(true)
      end

    @verifyDescriptionArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_03.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      Then('A descrição deve ser exatamente a descrição cadastrada para a Área.') do
        within('table tbody tr', text: 'Automação ÁreasXXXXXXXXXXXXXXX')
        @texto = find('td[align="center"]', text: 'Automação ÁreasXXXXXXXXXXXXXXX')
      end

    @verifyCapacityArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_04.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_04.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 1
      end

      Then('A capacidade deve ser exatamente a capacidade cadastrada para a Área.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').value).to eql($REGISTER_AREAS_CAPACITY)
      end