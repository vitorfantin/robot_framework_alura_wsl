*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Acessar Página do Organo(projeto interno em nodejs)
    Open Browser    http://localhost:3000/   chrome
    Input Text    id:form-nome    Vitor
    Input Text    id:form-cargo   QA
    Input Text    id:form-imagem    https://picsum.dev/300/200
    Click Element    class: lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador
    Sleep    30s
