require 'login/login'
require 'access_environment/workingTime/workingTimeElements'
require 'common/findElements'

workingTimeElements = WorkingTime.new
login = Login.new


Given('Buscar e encontrar a jornada alterada pela automação com Descrição {string}.') do |desc|    
    find('#MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch').set desc
    click_button 'Buscar'
    sleep 1                        
  end                                                                                                  
                                                                                                       
  When('Clicar para excluir a jornada.') do                                                            
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_DELETE_0').click                       
  end  
  
  Then('Uma mensagem deve ser apresentada ao usuário na tela de exclusão de Jornada: {string}') do |mensagem|
    expect(page).to have_content mensagem                           
  end                                                                                                      
                                                                                                                                                                                   
                                                                                                       
  Then('A jornada não deve ser excluída sendo ainda apresentado na tela.') do                          
    expect(page).to have_content 'TesteAutomação iiiiiiiiiiiiii'                      
  end                                                                                                  
                                                                                                       
  Then('A jornada deve ser excluída com sucesso apresentando na tela a mensagem: {string}') do |mensagem|
    expect(page).to have_content mensagem                 
  end                                                                                                  
                                                                                                       
  Given('Buscar e encontrar a jornada cadastrada pela automação com Descrição {string}.') do |desc|  
    find('#MainContentMainMaster_TableFiltersHolder_txtDescriptionSearch').set desc
    click_button 'Buscar'
    sleep 1                         
  end                                                                                                  