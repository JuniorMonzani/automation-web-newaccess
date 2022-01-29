class Credential
    # inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #variavel com o valor do campo 'Número' da tela de Credencial
    $REGISTER_CREDENTIAL_NUMBER='1000'

    #variavel com o valor do campo 'Números de' da tela de Credencial
    $REGISTER_CREDENTIAL_NUMBER_FROM='1003'

    #variavel com o valor do campo 'Até' da tela de Credencial
    $REGISTER_CREDENTIAL_NUMBER_TO='1005'
    
    #variavel com o valor do campo 'Descrição' da tela de Áreas com quantidade máxima de caracteres
    # $REGISTER_AREAS_DEFAULT_DESCRIPTION='Automação Áreas'

    #variavel com o valor do campo 'Número' da tela de Credencial com quantidade máxima de caracteres
    $REGISTER_CREDENTIAL_MAX_NUMBER='9'.ljust(20, '9')

    #variavel com o valor do campo 'Descrição' da tela de Áreas com quantidade excedente de caracteres
    # $REGISTER_AREAS_EXCEEDS_DESCRIPTION='Automação Áreas'.ljust(35, 'X')

    #variavel com o valor do campo 'Descrição' da tela de Áreas com quantidade máxima de caracteres
    # $REGISTER_AREAS_EDIT_DESCRIPTION='Automação Áreas Edição'
    
    #variavel com o valor do campo 'Capacidade' da tela de Áreas
    # $REGISTER_AREAS_CAPACITY='99999'
  
    def visit_Register_Credential
      visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end
  
    def visit_List_Credential
      visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialsLst.aspx'
    end
  
    # preenche os campos do cadastro de grupo de equipamento por credencial individual sem motivo de bloqueio
    def fills_In_Credential_Unique_Or_Multiple(uniqueInput, regular, uniqueNumberInput, multipleNumberInputFrom, multipleNumberInputTo, blockingReason, equipmentSupervisor, boxProvisionalCred, publicCredential)

      # verifica o valor informado para o radio, se for verdadeiro marca o campo, se for falso desmarca
      if uniqueInput == true
        choose('MainContentMainMaster_MainContent_optUniqueInput')
        fill_in 'MainContentMainMaster_MainContent_txtUniqueNumberInput', with: uniqueNumberInput
      else
        choose('MainContentMainMaster_MainContent_optMultipleInput')
        fill_in 'MainContentMainMaster_MainContent_txtMultipleNumberInputFrom', with: multipleNumberInputFrom
        fill_in 'MainContentMainMaster_MainContent_txtMultipleNumberInputTo', with: multipleNumberInputTo
      end

      if regular == true
        choose('MainContentMainMaster_MainContent_optRegular')
      else
        choose('MainContentMainMaster_MainContent_optBlocked')
        fill_in 'MainContentMainMaster_MainContent_txtBlockingReason', with: blockingReason
      end

      # verifica o valor informado para o checkbox, se for verdadeiro marca o campo, se for falso desmarca
      if equipmentSupervisor == true
        check('MainContentMainMaster_MainContent_chkEquipmentSupervisor')
      else
        uncheck('MainContentMainMaster_MainContent_chkEquipmentSupervisor')
      end

      if boxProvisionalCred == true
        check('MainContentMainMaster_MainContent_checkBoxProvisionalCred')
      else
        uncheck('MainContentMainMaster_MainContent_checkBoxProvisionalCred')
      end

      if publicCredential == true
        check('cbxPublicCredential')
      else
        uncheck('cbxPublicCredential')
      end
    end
end