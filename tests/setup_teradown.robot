*** Settings ***

Library    SeleniumLibrary

*** Keywords ***

Dado acessa o siste
   Open Browser    http://localhost:3000    chrome

Fechar navegador
    Close All Browsers