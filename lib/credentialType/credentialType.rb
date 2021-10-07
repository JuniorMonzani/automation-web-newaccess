class CredentialType
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #variavel com o valor do campo 'Descrição' da tela de Tipo de Credencial
    $REGISTER_CREDENTIAL_TYPE_DESCRIPTION='Automação'.ljust(55, 'X')
    
    def visit_Register_Credential_Type
        visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialTypeEdt.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
    end

    def visit_List_Credential_Type
        visit 'https://autoteste.dimep-ams.com.br/Credentials/CredentialTypesLst.aspx'
    end

end