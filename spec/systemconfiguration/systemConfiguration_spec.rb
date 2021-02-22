

describe "Realiza o login e acessa a página de configuração do sistema", :systemConfiguration do
    title = 'Acessa a página e seleciona um valor no combobox'

    context 'abrindo' do
        before(:all) do
            visit "http://laboratorio.mdacesso.com.br/logon.aspx"
        end

        it 'insere o login' do
            fill_in 'txtUsrLogin', with: 'admin'
            fill_in 'txtUserPassLogin', with: 'madis2020@'
            click_button 'Submit1'
            sleep 1
        
            visit('http://laboratorio.mdacesso.com.br/SystemConfiguration/SystemConfigurationEdt.aspx')
            sleep 1

            puts 'Encontrando o elemento "Tipo de coleta" e selecionando um valor'
            select('Realtime sem coleta', from: 'MainContentMainMaster_MainContent_ddlCollectType')
            sleep 1
        end
    end
end