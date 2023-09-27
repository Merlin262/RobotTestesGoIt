*** Settings ***
Documentation    Essa suíte testa o site GO It para os casos de Cadastro e Cadastro com Apelido invalido
Resource         CadastroPraticante_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT1 - Realizar Cadastro
	[Documentation]    Esse teste verifica o Cadastro de um novo usuário
	Acessar a pagina home do site
	Clicar em Cadastre-se
	Selecionar tipo de usuário Praticante
	Preencher tela de Cadastro
	Confirmação de sucesso no Cadastro


CT2 - Apelido já cadastrado
	[Documentation]    Esse teste verifica o Cadastro de um apelido já cadastrado
	Acessar a pagina home do site
	Clicar em Cadastre-se
	Selecionar tipo de usuário Praticante
	Preencher tela de Cadastro com aplido invalido
	Apelido invalido
