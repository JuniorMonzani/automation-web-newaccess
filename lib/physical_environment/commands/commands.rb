class Command

    def visit_Commands
        visit 'https://autoteste.dimep-ams.com.br/SendingCommand/SendingCommand.aspx'
    end

    def click_Tab_Prossess
        find('MainContentMainMaster_MainContent_tab2').click
    end
end