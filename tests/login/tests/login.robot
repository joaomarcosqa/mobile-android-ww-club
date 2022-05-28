***Settings***
Resource    ../resources/login.resource

Test Setup        Abrir o aplicativo
Test Teardown     Fechar o aplicativo

Documentation
...    Suite de testes destinada aos testes de Login. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.


***Test Cases***
Cenário 01: Fluxo de login bem sucedido com e-mail
    Dado que estou na tela de login
    Quando inserir informações válidas com e-mail
    Então o usuário deverá ser logado

Cenário 02: Fluxo de login mal sucedido com e-mail por senha inferior a 6 caracteres
    Dado que estou na tela de login
    Quando inserir um e-mail válido junto a senha inferior a 6 caracteres
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Por favor, forneça pelo menos 6 caracteres“

Cenário 03: Fluxo de login mal sucedido por e-mail em formato inválido
    Dado que estou na tela de login
    Quando inserir informações válidas com e-mail em formato inválido
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Por favor, insira um e-mail válido“

Cenário 04: Fluxo de login mal sucedido por e-mail não existente na base de dados
    Dado que estou na tela de login
    Quando inserir um e-mail não cadastrado na base de dados junto a senha válida
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Senha ou e-mail incorreto“

Cenário 05: Fluxo de login mal sucedido com e-mail por senha errada
    Dado que estou na tela de login
    Quando inserir um e-mail válido junto a senha errada
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Senha ou e-mail incorreto“

Cenário 06: Fluxo de login bem sucedido com CPF
    Dado que estou na tela de login
    Quando inserir informações válidas com CPF
    Então o usuário deverá ser logado

Cenário 07: Fluxo de login mal sucedido com CPF por senha inferior a 6 caracteres
    Dado que estou na tela de login
    Quando inserir um CPF válido junto a senha inferior a 6 caracteres
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Por favor, forneça pelo menos 6 caracteres“

Cenário 08: Fluxo de login mal sucedido por CPF em formato inválido
    Dado que estou na tela de login
    Quando inserir informações válidas com CPF em formato inválido
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Por favor, insira um CPF válido“

Cenário 09: Fluxo de login mal sucedido por CPF não existente na base de dados
    Dado que estou na tela de login
    Quando inserir CPF não cadastrado na base de dados junto a senha válida
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Senha ou CPF incorreto“

Cenário 10: Fluxo de login mal sucedido com CPF por senha errada
    Dado que estou na tela de login
    Quando inserir CPF válido junto a senha errada
    Então o usuário não deverá ser logado
    E o sistema deverá exibir “Senha ou CPF incorreto“

Cenário 11: Fluxo de login mal sucedido por campo de e-mail e senha vazios
    Dado que estou na tela de login
    Quando clicar em “Faça o Login”
    Então o sistema deverá exibir “Por favor, insira um e-mail ou CPF válido“
    E “Por favor, forneça pelo menos 6 caracteres”
