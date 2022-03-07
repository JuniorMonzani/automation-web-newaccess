class Constants

    #constante com os valores contidos no dropbox 'Fuso horário' - Grupo de Eqp
    $TIME_ZONE = ['-12:00', '-11:45', '-11:30', '-11:15', '-11:00', '-10:45', '-10:30', '-10:15', '-10:00', '-09:45', '-09:30', '-09:15', '-09:00', '-08:45', '-08:30',
        '-08:15', '-08:00', '-07:45', '-07:30', '-07:15', '-07:00', '-06:45', '-06:30', '-06:15', '-06:00', '-05:45', '-05:30', '-05:15', '-05:00', '-04:45',
        '-04:30', '-04:15', '-04:00', '-03:45', '-03:30', '-03:15', '-03:00', '-02:45', '-02:30', '-02:15', '-02:00', '-01:45', '-01:30', '-01:15', '-01:00',
        '-00:45', '-00:30', '-00:15', '00:00', '00:15', '00:30', '00:45', '01:00', '01:15', '01:30', '01:45', '02:00', '02:15', '02:30', '02:45', '03:00', '03:15',
        '03:30', '03:45', '04:00', '04:15', '04:30', '04:45', '05:00', '05:15', '05:30', '05:45', '06:00', '06:15', '06:30', '06:45', '07:00', '07:15', '07:30',
        '07:45', '08:00', '08:15', '08:30', '08:45', '09:00', '09:15', '09:30', '09:45', '10:00', '10:15', '10:30', '10:45', '11:00', '11:15', '11:30', '11:45', '12:00']

    #constante com os valores contidos no dropbox 'Controla sorteio' quando a área destino está habilitada - Grupo de Eqp
    $CONTROL_SORTITION_HAS_DESTINATION_AREA = ['Nenhum', 'Área origem', 'Área destino', 'Ambos']

    #constante com os valores contidos no dropbox 'Controla sorteio' quando a área destino não está habilitada - Grupo de Eqp
    $CONTROL_SORTITION_NO_HAS_DESTINATION_AREA = ['Nenhum', 'Área origem']

    #constante com os valores contidos no dropbox de filtro de pesquisa - Grupo de Eqp
    $FILTER_SEARCH_EQUIPMENT_GROUP = ['Número', 'Descrição', 'Nº da área', 'Nº do equipamento']

    #constante com os valores contidos no dropbox 'Autenticação' - Tipo de Credencial no cadastro
    $REGISTER_CREDENTIAL_TYPE_AUTHENTICATION = ['Pessoa', 'Visitante', 'Credencial']

    #constante com os valores contidos no dropbox 'Autenticação' - Tipo de Credencial na exclusão
    $DELETE_CREDENTIAL_TYPE_AUTHENTICATION = ['Todos', 'Pessoa', 'Visitante', 'Credencial']

    #constante com os valores contidos no dropbox de pesquisa - Cadastro de Área na exclusão
    $DELETE_AREAS_SEARCH = ['Número', 'Descrição']

    #constante com os valores contidos no dropbox 'Tecnologia' - Cadastro de credecial
    $REGISTER_TECHNOLOGYTYPE = ['Código de Barras', 'Cartão Magnético', 'Proximidade', 'SmartCard', 'RFID']

    #constante com os valores contidos no dropbox 'Tipo' - Cadastro de credecial
    $REGISTER_TYPE = ['Pessoa', 'Visitante', 'Credencial', 'TESTE_TAMANHO_PESSOA_WWWWWWWWWWWWWWWWWWWWWWWWWWWWW', 'TESTE_TAMANHO_VISITANTE_WWWWWWWWWWWWWWWWWWWWWWWWWW', 'TESTE_TAMANHO_CREDENCIAL_WWWWWWWWWWWWWWWWWWWWWWWWW']

    #constante com os valores contidos no dropbox 'Empresa' - Cadastro de credecial
    $REGISTER_COMPANY = ['Selecione', 'Estrutura Teste 1', 'Estrutura Teste 2', 'Estrutura Teste 3', 'Estrutura Teste 4', 'Estrutura Teste 5', 'Estrutura Teste 6']

     #constante com os valores contidos no dropbox 'Master' - Cadastro de credecial
     $REGISTER_MASTER = ['Não', 'Sim', 'Sim, no perfil']
end