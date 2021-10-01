class CredentialType
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    attr_accessor :credentialTypeDescription
    
    def visit_Register_Credential_Type
        visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialTypeEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end

    def visit_List_Credential_Type
        visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialTypesLst.aspx'
    end

end