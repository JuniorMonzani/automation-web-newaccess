require 'login/login'
require 'physical_environment/credential/Credential'
require 'common/findElements'
require 'common/constants'

  credential = Credential.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página de cadastro de Credenciais.') do
        credential.visit_Register_Credential
        login.make_Login
    end
    
    @verifyLabelsCredential
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na tela de cadastro de credencial.') do
        expect(page).to have_content('Incluir')
        expect(page).to have_content('Credencial individual')
        expect(page).to have_content('Intervalo de credencial')
        expect(page).to have_content('Número')
        expect(page).to have_content('Números de')
        expect(page).to have_content('Até')
        expect(page).to have_content('Tecnologia')
        expect(page).to have_content('Tipo')
        expect(page).to have_content('Empresa')
        expect(page).to have_content('Supervisor de equipamento')
        expect(page).to have_content('Credencial provisória')
        expect(page).to have_content('Credencial pública')
        expect(page).to have_content('Situação')
        expect(page).to have_content('Liberada')
        expect(page).to have_content('Bloqueada')
        expect(page).to have_content('Motivo')
      end

    @fieldNumberRequiredCredential
      Given('Informar caractere alfanumérico no campo "Número" preenchendo corretamente todas os outros campos necessários para efetuar o cadastro de Credencial.') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, 'Teste', '','','', false, false, false)
        sleep 5
      end

      When('Clicar no botão Salvar para validar o campo "Número" no cadastro de credencial.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('Deve existir uma validação no campo "Número" pois o mesmo é obrigatório e só aceita caractere numérico visto que a opção "Credencial individual" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Informe o Número']")
      end

    @fieldCredentialIntervalEnableCredential
      Given('Marcar a opção de inclusão "Intervalo de credencial".') do
        credential.fills_In_Credential_Unique_Or_Multiple(false, true, '', '1', '2','', false, false, false)
      end

      Then('O campo "Número" deve ficar desabilitado e os campos "Números de" e "Até" devem ficar habilitados.') do
        expect(find('#MainContentMainMaster_MainContent_txtUniqueNumberInput').disabled?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_txtMultipleNumberInputFrom').disabled?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_txtMultipleNumberInputTo').disabled?).to be(false)
      end
      
    @fieldNumbersOfRequiredCredential
      Given('Não preencher o campo "Números de" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        credential.fills_In_Credential_Unique_Or_Multiple(false, true, $REGISTER_CREDENTIAL_1000, '', '','', false, false, false)
      end

      When('Clicar no botão Salvar para validar o campo "Números de".') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('Deve existir uma validação no campo "Números de" pois o mesmo é obrigatório visto que a opção "Intervalo de credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='O campo Números de deve conter um valor numérico válido']")
      end

      And('Deve existir uma validação no campo "Até" pois o mesmo é obrigatório visto que a opção "Intervalo de credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='O campo Números até deve conter um valor numérico válido']")
      end
    
    @verifyReasonMandatory
      Given('Informar o valor "1000" no campo "Número"_001') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, $REGISTER_CREDENTIAL_1000, '','','', false, false, false)
        sleep 1
      end

      And('Selecionar uma empresa_001') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCompany', 'Estrutura Teste 1')
      end

      And('Marcar a opção "Bloqueada"') do
        find(:css, '#MainContentMainMaster_MainContent_optBlocked').click
      end

      When('Clicar no botão "Salvar" para acionar a validação_001') do
        click_button 'Salvar'
        sleep 1
      end

      Then('O campo "Motivo" deve apresentar a obrigatoriedade') do
        expect(page).to have_selector("textarea[oldtitle='Informe o motivo do bloqueio']")
      end

    @verifyValuesTechnologyCredential
      Given('Obter todos os valores do dropbox "Tecnologia" e comparar com os valores esperados.') do
        $valueTechnologyType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlTechnologyType', $REGISTER_TECHNOLOGYTYPE)
      end

      Then('Deve conter todos os valores esperados no campo "Tecnologia".') do
        expect($valueTechnologyType).to be_truthy
      end

    @verifyValuesTypeCredential
      Given('Obter todos os valores do dropbox "Tipo" e comparar com os valores esperados.') do
        $valueType = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlType', $REGISTER_TYPE)
      end

      Then('Deve conter todos os valores esperados no campo "Tipo".') do
        expect($valueType).to be_truthy
      end

    @verifyValuesCompanyCredential
      Given('Obter todos os valores do dropbox "Empresa" e comparar com os valores esperados.') do
        $valueCompany = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlCompany', $REGISTER_COMPANY)
      end

      Then('Deve conter todos os valores esperados no campo "Empresa".') do
        expect($valueCompany).to be_truthy
      end

    @verifyValuesPublicCredentialCredential
      Given('Marcar o checkbox "Credencial pública".') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, $REGISTER_CREDENTIAL_1000, '', '','', false, false, true)
      end

      Then('Deve desabilitar o dropbox "Empresa".') do
        expect(find('#MainContentMainMaster_MainContent_ddlCompany').disabled?).to be(true)
      end

    @fieldReasonDisabledCredential
      Given('Com a opção de situação "Liberada" marcada.') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, $REGISTER_CREDENTIAL_1000, '', '','', false, false, false)
      end

      Then('O campo "Motivo" deve ficar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtBlockingReason').disabled?).to be(true)
      end

    @fieldReasonEnabledCredential
      Given('Marcar a opção de situação "Bloqueada".') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, false, $REGISTER_CREDENTIAL_1000, '', '','', false, false, false)
      end

      Then('O campo "Motivo" deve ficar habilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtBlockingReason').disabled?).to be(false)
      end

    @verifyValuesProvisoryCredentialCredential
      Given('Marcar o checkbox "Credencial provisória".') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, $REGISTER_CREDENTIAL_1000, '', '','', false, true, false)
      end

      Then('Deve desabilitar o checkbox "Supervisor de equipamento".') do
        expect(find('#MainContentMainMaster_MainContent_chkEquipmentSupervisor').disabled?).to be(true)
      end

      @registerCredentialSuccess
      Given('Que eu preencha todos os campos obrigatórios corretamente para cadastro de credencial.') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, $REGISTER_CREDENTIAL_1000, '','','', false, false, false)
      end

      And('Selecionar a "Tecnologia" como "Código de Barras".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTechnologyType', 'Código de Barras')
      end

      And('Selecionar o "Tipo" como "Pessoa".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Pessoa')
      end

      And('Selecionar a "Empresa" como "Estrutura Teste 1".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCompany', 'Estrutura Teste 1')
      end

      And('Marcar o checkbox "Supervisor de equipamento".') do
        check('MainContentMainMaster_MainContent_chkEquipmentSupervisor')
      end

      When('Clicar no botão "Salvar" para incluir a Credencial.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('A credencial deve ser salva com sucesso.') do
        expect(page).to have_content('Credencial salva com sucesso')
      end

    # condições para habilitar desabilitar campo
    # @verifyDisabledDropBoxCompany
    #   Given('Marcar o checkbox "Credencial pública".') do
    #     check('cbxPublicCredential')
    #   end

    #   Then('Deve desabilitar o dropbox "Empresa".') do
    #     expect(find('#MainContentMainMaster_MainContent_ddlCompany').disabled?).to be(true)
    #   end

    @verifyEnableDropBoxCompany
      Given('Desmarcar o checkbox "Credencial pública".') do
        uncheck('cbxPublicCredential')
      end

      Then('Deve habilitar o dropbox "Empresa".') do
        expect(find('#MainContentMainMaster_MainContent_ddlCompany').disabled?).to be(false)
      end

    # @verifyDisabledReason
    #   Given('Com a opção de situação "Liberada" marcada.') do
    #     find(:css, '#MainContentMainMaster_MainContent_optRegular').click
    #   end

    #   Then('O campo "Motivo" deve ficar desabilitado.') do
    #     expect(find('#MainContentMainMaster_MainContent_txtBlockingReason').disabled?).to be(true)
    #   end

    # @verifyEnableReason
    #   Given('Marcar a opção de situação "Bloqueada".') do
    #     find(:css, '#MainContentMainMaster_MainContent_optBlocked').click
    #   end

    #   Then('O campo "Motivo" deve ficar habilitado.') do
    #     expect(find('#MainContentMainMaster_MainContent_txtBlockingReason').disabled?).to be(false)
    #   end

    # @verifyDisabledEquipmentSupervisor
    #   Given('Marcar o checkbox "Credencial provisória".') do
    #     check('MainContentMainMaster_MainContent_checkBoxProvisionalCred')
    #   end

    #   Then('Deve desabilitar o checkbox "Supervisor de equipamento".') do
    #     expect(find('#MainContentMainMaster_MainContent_chkEquipmentSupervisor').disabled?).to be(true)
    #   end

    @verifyEnabledEquipmentSupervisor
      Given('Desmarcar o checkbox "Credencial provisória".') do
        uncheck('MainContentMainMaster_MainContent_checkBoxProvisionalCred')
      end

      Then('Deve habilitar o checkbox "Supervisor de equipamento".') do
        expect(find('#MainContentMainMaster_MainContent_chkEquipmentSupervisor').disabled?).to be(false)
      end

    # validação de mansagens
    @verifyMessageCredentialCreation
      Given('Que eu marque o campo "Intervalo de credenciais"') do
        find(:css, '#MainContentMainMaster_MainContent_optMultipleInput').click
      end

      And('Informe o valor "1001" no campo "Números de"') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtMultipleNumberInputFrom', $REGISTER_CREDENTIAL_1001)
      end

      And('Informe o valor "1100" no campo "Até"') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtMultipleNumberInputTo', $REGISTER_CREDENTIAL_NUMBER_TO)
      end

      When('Clicar no botão "Salvar" para acionar a validação') do
        click_button 'Salvar'
        sleep 2
      end

      Then('A mensagem de inclusão de um intervalo de credenciais será apresentada ao usuário e deve ser exatamente a mensagem esperada') do
        expect(find('#MainContentMainMaster_MainContent_confirmPopupSave')).to have_content 'Você selecionou a opção Inclusão do Intervalo de Credenciais. O processo demorará alguns minutos. Tem certeza que deseja incluir as credenciais?'
      end

    @verifyMessageCompanyMandatory
      Given('Informe o valor "1000" no campo "Número"_002') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtUniqueNumberInput', $REGISTER_CREDENTIAL_1000)
      end
      
      When('Clicar no botão "Salvar" para acionar a validação_002') do
        click_button 'Salvar'
        sleep 1
      end

      Then('A mensagem de alerta apresentada ao usuário deve ser exatamente a mensagem esperada_002') do
        expect(find('#divIdBodyBusinessError')).to have_content '- A Empresa é obrigatória' 
        sleep 1
      end

    @verifyMessageCredentialAlreadyExsists
      Given('Informe o valor "1" no campo "Número"_003 marcando também como credencial pública') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, '1', '', '', '', false, false, true)
      end
      
      When('Clicar no botão "Salvar" para acionar a validação_003') do
        click_button 'Salvar'
        sleep 1
      end

      Then('A mensagem de alerta apresentada ao usuário deve ser exatamente a mensagem esperada_003') do
        expect(find('#divIdBodyBusinessError')).to have_content '- A Credencial de número 1 já existe no sistema'
        sleep 1
      end

      #Validação de credencial que autentica em credencial
      @verifyMandatoryFieldsCredencialType
      Given('Informar o valor "1100" no campo "Número"_004') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtUniqueNumberInput', $REGISTER_CREDENTIAL_NUMBER_TO)
      end

      And('Selecionar uma empresa_004') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCompany', 'Estrutura Teste 1')
      end

      And('Selecionar o tipo "Credencial"_004') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Credencial')
      end

      And('Informar uma senha no campo "Senha"._004') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPassword', $REGISTER_CREDENTIAL_PASSWORD)
      end

      And('Limpar o campo "Porcentagem de sorteio"._004') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtPercentageOfSortition', '')
      end

      When('Clicar no botão "Salvar" para acionar a validação_004') do
        click_button 'Salvar'
        sleep 1
      end

      Then('Deve existir uma validação no campo "Validade" pois o mesmo é obrigatório visto que a opção "Credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Informe a Data inicial']")
      end

      And('Deve existir uma validação no campo "Até" pois o mesmo é obrigatório visto que a opção "Credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Informe a Data final']")
      end

      And('Deve existir uma validação no campo "Perfil de acesso" pois o mesmo é obrigatório visto que a opção "Credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Você deve cadastrar o Perfil de Acesso']")
      end

      And('Deve existir uma validação no campo "Confirme a senha" pois o mesmo é obrigatório visto que a opção "Credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Confirmação de senha não confere']")
      end

      And('Deve existir uma validação no campo "Porcentagem de sorteio" pois o mesmo é obrigatório visto que a opção "Credencial" esta marcada.') do
        expect(page).to have_selector("input[oldtitle='Preencha o campo Porcentagem de sorteio']")
      end


      # @verifyTextInParameterOldtitle

      @verifyValuesMaster
      Given('Selecionar o tipo "Credencial"_006') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Credencial')
      end

      When('Obter todos os valores do dropbox "Master" e comparar com os valores esperados.') do
        $valueMaster = findElements.verify_Values_DropBox('#MainContentMainMaster_MainContent_ddlMaster', $REGISTER_MASTER)
      end

      Then('O dropbox "Master" deve conter todos os valores esperados.') do
        expect($valueMaster).to be_truthy
      end

      #Salvando credenciais
      @saveCredentialCombinationFields_1
      Given('Informe o valor "1000" no campo "Número".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtUniqueNumberInput', $REGISTER_CREDENTIAL_1000)
      end

      And('Marcar a opção "Credencial pública".') do
        check('cbxPublicCredential')
      end

      And('Selecionar a tecnologia "Proximidade".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTechnologyType', 'Proximidade')
      end

      And('Selecionar o Tipo "Visitante".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Visitante')
      end

      When('Clicar no botão "Salvar" para incluir a Credencial_001') do
        click_button 'Salvar'
        sleep 1
      end

      Then('A credencial deve ser salva com sucesso_001.') do
        expect(page).to have_content('Credencial salva com sucesso')
      end

      @saveCredentialCombinationFields_2
      Given('Informe o valor "1001" no campo "Número".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtUniqueNumberInput', $REGISTER_CREDENTIAL_1001)
      end

      And('Selecionar a empresa "Estrutura teste 1".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCompany', 'Estrutura Teste 1')
      end

      And('Selecionar a tecnologia "Barras"') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTechnologyType', 'Código de Barras')
      end

      And('Selecionar o Tipo "Pessoa"') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Pessoa')
      end

      And('Selecionar a opção "Credencial provisória"') do
        check('MainContentMainMaster_MainContent_checkBoxProvisionalCred')
      end

      And('Selecionar a opção "Bloqueada"') do
        find(:css, '#MainContentMainMaster_MainContent_optBlocked').click
      end

      And('Preencher o campo "Motivo" com valor "Teste".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtBlockingReason', 'Teste')
      end

      When('Clicar no botão "Salvar" para incluir a Credencial_005') do
        click_button 'Salvar'
        sleep 1
      end

      Then('A credencial deve ser salva com sucesso_002.') do
        expect(page).to have_content('Credencial salva com sucesso')
      end

      @saveCredentialCombinationFields_3
      Given('Informe o valor "1002" no campo "Número".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtUniqueNumberInput', $REGISTER_CREDENTIAL_1002)
      end

      And('Selecionar a empresa "Estrutura teste 2"._001') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlCompany', 'Estrutura Teste 2')
      end

      And('Selecionar a tecnologia "SmartCard"_001') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlTechnologyType', 'SmartCard')
      end

      And('Selecionar o Tipo "Credencial".') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlType', 'Credencial')
      end

      And('Selecinar o perfil de acesso "Perfil de Credencial".') do
        find('#MainContentMainMaster_MainContent_accessProfileControlCredentialEdt_upAccessProfileLookUp').click
        sleep 1
        check('MainContentMainMaster_MainContent_accessProfileControlCredentialEdt_AccessProfilePopup_gv_AvailableAccessProfiles_chk_Selected_0')
        sleep 2
        click_button 'Ok'
        sleep 1
      end

      And('Selecionar o valor "Sim, no perfil" no dropbox Master.') do
        findElements.select_option('#MainContentMainMaster_MainContent_ddlMaster', 'Sim')
      end

      And('Marcar o campo "Dispensa senha".') do
        check('chkAvoidPassword')
      end

      And('Informar um horário no campo "Horário para recolhimento no cofre na data final".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtTimeCollectSafe', '17:00')
      end

      And('Selecionar uma data inicial de validade com valor 01.12.2025.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtDateFrom', $REGISTER_CREDENTIAL_DATE_FROM)
      end

      And('Selecionar uma data final de validade com valor 31.12.2025.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtDateTo', $REGISTER_CREDENTIAL_DATE_TO)
      end

      When('Clicar no botão "Salvar" para incluir a Credencial_006') do
        click_button 'Salvar'
        sleep 1
      end

      Then('A credencial deve ser salva com sucesso_003.') do
        expect(page).to have_content('Credencial salva com sucesso')
      end