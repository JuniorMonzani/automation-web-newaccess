@registerVehicle
Feature: Register Vehicle
    Como um usuário do sistema que tenha permissão para Cadastrar Veículo.

    Background:
        Given Que o usuário esteja na página de cadastro de Veículo.

    @verifyLabelsVehicle
    Scenario: verifyLabelsVehicle
        Given Que eu verifico e comparo todos os resources dos campos apresentados na página de cadastro de veículo.


    @fieldPlateRequiredVehicle
    Scenario: fieldPlateRequiredVehicle
        Given Que preencha os campos Placa, Marca, Cor e Modelo com '', 'Fiat', 'Uno' e 'Azul'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Placa: 'Informe a Placa'

    
    @fieldProducerRequiredVehicle
    Scenario: fieldProducerRequiredVehicle
        Given Que preencha os campos Placa, Marca, Cor e Modelo com 'TST1234', '', 'Azul' e 'Uno'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Marca: 'Informe a Marca'

    
    @fieldTypeRequiredVehicle
    Scenario: fieldTypeRequiredVehicle
        Given Que preencha os campos Placa, Marca, Cor e Modelo com 'TST1234', 'Fiat', 'Azul' e ''
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Modelo: 'Informe o Modelo'

        
    @fieldColorRequiredVehicle
    Scenario: fieldColorRequiredVehicle
        Given Que preencha os campos Placa, Marca, Cor e Modelo com 'TST1234', 'Fiat', '' e 'Uno'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Cor: 'Informe a Cor'
    
    
               
    @saveVehicle
    Scenario: saveVehicle
        Given Que preencha os campos Placa, Marca, Cor, Modelo, Numero do Veículo, RENAVAM, Ano Modelo, Ano Fabricação e Observação com 'TST1234', 'Fiat', 'Azul', 'Uno', '999', '123456', '2010', '2011' e 'Cadastro de Veículo Automação'
        When Clicar no botão Salvar
        Then Deve ver a mensagem 'Veículo salvo com sucesso!'