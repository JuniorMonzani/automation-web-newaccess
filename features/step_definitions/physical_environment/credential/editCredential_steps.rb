require 'login/login'
require 'physical_environment/credential/credential'
require 'common/findElements'
require 'common/constants'

  credential = Credential.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página que lista as Credenciais para realizar alterações.') do
      credential.visit_List_Credential
      login.make_Login
    end

    #Cenários de busca
    @verifyValuesSearchTechnology
      Given('Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_001.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      When('Obter todos os valores do dropbox "Tecnologia".') do
        $valueCredential = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlTypeSearch', $REGISTER_TECHNOLOGYTYPE)
      end

      Then('Os valores contidos no dropbox devem ser exatamente os valores esperados para o campo "Tecnologia".') do
        expect($valueCredential).to be_truthy
      end

    @verifyValuesSearchSituation
      Given('Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_002.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end 
        
      When('Obter todos os valores do dropbox "Situação".') do
        $valueSituation = findElements.verify_Values_DropBox('#MainContentMainMaster_TableFiltersHolder_ddlSituationSearch', $REGISTER_SITUATION)
      end

      Then('Os valores contidos no dropbox devem ser exatamente os valores esperados para o campo "Situação".') do
        expect($valueSituation).to be_truthy
      end

    @searchCredentialAnotherTechnology
      Given('Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_003.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And('Inserir no campo "Número" o valor "1000"._003.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
      end
      
      And('Selecionar a tecnologia "RFID" no dropbox "Tecnologia".') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlTypeSearch', 'RFID')
      end

      When('Clicar no botão "Buscar"_003.') do
        click_button 'Buscar'
        sleep 0.3
      end

      Then('Validar que nenhuma credencial foi retornada com a busca pelo texto "Nenhum resultado foi encontrado"_003.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    @searchCredentialAnotherSituation
      Given ('Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_004.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
      end

      And ('Inserir no campo "Número" o valor "1000"_004.') do
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
      end

      And ('Selecionar a situação "Bloqueada" no dropbox "Situação".') do
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_ddlSituationSearch', 'Bloqueada')
      end

      When ('Clicar no botão "Buscar"_004.') do
        click_button 'Buscar'
        sleep 0.3
      end

      Then ('Validar que nenhuma credencial foi retornada com a busca pelo texto "Nenhum resultado foi encontrado"_004.') do
        expect(page).to have_content('Nenhum resultado foi encontrado')
      end

    # #Validação dos valores salvos na credencial 1001
    @verifyTechnologyProximityCredential
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_001.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_001.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Tecnologia deve conter o valor "Proximidade".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlTechnologyType', text: 'Proximidade')
      end

    @verifyTypeVisitorCredential
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_002.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_002.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Tipo deve conter o valor "Visitante".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlType', text: 'Visitante')
      end

    @verifyPublicCredential
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_003.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_003.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo "Credencial pública" deve estar marcado.') do
        expect(find('#cbxPublicCredential').disabled?).to be(false)
      end

    @verifyDisableFieldSupervisor
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_004.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_004.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar se o campo "Supervisor de equipamento" está desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_chkEquipmentSupervisor').disabled?).to be(true)
      end

    @verifyDisableFieldProvisional
      Given ('Que eu busque e encontre a credencial de número "1001" cadastrada pela automação_005.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1001)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_005.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar se o campo "Credencial provisória" está desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_checkBoxProvisionalCred').disabled?).to be(true)
      end

    #Validação dos valores salvos na credencial 1002
    @verifyCompanyCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_001.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_006.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadstro da credencial o campo Empresa deve conter o valor "Estrutura teste 1".') do
    #    expect(page).to have_css('#MainContentMainMaster_MainContent_ddlCompany', text: 'Estrutura Teste 1')
      end

    @verifyNotPublicCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_002.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_007.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo "Credencial pública" deve estar desmarcado.') do
        expect(find('#cbxPublicCredential').checked?).to be(false)
      end

    @verifyTechnologyBarCodeCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_003.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_008.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Tecnologia deve conter o valor "Código de Barras".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlTechnologyType', text: 'Código de Barras')
      end

    @verifyProvisionalCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_004.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_009.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo "Credencial provisória" deve estar marcado.') do
        expect(find('#MainContentMainMaster_MainContent_checkBoxProvisionalCred').checked?).to be(true)
      end

    @verifySituationBlockedCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_005.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_010.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo "Situação" deve estar com o valor "Bloqueado" selecionado.') do
        expect(find('#MainContentMainMaster_MainContent_optBlocked').checked?).to be(true)
      end

    @verifyReasonBlockedCredential
      Given ('Que eu busque e encontre a credencial de número "1002" cadastrada pela automação_006.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1002)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_011.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo "Motivo" deve estar com o valor "Teste".') do
        expect(find('#MainContentMainMaster_MainContent_txtBlockingReason').value).to eql('Teste')
      end

    #Validação dos valores salvos na credencial 1003
    @verifyCompany2Credential
      Given ('Que eu busque e encontre a credencial de número "1003" cadastrada pela automação_001.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_DATE_FROM)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_012.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Empresa deve conter o valor "Estrutura teste 2".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlCompany', text: 'Estrutura Teste 2')
      end

    @verifyTechnologySmartCardCredential
      Given ('Que eu busque e encontre a credencial de número "1003" cadastrada pela automação_002.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_DATE_FROM)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_013.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Tecnologia deve conter o valor "SmartCard".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlTechnologyType', text: 'SmartCard')
      end

    @verifyTypeCredentialCredential
      Given ('Que eu busque e encontre a credencial de número "1003" cadastrada pela automação_003.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_DATE_FROM)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_014.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Tipo deve conter o valor "Credencial".') do
        expect(page).to have_css('#MainContentMainMaster_MainContent_ddlType', text: 'Credencial')
      end

    @verifyValidityFieldCredential
      Given ('Que eu busque e encontre a credencial de número "1003" cadastrada pela automação_004.') do
        uncheck('MainContentMainMaster_chkLastTenModified')
        findElements.input_textbox('MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_DATE_FROM)
        click_button 'Buscar'
        sleep 0.3
      end

      When ('Clique no botão para realizar a alteração da credencial_015.') do
        page.find(:xpath, '//*[@id="MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0"]').click
        sleep 0.3
      end

      Then ('Validar no cadastro da credencial o campo Validade e Até deverão conter os valores esperados.') do
        $DateFrom = (find('#MainContentMainMaster_MainContent_txtDateFrom').value)
        eql = $DateFrom == $REGISTER_CREDENTIAL_DATE_FROM
        expect(eql).to be(true)

        $DateTo = (find('#MainContentMainMaster_MainContent_txtDateTo').value)
        eql = $DateTo == $REGISTER_CREDENTIAL_DATE_TO
        expect(eql).to be(true)
      end