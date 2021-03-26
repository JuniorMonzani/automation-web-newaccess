
#Automação DMPAccessII / MDAcesso 

-------------------------------------------------------------------------------
Data: 26/03/2021

Projeto de automação de testes web para o sistema DMPAccessII / MDAcesso com linguagem Ruby e frameworks RSpec e Capybara.
Inicialmente os testes serão realizados utilizando uma empresa de teste na nuvem, onde para conseguir executar o projeto
será necessário informar o login e senha corretos.

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
- Alterar
- Excluir

-------------------------------------------------------------------------------
