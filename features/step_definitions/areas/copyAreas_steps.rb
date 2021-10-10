require 'login/login'
require 'areas/Areas'
require 'commom/findElements'
require 'commom/constants'

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

      Then('Ao abrir a página de cadastro da nova área, a capacidade deve ser "99999".') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').value).to eql($REGISTER_AREAS_CAPACITY)
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

    @verifyEnableCheckboxCopyArea
      Given('Que eu faça a busca e encontre a Área cadastrada pela automação_06 objetivando cópia.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearch', $REGISTER_AREAS_NUMBER)
        click_button 'Buscar'
        sleep 0.3
      end
        
      And('Eu clico no ícone de Alteração da Área_06 objetivando cópia.') do

      end

      And('Ao abrir a página de alteração da área, marcar todos os checkbox do cadastro.') do

      end

      And('Clicar em Salvar_06.') do
        click_button 'Salvar'
        sleep 0.3
      end

      And('Que eu faça a busca e encontre a Área cadastrada pela automação_06.1.') do

      end

      When('Eu clico no ícone de Cópia da Área_06.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_COPY_0"]').click
        sleep 0.3
      end

      Then('Ao abrir a página de cadastro da nova área, todos os checkbox devem estar marcados assim como na área que foi copiada.') do
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

      And('O campo "Capacidade" deve estar desabilitado.') do

      end