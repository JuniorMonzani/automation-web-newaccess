class CredentialType
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    attr_accessor :credentialTypeDescription

    def visit_Register_Credential_Type
        visit 'http://laboratorio.mdacesso.com.br/Credentials/CredentialTypeEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end

    #preenche o campo de descrição do cadastro de tipo de credencial
    def fills_In_Credential_Type(credentialTypeDescription)
        fill_in 'MainContentMainMaster_MainContent_txtCredentialTypeDescription', with: credentialTypeDescription
    end
end