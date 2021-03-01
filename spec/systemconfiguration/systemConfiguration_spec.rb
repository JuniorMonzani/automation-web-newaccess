

describe "Realiza o login e acessa a página de configuração do sistema", :systemConfiguration do
    title = 'Acessa a página e realiza testes diversos na tela de Configuração de sistema'

    context 'Realizando login no sistema e fazendo testes diversos na tela de Configuração do sistema' do
        
        before(:each) do
            visit 'http://laboratorio.mdacesso.com.br/SystemConfiguration/SystemConfigurationEdt.aspx'
            sleep 1
            fill_in 'txtUsrLogin', with: 'admin'
            fill_in 'txtUserPassLogin', with: 'madis2020@'
            click_button 'Submit1'
            sleep 2
        end
            
        it 'encontrando o dropBox "Tipo de coleta" e selecionando um valor.' do
            puts 'Encontrando o elemento "Tipo de coleta" e selecionando um valor.'
            select('Realtime sem coleta', from: 'MainContentMainMaster_MainContent_ddlCollectType')
        end

        it 'Desmarcando o checkbox de Sincronismo de pessoas e credenciais.' do
            puts 'Desmarcando o checkbox de Sincronismo de pessoas e credenciais.'
            uncheck('MainContentMainMaster_MainContent_cbxSyncData')
        end        
        it 'Marcando o checkbox de Sincronismo de pessoas e credenciais.' do
            puts 'Marcando o checkbox de Sincronismo de pessoas e credenciais.'
            check('MainContentMainMaster_MainContent_cbxSyncData')
        end

        it 'Selecionando radio Buttons na aba Acesso' do
            click_link 'Acesso'
            sleep 1
            puts 'Selecionando o radioButton "Ao associar credencial provisória à pessoa..."'
            find('input[value=rdAssociatingProvisionalPreventOriginal]').click
            sleep 1

            puts 'Selecionando o radioButton "Bloqueia a pessoa se a mesma possuir uma credencial..."'
            find('input[value=rdBlockPersonIfUseOriginal]').click
            sleep 1

            puts 'Selecionando o radioButton "Ao passar credencial original..."'
            find('input[value=rdPassingOriginalDisassociateProvisional]').click
            sleep 1
        end

        after(:each) do
            sleep 1
        end
    end
end