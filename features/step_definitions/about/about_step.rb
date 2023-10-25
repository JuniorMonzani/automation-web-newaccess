require 'login/login'
require 'common/findElements'
require 'about/aboutElements'

login = Login.new
findElements = FindElements.new
aboutElements = About.new
time = Time.new

#background
Given('Que o usuário esteja na página Sobre o Sistema.') do
    aboutElements.visit_about
    login.make_Login
  end
  
  Then('Comparar os resources apresentados com os esperados na página Sobre o Sistema.') do
    expect(page).to have_content 'CNPJ: 61099008003671'
    expect(page).to have_content 'Empresa: DIMEP SISTEMAS DE PONTO E ACESSO'
    expect(page).to have_content 'Licença (Quantidade de equipamentos): 9999'
    expect(page).to have_content 'Licença (Quantidade de pessoas):'
    expect(page).to have_content 'Hardlock: 000000295856754'
    expect(page).to have_content 'Status: OK '
    expect(page).to have_content 'Tipo: Com hardlock físico'
    expect(page).to have_content 'Versão máxima da comunicação: 99.99'
    expect(page).to have_content 'Identificação do Produto: 0000000002'
  end

  When('Que obtenha os valores dos campos WebClient, Banco de Dados e Comunicação') do          
    @web = find(:xpath, '//*[@id="MainContentMainMaster_gv_Versions"]/tbody/tr[2]/td[2]').text
    @banco = find(:xpath, '//*[@id="MainContentMainMaster_gv_Versions"]/tbody/tr[3]/td[2]').text
    @comu = find(:xpath, '//*[@id="MainContentMainMaster_gv_Versions"]/tbody/tr[4]/td[2]').text
  end                                                                           
                                                                                
  Then('Os valores devem ser {string}, {string} e {string}') do |webClient, bancoDados, comuni|         
     expect(@web).to eql webClient
     expect(@banco).to eql bancoDados
     expect(@comu).to eql comuni
  end                                                                           


  When('Que obtenha o valor atual do Status') do                                
    @status = (find(:xpath, '//*[@id="helpInfoBusi"]/label[6]').text).sub(/Status: OK/, "")
    hora = @status[-9..-5]
    @hora2 = hora.sub(":","").to_i
  end                                                                           
                                                                                
  Then('O valor deve ser correspondente ao dia atual') do                       
    now = Time.now
    atual = now.strftime("%d/%m/%Y %H:%M")
    revert = atual[-6..-1]
    atual2 = revert.sub(":","").to_i
    @total = atual2 - @hora2
    total2 = @total >= 10
    expect(total2).to be(false)
 
   end                                                                           
