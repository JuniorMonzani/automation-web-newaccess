require 'login/login'
require 'physical_environment/areas/Areas'
require 'common/findElements'
require 'common/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Áreas objetivando cópia.') do
      areas.visit_List_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyCopyAreas
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_01 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de Cópia da Área_01 objetivando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Deve direcionar para a página de alteração de Área_01.') do
        expect(page).to have_content('Cadastrar Área')
      end

    @verifyNumberCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_02 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de Cópia da Área_02 objetivando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, a textbox "Número" não deve conter valor.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaNumber').value).to eql('')
      end

    @verifyDescriptionCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_03 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de Cópia da Área_03 objetivando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, a textbox "Descrição" não deve conter valor.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaDescription').value).to eql('')
      end

    @verifyCapacityCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_04 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de Cópia da Área_04 objetivando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, a textbox "capacidade" não deve conter valor.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').value).to eql('')
      end

    @verifyDisableCheckboxCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_05 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      When('Eu clico no ícone de Cópia da Área_05 objetivando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, todos os checkbox devem estar desmarcados assim como na área que foi copiada.') do
        #Verificação controla capacidade desmarcada
        expect(find('#MainContentMainMaster_MainContent_cbxCapacityControl').checked?).to be(false)
        #Verificação demais checkbox
        expect(find('#MainContentMainMaster_MainContent_cbxUpdateArea').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxBlocked').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxReentry').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxBreakSeq').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxControlQtdGroup').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainProvCred').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxRequiresAuthorizer').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthCred').checked?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_cbxRetainCredAuthVisitor').checked?).to be(false)
      end

    @verifyEnableCheckboxCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_06 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      And('Eu clico no ícone de Alteração da Área_06 objetivando edição.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      And('Ao abrir a página de alteração da área, marcar todos os checkbox do cadastro.') do
        check('MainContentMainMaster_MainContent_cbxCapacityControl')
        
        check('MainContentMainMaster_MainContent_cbxUpdateArea')
        check('MainContentMainMaster_MainContent_cbxBlocked')
        check('MainContentMainMaster_MainContent_cbxReentry')
        check('MainContentMainMaster_MainContent_cbxBreakSeq')
        check('MainContentMainMaster_MainContent_cbxControlQtdGroup')
        check('MainContentMainMaster_MainContent_cbxRetainProvCred')
        check('MainContentMainMaster_MainContent_cbxRequiresAuthorizer')
        check('MainContentMainMaster_MainContent_cbxRetainCredAuthCred')
        check('MainContentMainMaster_MainContent_cbxRetainCredAuthVisitor')
      end

      And('Preencher o campo Capacidade com "99999" objetivando cópia.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAreaCapacity', $REGISTER_AREAS_CAPACITY)
      end

      And('Clicar em Salvar_06.') do
        click_button 'Salvar'
        sleep 0.3
      end

      And('Que eu faça a busca e encontre a Área cadastrada pela automação_06.1.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end

      When('Eu clico no ícone de Cópia da Área_06 objetiando cópia.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, todos os checkbox devem estar marcados assim como na área que foi copiada.') do
        #Verificação controla capacidade desmarcada
        expect(find('#MainContentMainMaster_MainContent_cbxCapacityControl').checked?).to be(true)
        #Verificação demais checkbox
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

      And('O campo "Capacidade" deve estar habilitado e conter o valor cadastrado.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').disabled?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').value).to eql($REGISTER_AREAS_CAPACITY)
      end