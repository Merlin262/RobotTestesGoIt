*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/GoIt/GOIT/
${VALUE_TO_SELECT}	2
${USUARIO_ATIVO}	tudoFuncionando
${APELIDO}			tudoFuncionandoAp
${DATANASC}			2002-10-22
${EMAIL}			tudoFuncionando@gmail.com
${SENHA_ATIVA}		12345678Aa#
${APELIDO_INVALIDO}	test



*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
	Capture Page Screenshot
	Close Browser

Acessar a pagina home do site
	Go To	url=${URL}

Clicar em Cadastre-se
	Click Link    css=a[href='./PAGES/usuarios/selecao_tipoUsuario.php']

Selecionar tipo de usuário Praticante
	Select From List by Value    css:Select[name=tipoUsuario] 	${VALUE_TO_SELECT}
	Click Button    //button[@type="submit" and text()="Próximo"]

Preencher tela de Cadastro
	Input Text	css:input[name=txtNome]        ${USUARIO_ATIVO}
	Input Text	css:input[name=txtApelido]        ${APELIDO}
	Input Text	css:input[name=dataNascimento]        ${DATANASC}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL}
	Input Text	css:input[name=txtSenha]          ${SENHA_ATIVA}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_ATIVA}

Confirmação de sucesso no Cadastro
	Click Button    //button[@type="submit" and text()=" Cadastrar "]
	${alert_text} =    Handle Alert 
    Should Be Equal As Strings    ${alert_text}    Cadastro realizado com sucesso!

Preencher tela de Cadastro com aplido invalido
	Input Text	css:input[name=txtNome]        ${USUARIO_ATIVO}
	Input Text	css:input[name=txtApelido]		${APELIDO_INVALIDO}
	Input Text	css:input[name=dataNascimento]        ${DATANASC}
	Click Element	css=input[id='sexo_m']
	Input Text	css:input[name=txtEmail]        ${EMAIL}
	Input Text	css:input[name=txtSenha]          ${SENHA_ATIVA}
	Input Text	css:input[name=txtSenhaConfirmada]          ${SENHA_ATIVA}

Apelido invalido
	Wait Until Page Contains Element    id=errorApelido
	${mensagem_erro}=    Get Text    id=errorApelido
	Should Be Equal As Strings    ${mensagem_erro}    Apelido já cadastrado!

