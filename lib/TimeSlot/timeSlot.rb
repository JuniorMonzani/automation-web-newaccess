class TimeSlot
    # inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    def visit_TimeSlot
        visit 'https://autoteste.dimep-ams.com.br/TimeSlots/TimeSlotLst.aspx?OperationType=create&chkLastTen=True&currentPaginationIndex='
      end
    
      def visit_EditTimeSlot
        visit 'https://autoteste.dimep-ams.com.br/TimeSlots/TimeSlotLst.aspx'
      end


    def with(numero, horaIni, horaFim)
        find("input[id='MainContentMainMaster_MainContent_txtTimeSlotNumber']").set numero
        find("input[id='MainContentMainMaster_MainContent_txtInitialTimeSlot']").set horaIni
        find("input[id='MainContentMainMaster_MainContent_txtFinalTimeSlot']").set horaFim
        click_button 'Salvar'
    end

    def alert
        return find('#divIdBodyBusinessError').text
    end
    
        
    end