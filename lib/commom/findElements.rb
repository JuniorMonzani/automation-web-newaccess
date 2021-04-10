class FindElements
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #realiza validação dos valores de dropbox
    def verify_Values_DropBox(css_selector, arrayValues)
        #guarda no array 'dropboxList' os valores encontrados na busca pelo dropbox informado 'css_selector = id'
        dropboxList = find(css_selector).all('option').collect(&:text)
        #compara os valroes obtidos e retorna true ou false
        eql = arrayValues & dropboxList == arrayValues
        
        return eql
    end
end