*** Settings ***
Resource    ../resources/main.robot
Test Setup    Dado acessa o siste
Test Teardown    Fechar navegador

# test cases é o ambiente de execução, pensa como se fosse o main(){ codigo fonte } em Dart
*** Test Cases ***

Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time escolhido
     Dado preencha os campos do formulário
     E clique no botão "Criar Card"
     Então identificar o card no time esperado
     Sleep    10s

Verificação dos 3 cards criados no laço FOR
    Criação de 3 cards em laço for
    Sleep    10s

Verificar criar um card para cada time com preenchimento dos campos corretamente
    Dado preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponivel
    Sleep    30s
    
