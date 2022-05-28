***Settings***
Resource    ../resources/register.resource

Test Setup        Abrir o aplicativo
Test Teardown     Fechar o aplicativo

Documentation
...    Suite de testes destinada aos testes de Cadastro. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.


***Test Cases***
Cenário 01: Fluxo de Cadastro bem sucedido
    Dado que acesse a página de Cadastro
    Quando preencher email e senha validos
    E aceitar os termos de uso
    E clicar em Cadastrar
    Entao verei a Homepage do app

Cenário 02: Fluxo de Cadastro mal sucedido por e-mail em formato inválido
    Dado que acesse a página de Cadastro
    Quando preencher email invalido e senha valida
    E aceitar os termos de uso
    E clicar em Cadastrar
    Entao verei a mensagem "Por favor, insira um e-mail válido"

Cenário 03: Fluxo de Cadastro mal sucedido por senha inferior a 6 caracteres
    Dado que acesse a página de Cadastro
    Quando preencher email valido e senha inferior a 6 caracteres
    E aceitar os termos de uso
    E clicar em Cadastrar
    Entao verei a mensagem "A senha precisa ter no mínimo 6 caracteres"

Cenário 04: Fluxo de Cadastro mal sucedido por e-mmail não preenchido
    Dado que acesse a página de Cadastro
    Quando não digitar email e digitar senha valida
    E aceitar os termos de uso
    E clicar em Cadastrar
    Entao verei a mensagem "Por favor, insira um e-mail válido"

Cenário 05: Fluxo de Cadastro mal sucedido por senha não preenchida
    Dado que acesse a página de Cadastro
    Quando não digitar a senha e digitar um email valido
    E aceitar os termos de uso
    E clicar em Cadastrar
    Entao verei a mensagem "A senha precisa ter no mínimo 6 caracteres"

Cenário 06: Fluxo de Cadastro sem aceitar os Termos de uso
    Dado que acesse a página de Cadastro
    Quando Preencher email e senha validos
    E não aceitar os termos de uso
    Entao Verei a mensagem de Aceite dos termos de uso "Você deve aceitar os Termos de Uso e Política de Privacidade para continuar com o cadastro"