require 'login/login'
require 'common/findElements'
require 'people/vehicle/vehicleElements'

login = Login.new
findElements = FindElements.new
vehicleElements = Vehicle.new

#background
Given('Que o usuário esteja na página de cadastro de Veículo.') do
    vehicleElements.visit_vehicle
    login.make_Login
    click_button 'Cadastrar'
  end
  
  #@verifyLabelsVehicle
  Given('Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de veículo.') do
    expect(page).to have_content 'Placa'
    expect(page).to have_content 'Marca'
    expect(page).to have_content 'Cor'
    expect(page).to have_content 'Nº do veículo'
    expect(page).to have_content 'Modelo'
    expect(page).to have_content 'Observação'
    expect(page).to have_content 'Requer dupla verificação'
  end
  
  #Verifica todos os campos (placa, marca, cor e modelo)
  Given('Que preencha os campos Placa, Marca, Cor e Modelo com {string}, {string}, {string} e {string}') do |placa, marca, cor, modelo|
    vehicleElements.fields_vehicle(placa, marca, cor, modelo)
  end
  
  When('Clicar no botão Salvar') do
    click_button 'Salvar'
  end
  
  #valida mensagem do campo Placa
  Then('Deve ver a mensagem no campo Placa: {string}') do |msg|
    expect(page).to have_selector("input[oldtitle='Informe a Placa']")
  end
  
  #valida mensagem do campo Marca
  Then('Deve ver a mensagem no campo Marca: {string}') do |msg|
    expect(page).to have_selector("input[oldtitle='Informe a Marca']")
  end
  
  #valida mensagem do campo Cor
  Then('Deve ver a mensagem no campo Cor: {string}') do |msg|
    expect(page).to have_selector("input[oldtitle='Informe a Cor']")
  end

  #valida mensagem do campo Modelo
  Then('Deve ver a mensagem no campo Modelo: {string}') do |msg|
    expect(page).to have_selector("input[oldtitle='Informe o Modelo']")
  end

  #cadastra o veículo preenchendo todos os campos
  Given('Que preencha os campos Placa, Marca, Cor, Modelo, Numero do Veículo, RENAVAM, Ano Modelo, Ano Fabricação e Observação com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} e {string}') do |placa, marca, cor, modelo, numero, renavam, anoModelo, anoFabric, observacao|
    vehicleElements.allfields_vehicle(placa, marca, cor, modelo, numero, renavam, anoModelo, anoFabric, observacao)
  end




  # #Novos campos relacionados ao SEM PARAR - Adicionados na versão 3.28 do AcessoII
  # Given('Que marque o campo {string}') do |string|
  #   find('#MainContentMainMaster_vehicleEdtControl_chkUseWithoutStopIntegration').click
  # end
  
    
  # Given('Que aperte o botão {string}') do |string|
  #   find('#MainContentMainMaster_vehicleEdtControl_btnWithoutStopInformations').click
  # end
  
  # Given('Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com {string}, {string}, {string}, {string}, {string}, {string} e {string}') do |logradouro, numero, complemento, bairro, cidade, cep, uf|
  #   vehicleElements.semPararInformacoes(logradouro, numero, complemento, bairro, cidade, cep, uf)
  # end


  # Then('Deve ver a mensagem no campo Tag {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe o Número da TAG']")
  # end
  
  # Then('Deve ver a mensagem no campo Digito {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Dígito inválido']")
  # end
  
  # Then('Deve ver a mensagem no campo responsável {string}') do |string|
  #   expect(page).to have_selector("select[oldtitle='Informe a Pessoa responsável']")
  # end
  
  # When('Clicar no botão Salvar da tela de Informações') do
  #   find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_btnSave').click
  # end
  
  # Then('Deve ver a mensagem no campo logradouro {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe o Logradouro']")
  # end
  
  # Then('Deve ver a mensagem no campo número {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe o Número']")
  # end
  
  # Then('Deve ver a mensagem no campo bairro {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe o Bairro']")
  # end
  
  # Then('Deve ver a mensagem no campo cidade {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe a Cidade']")
  # end
  
  # Then('Deve ver a mensagem no campo CEP {string}') do |string|
  #   expect(page).to have_selector("input[oldtitle='Informe o CEP']")
  # end
  
  # Then('Deve ver a mensagem no campo UF {string}') do |string|
  #   expect(page).to have_selector("select[oldtitle='Informe a UF']")
  # end

  # Given('Que aperte o botão buscar tag') do
  #   find('#MainContentMainMaster_vehicleEdtControl_btnWithoutStopSearchTag').click
  # end
  
  # Given('Que aperte em Ok no popup') do
  #   find('#btnBusinessErrorOk').click
  # end