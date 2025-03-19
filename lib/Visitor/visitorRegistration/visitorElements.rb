class Visitor

    include Capybara::DSL
   
   def visit_visitor
       visit 'https://autoteste.dimep-ams.com.br/Visitors/VisitorEdt.aspx'
   end


   #Metodos do Perfil de Acesso
   def lupa_perfil
        find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_accessProfileControlCurrentVisitSettings_AccessProfileLookUp').click
   end

    def perfil_checkbox
        find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_accessProfileControlCurrentVisitSettings_AccessProfilePopup_gv_AvailableAccessProfiles_chk_Selected_0').click
    end

    def ok_button
         find('#MainContentMainMaster_MainContent_ucCurrentVisitSettings_accessProfileControlCurrentVisitSettings_AccessProfilePopup_btnAccessProfileLookUpOK').click   
    end

  
end