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
        findElements.select_option('#MainContentMainMaster_TableFiltersHolder_txtSearchNumber', $REGISTER_CREDENTIAL_1000)
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

    # @searchCredentialAnotherSituation
    #   Given ('Desmarcar o campo "10 últimas atualizações" da tela de Cadastro de Credencial_004.') do
    #     uncheck('MainContentMainMaster_chkLastTenModified')
    #   end

    #   And ('Inserir no campo "Número" o valor "1000"_004.') do
      
    #   end

    #   And ('Selecionar a situação "Bloqueada" no dropbox "Situação".') do
      
    #   end

    #   When ('Clicar no botão "Buscar"_004.') do

    #   end

    #   Then ('Validar que nenhuma credencial foi retornada com a busca pelo texto "Nenhum resultado foi encontrado"_004.') do

    #   end