require 'login/login'
require 'areas/Areas'
require 'commom/findElements'
require 'commom/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Áreas objetivando alteração.') do
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
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_01 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de alteração da Área_01 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Deve direcionar para a página de alteração de Área.') do
        expect(page).to have_content('Alterar Área')
      end

    @verifyFieldNumberOfAreaDisabled
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_02 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de alteração da Área_02 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Na tela de alteração de Área eu verifico o campo Número e o mesmo deve estar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaNumber').disabled?).to be(true)
      end

    @verifyDescriptionArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_03 objetivando alteração.') do
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
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_04 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_04 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('A capacidade deve ser exatamente a capacidade cadastrada para a Área.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').value).to eql($REGISTER_AREAS_CAPACITY)
      end
      
    @verifyNumberArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_05 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_05 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('O número da Área deve ser exatamente o mesmo cadastrado para a Área.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaNumber').value).to eql($REGISTER_AREAS_NUMBER)
      end

    @verifyCheckboxCheckedAreas
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_06 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_06 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('Na tela de alteração de Área eu verifico todos os checkbox que devem estar marcados.') do
        expect(find('#MainContentMainMaster_MainContent_cbxCapacityControl').checked?).to be(true)
        
        expect(find('#MainContentMainMaster_MainContent_cbxUpdateArea').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxBlocked').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxReentry').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxBreakSeq').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxControlQtdGroup').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainProvCred').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRequiresAuthorizer').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthCred').checked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthVisitor').checked?).to be(true)
      end

    @editAreasSuccess
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_07 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_07 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      And('Alterar a Descrição.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAreaDescription', 'Automação Áreas Edição')
      end

      And('Desmarcar todos os checkbox da tela.') do
        uncheck('MainContentMainMaster_MainContent_cbxUpdateArea')

        uncheck('MainContentMainMaster_MainContent_cbxUpdateArea')
        uncheck('MainContentMainMaster_MainContent_cbxBlocked')
        uncheck('MainContentMainMaster_MainContent_cbxReentry')
        uncheck('MainContentMainMaster_MainContent_cbxBreakSeq')
        uncheck('MainContentMainMaster_MainContent_cbxControlQtdGroup')
        uncheck('MainContentMainMaster_MainContent_cbxRetainProvCred')
        uncheck('MainContentMainMaster_MainContent_cbxRequiresAuthorizer')
        uncheck('MainContentMainMaster_MainContent_cbxRetainCredAuthCred')
        uncheck('MainContentMainMaster_MainContent_cbxRetainCredAuthVisitor')
      end

      And('Clicar no botão Salvar para salvar as alterações na Área.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('A Área deve ser salva com sucesso na edição.') do
        expect(page).to have_content('Área alterada com sucesso')
      end

    @verifyAreaAfterAChange
      Given('Que eu faça a busca pela nova descrição e encontre a Área alterada pela automação_08 objetivando alteração.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de alteração da Área_08 objetivando alteração.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then('A descrição deve ser a descrição Alterada e todos os checkbox devem estar desmarcados.') do
        #Verificação descrição
        expect(find('#MainContentMainMaster_MainContent_txtAreaDescription').value).to eql('Automação Áreas Edição')
        #Verificação controla capacidade desmarcada
        expect(find('#MainContentMainMaster_MainContent_cbxCapacityControl').unchecked?).to be(true)
        #Verificação capacidade desmarcada
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').disabled?).to be(true)
        #Verificação demais checkbox
        expect(find('#MainContentMainMaster_MainContent_cbxUpdateArea').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxBlocked').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxReentry').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxBreakSeq').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxControlQtdGroup').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainProvCred').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRequiresAuthorizer').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthCred').unchecked?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthVisitor').unchecked?).to be(true)
      end