class WorkingTime
    # inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    def visit_WorkingTime
        visit 'https://autoteste.dimep-ams.com.br/WorkingTimes/WorkingTimeLst.aspx'
      end

    def mensagem_alerta
      return find('#divIdBodyBusinessError').text
    end
   
  end