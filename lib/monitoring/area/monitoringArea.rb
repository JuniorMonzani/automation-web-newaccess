class MonitoringArea
    # inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
  
    #constante com os valores contidos no dropbox 'Selecione a área' - Monitoração de áreas
    $SELECT_AREA_MONITORING_AREAS = ['Dentro', 'Fora']

    def visit_Monitoring_Area
      visit 'https://autoteste.dimep-ams.com.br/MonitoringAreas/MonitoringAreas.aspx'
    end

    def verify_Exsists_Element(element)

        if(!driver.findElements(element).isEmpty())
            return true
      else
            return false
      end
    end
  end
  