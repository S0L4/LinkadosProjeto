*** Settings ***
Documentation   Esse é um projeto entregavel do grupo Linkados para a empresa Linx sobre automacao de testes
Library         SeleniumLibrary

*** Variable ***
#Variaveis usaveis em todos os testes
${Navegador}        chrome
${URL_Home}         https://share.linx.com.br/#all-updates

#Variaveis usadas no teste 1

#Variaveis usadas no teste 2
${Link_Login}       id:login-link
${Input_Usario}     id:os_username
${Input_Senha}      id:os_password
&{Login}            usuario=xcenter.cust.robot  senha=KWoa2a.+a3Q39azF
${Botao_Login}      id:loginButton

#Variaveis usadas no teste 3

#Variaveis usadas no teste 4
${Link_DirEspaco}   class:all-spaces-link
${Input_Espaco}     id:space-search-query
@{Espaco}           Farma  Automotivo
${Link_Espaco}      xpath://a[contains(text(),'Automotivo')]
${Link_Paginas}     class:acs-nav-item-label

#Variaveis usadas no teste 5
${Nav_Espacos}      xpath://a[contains(text(),'Espaços')]
${Link_CriarPag}    id:quick-create-page-button
${Titulo_Pag}       xpath://input[@id='content-title']
${Botao_Public}     xpath://button[@id='rte-button-publish']

#Variaveis usadas no teste 6
${Nav_Portais}      xpath://span[@class='entry nolink']
${Link_Cliente}     xpath://a[contains(text(),'Portal Clientes')]

*** Test Cases ***
Validar se a ferramenta esta acessivel (home page- status 200)
    Acessar o site da Share Linx
    Finalizar teste

Teste de login
    Acessar o site da Share Linx
    Acessar a pagina de login
    Inserir dados para o login
    Realizar login
    Finalizar teste

Validar se a home page e exibida corretamente (pagina inicial - responsivo/web)
    Acessar o site da Share Linx
    Efetuar login e chegar ao menu principal
    Tranformar a janela em um modelo responsivo
    Finalizar teste

Validar se e possivel pesquisar por paginas espacos
    Acessar o site da Share Linx
    Acessar o diretorio de espacos
    Procurar e acessar um espaco
    Procurar e acessar uma pagina
    Finalizar teste

Validar se e possivel cirar paginas (Workspace TESTE)
    Acessar o site da Share Linx
    Efetuar login e chegar ao menu principal
    Criar uma pagina para teste
    Finalizar teste

Validar se os menus da home page estao funcionais (EX: RH online)
    Acessar o site da Share Linx
    Efetuar login e chegar ao menu principal
    Acessar a pagina do cliente
    Finalizar teste

*** Keywords ***
#Keywords usaveis em todos os testes
Acessar o site da Share Linx
    Open Browser  ${URL_Home}  ${Navegador}
    Maximize Browser Window
    Sleep  5s

Finalizar teste
    Close Browser

Efetuar login e chegar ao menu principal
    Click Element  ${Link_Login}
    Sleep  3s
    Input Text  ${Input_Usario}  &{Login}[usuario]
    Sleep  1s
    Input Text  ${Input_Senha}  &{Login}[senha]
    Sleep  1s
    Click Element  ${Botao_Login}
    Sleep  5s

#Keywords usadas no teste 1

#Keywords usadas no teste 2
Acessar a pagina de login
    Click Element  ${Link_Login}
    Sleep  2s

Inserir dados para o login
    Input Text  ${Input_Usario}  &{Login}[usuario]
    Sleep  1s
    Input Text  ${Input_Senha}  &{Login}[senha]
    Sleep  1s

Realizar login
    Click Element  ${Botao_Login}
    Sleep  5s

#Keywords usadas no teste 3
Tranformar a janela em um modelo responsivo
    Set Window Size  500  800
    Sleep  7s
    Maximize Browser Window
    Sleep  5s

#Keywords usadas no teste 4
Acessar o diretorio de espacos
    Click Element  ${Link_DirEspaco}
    Sleep  3s

Procurar e acessar um espaco
    Input Text  ${Input_Espaco}  @{Espaco}[0]
    Sleep  2s
    Clear Element Text  ${Input_Espaco}
    Sleep  2s
    Input Text  ${Input_Espaco}  @{Espaco}[1]
    Sleep  2s
    Click Link  ${Link_Espaco}
    Sleep  2s

Procurar e acessar uma pagina
    Click Element  ${Link_Paginas}
    Sleep  5s

#Keywords usadas no teste 5
Criar uma pagina para teste
    Click Element  ${Nav_Espacos}
    Sleep  2s
    Click Element  ${Link_CriarPag}
    Sleep  2s
    Input Text     ${Titulo_Pag}  Workspace TESTE
    Sleep  2s
    Click Element  ${Botao_Public}
    Sleep  20s

#Keywords usadas no teste 6
Acessar a pagina do cliente
    Mouse Over     ${Nav_Portais}
    Sleep  2s
    Click Element  ${Link_Cliente}
    Sleep  5s


