<div>
  <img src="https://img.shields.io/github/last-commit/JuniorMonzani/automation-web-newaccess">
  <img src="https://img.shields.io/github/repo-size/JuniorMonzani/automation-web-newaccess">
  <img src="https://img.shields.io/github/contributors/JuniorMonzani/automation-web-newaccess">
  <img src="https://img.shields.io/github/stars/JuniorMonzani/automation-web-newaccess?style=social">
</div>

# Projeto Automação de Testes NewAccess

Este projeto realiza testes no sistema web NewAccess passando por diversos tipos de validações e cenários, utilizando linguagem Ruby juntamente com o framework Capybara e Cucumber. Em conjunto com esse objetivo, todo o projeto tem como precedente a metodologia ágil e o clean code.

## O que é Ruby, Capybara e Cucumber?

  ### Ruby:  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.svg" width="20" height="20"/>
      
  * <a href="https://www.ruby-lang.org/pt/">Ruby</a> é uma linguagem interpretada e orientada a objetos com tipagem dinâmica e forte. Ou seja, ela é capaz de definir os tipos de uma variável ou uma função, de acordo com os valores que recebe.

     Além disso, conta com gerenciamento de memória automático, o que significa uma melhor otimização e performance da aplicação.

     Ruby é uma linguagem de script, open source e multiplataforma. Portanto, pode ser utilizada em diversos ambientes, como Windows, Linus, Unix, macOS, entre outros. 

  ### Capybara:
  * <a href="https://github.com/teamcapybara/capybara">Capybara</a> é um framework de automação de testes em aplicações web, open-source, e escrito em Ruby. Com ele é possível testar as aplicações simulando as ações que os usuários reais executariam.
   
    Ele abstrai a conexão entre o navegador e o código e realiza a simulação das ações dos usuário utilizando-se de frameworks que controlam navegadores e que simulam a execução dos mesmos em memória, tornando mais rápida a execução dos testes.
   
    Alguns exemplos de ações simuladas seriam: Acessar URLs, Preencher campos, Clicar, Verificar se valores foram apresentados na tela, etc.
      
  
 ### Cucumber:  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cucumber/cucumber-plain.svg" width="20" height="20"/>  
          
 * O <a href="https://cucumber.io/">Cucumber</a> é uma ferramenta que suporta Behavior Driven Development (BDD), visando integrar regras de negócios com linguagem de programação . Dessa forma, as necessidades reais do usuário são descritas focando o comportamento do software.
   
    Cucumber é usado para descrever o valor do negócio em uma linguagem natural, por isso permite que equipes de desenvolvimento de software descrevam como o software deve se comportar em texto simples, escrevendo especificações através de exemplos.
    
## Sobre o projeto:

O projeto de automação de teste tem o objetivo de realizar validações em todas as páginas web do sistema, testando todas suas funcionalidades, campos, botões, resources, mensagens e validando a regra de negócio.

Abaixo um diagrama de todas as telas do sistema e o andamento do projeto:

<p align="center">
  <img src="imgs\EAP_AutomacaoNewAccess.png">
</p>

### As Features:

* As features do projeto são escritas separadas por tela e por ação que seja possível realizar como criação, alteração, cópia e exclusão. A escrita da feature é baseada no <a href="https://cucumber.io/docs/gherkin/">Gherkin</a> onde sua função é padronizar a forma de descrever especificações de cenários, baseado na regra de negócio.
  
  Exemplo de feature:
  
<p align="center">
  <img src="imgs/ExemploFeature.png">
</p>


### A Codificação:

* Utilizando a linguagem Ruby e elementos do framework Capybara escrevemos o código atendendo os cenários de teste descritos nas features, atentando-se para uma escrita simples e com possibilidade de reuso dentro das validações do projeto.

  Exemplo de codificação e estrutura do projeto:

  <p align="center">
  <img src="imgs\ExemploCodificacao.png">
  </p>
  
  
### A Execução:

* A execução dos testes pode ser realizada dês de um único cenário de teste, por uma determinada tela ou até executando o projeto como um todo. Para termos uma execução de forma periódica e controlada, criamos em um servidor CI - <a href="https://www.jenkins.io/">Jenkins</a> - uma rotina diária de execução de todos os cenários implementados.

  Após a execução do projeto um relatório é criado e disponibilizado para consulta, além disso, uma notificação informando sucesso ou falha na execução é enviada via <a href="https://discord.com/">Discord</a> para um grupo que contém os membros do projeto.

  Exemplo de execução, notificação e relatório:

<div>
  <p>
  <img src="imgs\ExemploJenkins.png" width="300" height="220">
  <img src="imgs\ExemploExecucao.png" width="300" height="220">
  </p>
  <p>
  <img src="imgs\ExemploNotificacao.png" width="300" height="220">
  <img src="imgs\ExemploRelatorio.png" width="300" height="220">
  </p>
</div>  

## Estatísticas do Projeto

<div align="center">
  <a href="https://github.com/JuniorMonzani">
    <img height="160em" src="https://github-readme-stats.vercel.app/api/top-langs/?username=JuniorMonzani&layout=compact&langs_count=7&theme=tokyonight" width="300"/>
    <img height="160em" src="https://github-readme-stats.vercel.app/api?username=JuniorMonzani&show_icons=true&theme=tokyonight&include_all_commits=true&count_private=true" width="300"/>
  </div>
