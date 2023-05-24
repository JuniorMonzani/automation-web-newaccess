class Shift

 include Capybara::DSL

def visit_shift
    visit 'https://autoteste.dimep-ams.com.br/Shifts/ShiftsLst.aspx'
end

def with(numero,descricao,horaVirada)
    find("input[id='MainContentMainMaster_MainContent_txtNumber']").set @numero
    find("input[id='MainContentMainMaster_MainContent_txtDescription']").set descricao
    find("input[id='MainContentMainMaster_MainContent_txtTime']").set horaVirada
end

def mensagem
    return expect(page).to have_selector("input[oldtitle]").text
end


end