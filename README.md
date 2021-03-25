##########################################
#####AUTOMAÇÃO NEWACCESSII / MDACESSO#####
##########################################


################################################################################
Data: 24/03/2021

Projeto de automação de testes web para o sistema DMPAccessII / MDAcesso com Capybara e Ruby.
Inicialmente os testes serão realizados utilizando uma empresa de teste na nuvem, onde para conseguir
executar o projeto será necessário informar o login e senha corretos.
Priorizaremos algumas telas, são elas:

1. Login

2. Ambiente de Sistema
	- Configuração de Sistema

3. Pessoas
	- Cadastro de Pessoa

4. Visitante
	- Cadastro de visitante

Abaixo segue uma lista de casos que serão implementados para cada tela do sistema:

- Validar os nomes/labels dos campos (todos os possíveis) afim de encontrar qualquer problema em seu resource.
- Validar todo tipo de campo:
	- checkbox
		- validar marcado
		- validar desmarcado
		- validar obrigatoriedade (quando for obrigatório preenchimento)
	- radiobutton
		- validar marcado
		- validar desmarcado
		- validar obrigatoriedade (quando for obrigatório preenchimento)
	- dropbox
		- validar as opções apresentadas
		- salvar cadastro com cada uma das opções para o campo
		- validar obrigatoriedade (quando for obrigatório preenchimento)
	- inputs
		- validar campo de data
		- validar quantidade de caracteres
		- validar tipo de aceitação no campo
		- validar obrigatoriedade (quando for obrigatório preenchimento)
- Salvar
- Validar informações salvas (validando o cadastro do registro salvo)
- Validar informações persistidas no BD quando salvas

################################################################################
