@editRegisterVehicle
Feature: Edit Register Vehicle
    Como um usuário do sistema que tenha permissão para Alterar o veículo.

    Background:
        Given Que o usuário esteja na página que lista os veículos.

    @verifyResourcesPageListVehicle
    Scenario: verifyResourcesPageListVehicle
        Then Comparar os resources apresentados com os esperados na página de listagem de veículos.
       
        
    @verifyValuesVehicleFields
    Scenario: verifyValuesVehicleFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'TST1234'
        When Obter os valores dos campos Placa, Marca, Cor, Modelo, Numero do Veículo e Observação
        Then Devem ser exatamente os valores que foram cadastrados 'TST1234', 'Fiat', 'Azul', 'Uno', '999' e 'Cadastro de Veículo Automação'
        

    @editVehicleFields
    Scenario: editVehicleFields
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'TST1234'
        Given Inserir nos campos Placa, Marca, Cor, Modelo, Numero do Veículo e Observação os valores: 'TST5678', 'VWiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 'Vermelhoiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 'Foxiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', '888' e 'Alterado pela automação'
        When Clicar no botão Salvar.
        Then O veículo deve ser alterado com sucesso: 'Veículo alterado com sucesso!'

   
    @verifyValuesAfterEditVehicle
    Scenario: verifyValuesAfterEditVehicle
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'TST5678'
        When Obter os valores dos campos Placa, Marca, Cor, Modelo, Numero do Veículo e Observação
        Then Devem ser exatamente os valores que foram alterados 'TST5678', 'VWiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 'Vermelhoiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 'Foxiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', '888' e 'Alterado pela automação'

    @verifyFieldMarcaLength
    Scenario:verifyFieldMarcaLength
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'TST5678'
        When Obter o tamanho dos campos Marca, Cor e Modelo
        Then Devem ser exatamente os valores '50', '50' e '50'



#Alterações da versão 3.28 do AcessoII

@fieldSemPararRequiredTagNumber
    Scenario: fieldSemPararRequiredTagNumber
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão buscar tag
        Given Que aperte em Ok no popup
        Given Que preencha os campos Número da TAG, Dígito e Pessoa responsável com '', '1' e '1 - Pessoa 1'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Tag 'Informe o Número da TAG'

    @fieldSemPararRequiredDigVerify
    Scenario: fieldSemPararRequiredDigVerify
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão buscar tag
        Given Que aperte em Ok no popup
        Given Que preencha os campos Número da TAG, Dígito e Pessoa responsável com '1111111111', '' e '1 - Pessoa 1'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo Digito 'Dígito inválido'

    @fieldSemPararRequiredPerson
    Scenario: fieldSemPararRequiredPerson
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão buscar tag
        Given Que aperte em Ok no popup
        Given Que preencha os campos Número da TAG, Dígito e Pessoa responsável com '1111111111', '1' e 'Selecione'
        When Clicar no botão Salvar
        Then Deve ver a mensagem no campo responsável 'Informe a Pessoa responsável'
    
    @fieldSemPararInformationsAddress
    Scenario: fieldSemPararInformationsAddress
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com '', '1', 'testeComplemento', 'testeBairro', 'São Paulo', '11111111' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo logradouro 'Informe o Logradouro' 

    @fieldSemPararInformationsNumber
    Scenario: fieldSemPararInformationsNumber
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '', 'testeComplemento', 'testeBairro', 'São Paulo', '11111111' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo número 'Informe o Número'

    @fieldSemPararInformationsNeighborhood
    Scenario: fieldSemPararInformationsNeighborhood
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '1', 'testeComplemento', '', 'São Paulo', '11111111' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo bairro 'Informe o Bairro'

    @fieldSemPararInformationsCity
    Scenario: fieldSemPararInformationsCity
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '1', 'testeComplemento', 'testeBairro', '', '11111111' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo cidade 'Informe a Cidade'

    @fieldSemPararInformationsCEP
    Scenario: fieldSemPararInformationsCEP
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '1', 'testeComplemento', 'testeBairro', 'São Paulo', '' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo CEP 'Informe o CEP'

    @fieldSemPararInformationsUF
    Scenario: fieldSemPararInformationsUF
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '1', 'testeComplemento', 'testeBairro', 'São Paulo', '11111111' e 'Selecione'
        When Clicar no botão Salvar da tela de Informações
        Then Deve ver a mensagem no campo UF 'Informe a UF'


    @fieldSemPararAllInformations
    Scenario: fieldSemPararAllInformations
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que marque o campo 'Integração com o sistema SEM PARAR'
        Given Que aperte o botão buscar tag
        Given Que aperte em Ok no popup
        Given Que preencha os campos Número da TAG, Dígito e Pessoa responsável com '3333333333', '1' e '1 - Pessoa 1'
        Given Que aperte o botão 'Informações'
        Given Que preencha os campos Logradouro, Número, Complemento, Bairro, Cidade, CEP e UF com 'TesteEndereço', '1', 'testeComplemento', 'testeBairro', 'São Paulo', '11111111' e 'São Paulo'
        When Clicar no botão Salvar da tela de Informações
        And Clicar no botão Salvar
        Then Deve ver a mensagem 'Veículo alterado com sucesso!'


    @fieldSemPararUncheck
    Scenario: fieldSemPararUncheck
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Faço a busca e clico no botão alterar do veículo: 'AUT1234'
        Given Que desmarque o campo 'Integração com o sistema SEM PARAR'
        When Clicar no botão Salvar
        Then Deve ver a mensagem 'Veículo alterado com sucesso!'




        

    