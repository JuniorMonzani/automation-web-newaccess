class Holiday

    include Capybara::DSL
   
   def visit_holiday
       visit 'https://autoteste.dimep-ams.com.br/Holidays/HolidayLst.aspx'
   end

    def holiday(descricao, data)
        find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtHolidayDescription"]').set descricao
        find(:xpath, '//*[@id="MainContentMainMaster_MainContent_txtHolidayDate"]').set data
    end

end