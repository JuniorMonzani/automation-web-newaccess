class CommunicationManager
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #variavel com o valor do campo 'Descrição' da tela de Tipo de Credencial
    #$REGISTER_CREDENTIAL_TYPE_MAX_DESCRIPTION='Automação'.ljust(55, 'X')
    
    def visit_Register_Communication_Manager
        visit 'https://autoteste.dimep-ams.com.br/Communication/CommunicationManagerEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end

    def visit_List_Communication_Manager
        visit 'https://autoteste.dimep-ams.com.br/Communication/CommunicationManagerLst.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end

    # preenche os campos do cadastro de Gerenciador de Comunicação para tipo client
    def fills_In_Communication_Manager_Client(description, name, port)
        fill_in 'MainContentMainMaster_MainContent_txtCommunicationManagerDescription', with: description
        fill_in 'MainContentMainMaster_MainContent_txtMachineName', with: name
        fill_in 'MainContentMainMaster_MainContent_txtPort', with: port
    end

    # preenche os campos do cadastro de Gerenciador de Comunicação para tipo server
    def fills_In_Communication_Manager_Server(ip, port, chave)
        fill_in 'MainContentMainMaster_MainContent_txtIPAddressServer', with: ip
        fill_in 'MainContentMainMaster_MainContent_txtPortServer', with: port
        fill_in 'MainContentMainMaster_MainContent_txtEncryptionKey', with: chave
    end

    # preenche o campo de email na aba alertas para cadastro de Gerenciador de Comunicação
    def fills_In_Communication_Manager_Emails(emails)
        fill_in 'MainContentMainMaster_MainContent_txtEmails', with: emails
    end
end