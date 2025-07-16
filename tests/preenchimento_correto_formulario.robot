# Settings é onde importo todas as bibliotecas que vou utilizar
# Pelo que entendi esta aula está no padrao BDD. 
*** Settings ***

Library    SeleniumLibrary
Resource    setup_teradown.robot
Test Setup    Dado acessa o siste
Test Teardown    Fechar navegador

# variables é como se fosse uma classe talvez, mas ela é direcionada em um campo especifico. 
*** Variables ***  

${campo_nome}    id:form-nome
${campo_cargo}    id:form-cargo
${campo_imagem}    id:form-imagem 
${campo_time_lista_suspensa}    class:lista-suspensa 
${botao_criar_card}    id:form-botao 
${cargo_programacao}    //option[contains(.,'Programação')]
${cargo_front-end}    //option[contains(.,'Front-End')]
${cargo_dados}    //option[contains(.,'Data Science')]
${cargo_devops}    //option[contains(.,'Devops')]
${cargo_ux}    //option[contains(.,'UX e Design')]
${cargo_mobile}    //option[contains(.,'Mobile')]
${cargo_inovacao}    //option[contains(.,'Inovação')]


# Keywords ao veu ver como se fosse criação de uma funcao, mas com sua particularidade
*** Keywords *** 

Dado preencha os campos do formulário
   Input Text    ${campo_nome}    Vitor 
   Input Text    ${campo_cargo}    QA 
   Input Text    ${campo_imagem}    https://picsum.dev/300/200
   Click Element    ${campo_time_lista_suspensa} 
   Click Element    ${cargo_programacao} 
E clique no botão "Criar Card"
    Click Button    ${botao_criar_card}
    Sleep    10s
Então identificar o card no time esperado    
    Element Should Be Visible    class:colaborador

# test cases é o ambiente de execução, pensa como se fosse o main(){ codigo fonte } em Dart
*** Test Cases ***

Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time escolhido
     Dado preencha os campos do formulário
     E clique no botão "Criar Card"
     Então identificar o card no time esperado