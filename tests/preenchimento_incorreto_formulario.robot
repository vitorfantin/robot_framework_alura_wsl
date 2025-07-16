*** Settings ***
Library    SeleniumLibrary
Resource    setup_teradown.robot
Test Setup    Dado acessa o siste
Test Teardown    Fechar navegador


*** Variables ***

${botao_criar_card}    id:form-botao

*** Keywords ***
Dado que eu clico no botao criar card
    Click Button    ${botao_criar_card}
*** Test Cases ***

Entao sistema precisa mostrar os erros dos campos obrigatorios
    Dado que eu clico no botao criar card
    Element Should Be Visible    id:form-nome-erro 
    Element Should Be Visible    id:form-cargo-erro 
    Element Should Be Visible    id:form-times-erro 
