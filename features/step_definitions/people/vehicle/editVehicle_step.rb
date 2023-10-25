require 'login/login'
require 'common/findElements'
require 'people/vehicle/vehicleElements'

login = Login.new
findElements = FindElements.new
vehicleElements = Vehicle.new

#background
Given('Que o usuário esteja na página que lista os veículos.') do
    vehicleElements.visit_vehicle
    login.make_Login
  end
  
  #@verifyResourcesPageListVehicle
  Then('Comparar os resources apresentados com os esperados na página de listagem de veículos.') do
    expect(page).to have_content 'Cadastro de Veículo'
    expect(page).to have_content '10 últimas atualizações'
    expect(page).to have_content 'Placa'
    expect(page).to have_content 'Marca'
    expect(page).to have_content 'Modelo'
    expect(page).to have_content 'Alterar'
    expect(page).to have_content 'Excluir'
  end
  
  #@verifyValuesVehicleFields
  Given('Faço a busca e clico no botão alterar do veículo: {string}') do |placa|
    find('#MainContentMainMaster_TableFiltersHolder_txtSearch').set placa
    click_button 'Buscar'
    find('#MainContentMainMaster_MainContent_gridView_IMG_BUTTON_EDIT_0').click
  end
  
  When('Obter os valores dos campos Placa, Marca, Cor, Modelo, Numero do Veículo e Observação') do
    @placa = find('#MainContentMainMaster_vehicleEdtControl_txtPlaca').value
    @marca = find('#MainContentMainMaster_vehicleEdtControl_txtMarca').value
    @cor = find('#MainContentMainMaster_vehicleEdtControl_txtCor').value
    @modelo = find('#MainContentMainMaster_vehicleEdtControl_txtModelo').value
    @numero = find('#MainContentMainMaster_vehicleEdtControl_txtNumeroVeiculo').value
    @obs = find('#MainContentMainMaster_vehicleEdtControl_txtObservacao').text
  end
  
  Then('Devem ser exatamente os valores que foram cadastrados {string}, {string}, {string}, {string}, {string} e {string}') do |placa, marca, cor, modelo, numero, obs|
    expect(@placa).to eql placa
    expect(@marca).to eql marca
    expect(@cor).to eql cor
    expect(@modelo).to eql modelo
    expect(@numero).to eql numero
    expect(@obs).to eql obs
  end
  
  #@editVehicleFields
  Given('Inserir nos campos Placa, Marca, Cor, Modelo, Numero do Veículo e Observação os valores: {string}, {string}, {string}, {string}, {string} e {string}') do |placa, marca, cor, modelo, numero, obs|
    find('#MainContentMainMaster_vehicleEdtControl_txtPlaca').set placa
    find('#MainContentMainMaster_vehicleEdtControl_txtMarca').set marca
    find('#MainContentMainMaster_vehicleEdtControl_txtCor').set cor
    find('#MainContentMainMaster_vehicleEdtControl_txtModelo').set modelo
    find('#MainContentMainMaster_vehicleEdtControl_txtNumeroVeiculo').set numero
    find('#MainContentMainMaster_vehicleEdtControl_txtObservacao').set obs
  end
  
  Then('O veículo deve ser alterado com sucesso: {string}') do |msg|
    expect(page).to have_content(msg)
  end
  
  #@verifyValuesAfterEditVehicle
  Then('Devem ser exatamente os valores que foram alterados {string}, {string}, {string}, {string}, {string} e {string}') do |placa, marca, cor, modelo, numero, obs|
    expect(@placa).to eql placa
    expect(@marca).to eql marca
    expect(@cor).to eql cor
    expect(@modelo).to eql modelo
    expect(@numero).to eql numero
    expect(@obs).to eql obs
  end
  
  #@verifyFieldMarcaLength
  When('Obter o tamanho dos campos Marca, Cor e Modelo') do
    @marca = find('#MainContentMainMaster_vehicleEdtControl_txtMarca').value.length
    @cor = find('#MainContentMainMaster_vehicleEdtControl_txtCor').value.length
    @modelo = find('#MainContentMainMaster_vehicleEdtControl_txtModelo').value.length
  end
  
  Then('Devem ser exatamente os valores {string}, {string} e {string}') do |marca, cor, modelo|
    expect(@marca).to eql (marca).to_i
    expect(@cor).to eql (cor).to_i
    expect(@modelo).to eql (modelo).to_i
  end


#Adição dos campos da versão 3.28 do AcessoII


Given('Que marque o campo {string}') do |string|
  find('#MainContentMainMaster_vehicleEdtControl_chkUseWithoutStopIntegration').click
end

Given('Que aperte o botão buscar tag') do
  find('#MainContentMainMaster_vehicleEdtControl_btnWithoutStopSearchTag').click
end

Given('Que aperte em Ok no popup') do
  find('#btnBusinessErrorOk').click
end

Given('Que preencha os campos Número da TAG, Dígito e Pessoa responsável com {string}, {string} e {string}') do |tag, digito, pessoa|
  vehicleElements.semPararFields(tag, digito, pessoa)
end

Then('Deve ver a mensagem no campo Tag {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe o Número da TAG']")
end

Then('Deve ver a mensagem no campo Digito {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Dígito inválido']")
end

Then('Deve ver a mensagem no campo responsável {string}') do |string|
  expect(page).to have_selector("select[oldtitle='Informe a Pessoa responsável']")
end

Given('Que aperte o botão {string}') do |string|
  find('#MainContentMainMaster_vehicleEdtControl_btnWithoutStopInformations').click
end

Given('Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com {string}, {string}, {string}, {string}, {string}, {string} e {string}') do |logradouro, numero, complemento, bairro, cidade, cep, uf|
  vehicleElements.semPararInformacoes(logradouro, numero, complemento, bairro, cidade, cep, uf)
end

When('Clicar no botão Salvar da tela de Informações') do
  find('#MainContentMainMaster_vehicleEdtControl_VehicleInfoPopup_btnSave').click
end

Then('Deve ver a mensagem no campo logradouro {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe o Logradouro']")
end

Then('Deve ver a mensagem no campo número {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe o Número']")
end

Then('Deve ver a mensagem no campo bairro {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe o Bairro']")
end

Then('Deve ver a mensagem no campo cidade {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe a Cidade']")
end

Then('Deve ver a mensagem no campo CEP {string}') do |string|
  expect(page).to have_selector("input[oldtitle='Informe o CEP']")
end

Then('Deve ver a mensagem no campo UF {string}') do |string|
  expect(page).to have_selector("select[oldtitle='Informe a UF']")
end

Given('Que desmarque o campo {string}') do |string|
  find('#MainContentMainMaster_vehicleEdtControl_chkUseWithoutStopIntegration').click
end