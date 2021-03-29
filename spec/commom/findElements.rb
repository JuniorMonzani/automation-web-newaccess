class FindElements
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #realiza validação dos valores de dropbox
    def verify_Values_DropBox(css_selector, arrayValues)
        #guarda no array 'dropTimeZone' os valores encontrados na busca pelo dropbox informado 'css_selector = id'
        dropTimeZone = find(css_selector).all('option').collect(&:text)
        #compara os valroes obtidos e retorna true ou false
        eql = arrayValues & dropTimeZone == arrayValues
        
        return eql
    end
end