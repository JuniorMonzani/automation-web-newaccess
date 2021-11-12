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

    #busca por dropbox e seta o valor informado
    def select_option(css_selector, value)
        find(css_selector).find(:option, value).select_option
    end

    #busca por textbox e insere o valor informado
    def input_textbox(css_selector, value)
        fill_in css_selector, with: value
    end


    #busca por elemento que não contém na página
    def no_selector_on_page(element)
        expect(page.assert_no_selector(element)).to eq true 
    end

end