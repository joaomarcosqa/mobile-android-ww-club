***Settings***
Resource    ../resources/account_informations.resource

Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo

Documentation
...    Suite de testes destinada aos testes das informações da conta. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.


***Test Cases***
Cenário 01: Alteração do nome do usuário
    Dado que acesso a tela de informações da conta
    Quando realizar a alteração do nome do usuário
    Então o usuário deverá receber um aviso de sucesso na alteração

Cenário 02: Alteração do sobrenome do usuário
    Dado que acesso a tela de informações da conta
    Quando realizar a alteração do sobrenome do usuário
    Então o usuário deverá receber um aviso de sucesso na alteração

Cenário 03: Alteração do sexo do usuário
    Dado que acesso a tela de informações da conta
    Quando realizar a alteração do sexo do usuário
    Então o usuário deverá receber um aviso de sucesso na alteração

Cenário 04: Alteração da senha do usuário
    Dado que acesso a tela de informações da conta
    Quando realizar a alteração da senha do usuário
    Então o usuário deverá receber um aviso de sucesso na alteração de senha

Cenário 05: Inserção de um novo CPF
    Dado que acesso a tela de informações da conta com uma nova conta
    Quando realizar a inserção de um novo CPF
    Então o usuário deverá receber um aviso de sucesso na alteração

Cenário 06: Campo de sexo do usuário vazio
    Dado que acesso a tela de informações da conta
    Quando não preencher o campo de sexo do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 07: Campo de CPF do usuário vazio
    Dado que acesso a tela de informações da conta com uma nova conta
    Quando não preencher o campo de CPF do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 08: Campo de nome do usuário vazio
    Dado que acesso a tela de informações da conta
    Quando não preencher o campo de nome do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 09: Campo de sobrenome do usuário vazio
    Dado que acesso a tela de informações da conta
    Quando não preencher o campo de sobrenome do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 10: Campo de e-mail do usuário vazio
    Dado que acesso a tela de informações da conta
    Quando não preencher o campo de e-mail do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 11: Campo de data de nascimento vazia
    Dado que acesso a tela de informações da conta com uma nova conta
    Quando não preencher o campo de data de nascimento do usuário
    Então o usuário deverá receber um aviso de campo obrigatório

Cenário 12: Inserção de nome inválido
    Dado que acesso a tela de informações da conta
    Quando realizar a inserção de um nome inválido
    Então o usuário deverá receber um aviso de nome inválido

Cenário 13: Inserção de sobrenome inválido
    Dado que acesso a tela de informações da conta
    Quando realizar a inserção de um sobrenome inválido
    Então o usuário deverá receber um aviso de sobrenome inválido

Cenário 14: Inserção de e-mail inválido
    Dado que acesso a tela de informações da conta
    Quando realizar a inserção de um e-mail inválido
    Então o usuário deverá receber um aviso de e-mail inválido
