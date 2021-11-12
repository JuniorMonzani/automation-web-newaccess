require 'login/login'
require 'physical_environment/areas/Areas'
require 'common/findElements'
require 'common/constants'

  areas = Areas.new
  findElements = FindElements.new
  login = Login.new

  @background
    Given('Que o usuário esteja na página de cadastro de Áreas.') do
      areas.visit_Register_Areas
      login.make_Login('admin', $password.to_s)
    end

    @verifyLabelsAreas
      Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de áreas.') do
        expect(page).to have_content('Número')
        expect(page).to have_content('Descrição')
        expect(page).to have_content('Capacidade')
        expect(page).to have_content('Controla capacidade')
        expect(page).to have_content('Atualizar área na credencial')
        expect(page).to have_content('Interditada')
        expect(page).to have_content('Permite reentrada')
        expect(page).to have_content('Permite quebra de sequência')
        expect(page).to have_content('Controla quantidade por grupo de pessoas')
        expect(page).to have_content('Baixa credencial provisória no cofre')
        expect(page).to have_content('Requer autorizador')
        expect(page).to have_content('Baixa credencial que autentica em credencial no cofre')
        expect(page).to have_content('Baixa credencial que autentica em visitante no cofre')
      end

    @verifyFieldCapacityDisabled
      Given('Desmarcar o checkbox Capacity Control da tela Áreas.') do
        uncheck('MainContentMainMaster_MainContent_cbxCapacityControl')
      end

      Then('O campo Capacity da tela Áreas deve ficar desabilitado.') do
        expect(find('#MainContentMainMaster_MainContent_txtAreaCapacity').disabled?).to be(true)
      end

    @fieldNumberRequiredAreas
      Given('Informar caractere alfanumérico no campo "Número" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas('teste', $REGISTER_AREAS_DEFAULT_DESCRIPTION, $REGISTER_AREAS_CAPACITY)
      end

      When('Clicar no botão Salvar para validar o campo "Número" da tela Áreas.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Número" da tela Áreas pois o mesmo é obrigatório e só aceita caractere numérico.') do
        expect(page).to have_selector("input[oldtitle='Informe o Número']")
      end

    @fieldDescriptionRequiredAreas
      Given('Não preencher o campo "Descrição" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas($REGISTER_AREAS_NUMBER, '', $REGISTER_AREAS_CAPACITY)
      end
    
      When('Clicar no botão Salvar para validar o campo "Descrição" da tela Áreas.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Descrição" da tela Áreas pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Descrição']")
      end

    @fieldCapacityRequiredAreas
      Given('Informar caractere alfanumérico no campo "Capacidade" da tela Áreas e preencher corretamente todas os outros campos necessários para efetuar o cadastro.') do
        areas.fills_In_Areas($REGISTER_AREAS_NUMBER, $REGISTER_AREAS_DEFAULT_DESCRIPTION, 'teste')
      end
    
      When('Clicar no botão Salvar para validar o campo "Capacidade" da tela Áreas com caracter alfanumérico.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Capacidade" da tela Áreas pois o mesmo é obrigatório e não foi informado.') do
        expect(page).to have_selector("input[oldtitle='Informe a Capacidade']")
      end

    @fieldCapacityThanZero
      Given('Informar valor zero no campo "Capacidade" da tela Áreas.') do
        areas.fills_In_Areas($REGISTER_AREAS_NUMBER, $REGISTER_AREAS_DEFAULT_DESCRIPTION, '0')
      end
    
      When('Clicar no botão Salvar para validar o campo "Capacidade" da tela Áreas com valor 0.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Capacidade" da tela Áreas pois no mesmo é obrigatório um valor acima de zero.') do
        expect(page).to have_selector("input[oldtitle='A Capacidade deve ser maior que zero']")
      end

    @fieldNumberThanZero
      Given('Informar valor zero no campo "Número" da tela Áreas.') do
        areas.fills_In_Areas('0', $REGISTER_AREAS_DEFAULT_DESCRIPTION, $REGISTER_AREAS_CAPACITY)
      end
    
      When('Clicar no botão Salvar para validar o campo "Número" da tela Áreas com valor 0.') do
        click_button 'Salvar'
        sleep 0.3
      end
      
      Then('Deve existir uma validação no campo "Número" da tela Áreas pois no mesmo é obrigatório um valor acima de zero.') do
        expect(page).to have_selector("input[oldtitle='O Número deve ser maior que zero']")
      end

    @registerAreasSuccess
      Given('Preencher o campo Número com "9999".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAreaNumber', $REGISTER_AREAS_NUMBER)
      end

      And('Preencher o campo Descrição com o máximo de caracteres possíveis no campo.') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAreaDescription', $REGISTER_AREAS_EXCEEDS_DESCRIPTION)
      end

      And('Preencher o campo Capacidade com "99999".') do
        findElements.input_textbox('MainContentMainMaster_MainContent_txtAreaCapacity', $REGISTER_AREAS_CAPACITY)
      end

      And('Marcar todos os checkbox exceto Controle de Capacidade.') do
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

      When('Clicar no botão Salvar para salvar a área.') do
        click_button 'Salvar'
        sleep 0.3
      end

      Then('A Área deve ser salva com sucesso no cadastro.') do
        expect(page).to have_content('Área salva com sucesso')
      end