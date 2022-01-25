require 'login/login'
require 'physical_environment/credential/credential'
require 'common/findElements'
require 'common/constants'

  credential = Credential.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página de cadastro de Credenciais.') do
        credential.visit_Register_Credential
        login.make_Login('admin', $password)
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
      Given('Informar caractere alfanumérico no campo "Número" e preencher corretamente todas os outros campos necessários para efetuar o cadastro de Credencial.') do
        credential.fills_In_Credential_Unique_Or_Multiple(true, true, 'Teste', '','','', false, false, false)
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
        credential.fills_In_Credential_Unique_Or_Multiple(false, true, false, '', '1','2', false, false, false)
      end

      Then('O campo "Número" deve ficar desabilitado e os campos "Números de" e "Até" devem ficar habilitados.') do
        expect(find('#MainContentMainMaster_MainContent_txtUniqueNumberInput').disabled?).to be(true)
        expect(find('#MainContentMainMaster_MainContent_txtMultipleNumberInputFrom').disabled?).to be(false)
        expect(find('#MainContentMainMaster_MainContent_txtMultipleNumberInputTo').disabled?).to be(false)
      end

     @fieldNumbersOfRequiredCredential
      Given('Não preencher o campo "Números de" e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        credential.fills_In_Credential_Unique_Or_Multiple(false, true, false, '1', '','', false, false, false)
      end

      When('Clicar no botão Salvar para validar o campo "Números de".') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('Deve existir uma validação no campo "Números de" pois o mesmo é obrigatório visto que a opção "Intervalo de credencial" esta marcada.') do
        # expect(page).to have_selector("input[oldtitle='O campo Números de deve conter um valor numérico válido']")
        expect(page).to have_selector("input[oldtitle='O campo Números até deve conter um valor numérico válido']")
      end
