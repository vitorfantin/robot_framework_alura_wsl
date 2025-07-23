*** Settings ***
Resource    ../main.robot
# variables é como se fosse uma classe talvez, mas ela é direcionada em um campo especifico. 
*** Variables ***  

${campo_nome}    id:form-nome
${campo_cargo}    id:form-cargo
${campo_imagem}    id:form-imagem 
${campo_time_lista_suspensa}    class:lista-suspensa 
${botao_criar_card}    id:form-botao 
@{lista_times}    
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação')]


# Keywords ao veu ver como se fosse criação de uma funcao, mas com sua particularidade
*** Keywords *** 

Dado preencha os campos do formulário
    ${Nome_Faker}    FakerLibrary.First Name
    ${Cargo_Faker}   FakerLibrary.Job
    ${Imagem_Faker}    FakerLibrary.Image Url    width=100    height=100

    Input Text    ${campo_nome}    ${Nome_Faker} 
    Input Text    ${campo_cargo}    ${Cargo_Faker}
    Input Text    ${campo_imagem}    ${Imagem_Faker}
    Click Element    ${campo_time_lista_suspensa} 
    Click Element    ${lista_times}[0]
E clique no botão "Criar Card"
    Click Button    ${botao_criar_card}
   
Então identificar o card no time esperado    
    Element Should Be Visible    class:colaborador

Criação de 3 cards em laço for
    FOR    ${i}    IN RANGE    0    3    
        Dado preencha os campos do formulário
        E clique no botão "Criar Card"
    END    
    

Então criar e identificar 1 card em cada time disponivel
    FOR    ${index}    ${time_desenvolvimento}    IN ENUMERATE    @{lista_times}
        Dado preencha os campos do formulário
        Click Element    ${time_desenvolvimento}
        E clique no botão "Criar Card"              
    END
