@copyWorkingTime
Feature: Copy Working Time
    Como um usuário do sistema que tenha permissão para Copiar Jornada.

    Background:
        Given Que o usuário esteja na página que lista as Jornadas cadastradas.

    @verifyValueDescriptionCopyWorkingTime
    Scenario: verifyValueDescriltionCopyWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrado pela automação com a descrição 'TesteAutomação'
        When Clicar no botão de cópia da jornada cadastrado pela automação.
        Then O cadastro apresentado não deve ter valor no campo Descrição.

    @saveCloneWorkingTime
    Scenario: saveCloneWorkingTime
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar a jornada cadastrado pela automação com a descrição 'TesteAutomação'
        When Clicar no botão de cópia da jornada cadastrado pela automação.
        And Preencher o campo Descrição com 'TesteAutomaçãoClone'
        And Clicar no botão 'Salvar'
        Then Deve ver a mensagem: 'Jornada Cadastrar com sucesso'
        

    