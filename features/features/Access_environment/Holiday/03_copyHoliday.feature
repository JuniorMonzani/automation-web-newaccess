@copyHoliday
Feature: Copy Holiday
    Como um usuário do sistema que tenha permissão para Copiar Feriado.

    Background:
        Given Que o usuário esteja na página que lista os feriados cadastrados.

    @verifyValueDescriltionCopyHoliday
    Scenario: verifyValueDescriltionCopyHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com o mês 'Dezembro'.
        When Clicar no botão de cópia do feriado cadastrado pela automação.
        Then O cadastro apresentado não deve ter valor no campo Descrição.

    @verifyValueDateCopyHoliday
    Scenario: verifyValueDateCopyHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com o mês 'Dezembro'.
        When Clicar no botão de cópia do feriado cadastrado pela automação.
        Then O cadastro apresentado não deve ter valor no campo Data.

    @verifyValueGroupCopyHoliday
    Scenario: verifyValueGroupCopyHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com o mês 'Dezembro'.
        When Clicar no botão de cópia do feriado cadastrado pela automação.
        Then O feriado deve ter associado o grupo '2 - Laboratorio'.

    @saveCopyHoliday
    Scenario: saveCopyHoliday
        Given Que desmarque o checkbox 10 últimas atualizações.
        Given Buscar e encontrar o feriado cadastrado pela automação com o mês 'Dezembro'.
        Given Clicar no botão de cópia do feriado cadastrado pela automação.
        When Preencher os campos Descrição e Data com 'Feriado Copia Auto' e '20/12'
        And Clicar em 'Salvar'
        Then Deve ver a mensagem 'Feriado salvo com sucesso!'
