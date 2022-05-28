***Settings***
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/login_locators.py


***Keywords***
Dado que estou na tela de login
    Sleep                            5                             reason=Aguardando renderização dos botoes de cadastro e login
    Click element                    ${OPEN_LOGIN_MODAL_BUTTON}
    Wait until element is visible    ${EMAIL_OR_CPF_TEXTFIELD}     10


Quando inserir informações válidas com e-mail
    Run Keyword    Preencher informações de login    qa.test.user@westwing.com.br    123@westwingbr

Então o usuário deverá ser logado
    Wait until page contains    Campanhas atuais    10

Quando inserir um e-mail válido junto a senha inferior a 6 caracteres
    Run Keyword    Preencher informações de login    qa.test.user@westwing.com.br    1234

Então o usuário não deverá ser logado
    Wait until page contains    ${LOGIN_BUTTON}    10

E o sistema deverá exibir “Por favor, forneça pelo menos 6 caracteres“
    Wait until page contains    Por favor, forneça pelo menos 6 caracteres    10

Quando inserir informações válidas com e-mail em formato inválido
    Run Keyword    Preencher informações de login    qa.test.user    123@westwingbr

E o sistema deverá exibir “Por favor, insira um e-mail válido“
    Wait until page contains    Por favor, insira um e-mail válido    10

Quando inserir um e-mail não cadastrado na base de dados junto a senha válida
    Run Keyword    Preencher informações de login    qa.test.user@naocadastrado.com    123@westwingbr

E o sistema deverá exibir “Senha ou e-mail incorreto“
    Wait until page contains    Senha ou e-mail incorreto    10

Quando inserir um e-mail válido junto a senha errada
    Run Keyword    Preencher informações de login    qa.test.user@westwing.com.br    123@westwing

Quando inserir informações válidas com CPF
    Run Keyword    Preencher informações de login    67676707072    123@westwingbr

Quando inserir um CPF válido junto a senha inferior a 6 caracteres
    Run Keyword    Preencher informações de login    67676707072    123

Quando inserir informações válidas com CPF em formato inválido
    Run Keyword    Preencher informações de login    67676707073    123@westwing

E o sistema deverá exibir “Por favor, insira um CPF válido“
    Wait until page contains    Por favor, insira um CPF válido    10

Quando inserir CPF não cadastrado na base de dados junto a senha válida
    Run Keyword    Preencher informações de login    33908208092    123@westwingbr

E o sistema deverá exibir “Senha ou CPF incorreto“
    Wait until page contains    Senha ou CPF incorreto    10

Quando inserir CPF válido junto a senha errada
    Run Keyword    Preencher informações de login    67676707072    123@westwing

Quando clicar em “Faça o Login”
    Click element    ${LOGIN_BUTTON}

Então o sistema deverá exibir “Por favor, insira um e-mail ou CPF válido“
    Wait until page contains    Por favor, insira um e-mail ou CPF válido    10

E “Por favor, forneça pelo menos 6 caracteres”
    Wait until page contains    Por favor, forneça pelo menos 6 caracteres    10

Preencher informações de login
    [Arguments]      ${EMAIL_OR_CPF}              ${PASS}
    Input text       ${EMAIL_OR_CPF_TEXTFIELD}    ${EMAIL_OR_CPF}
    Input text       ${PASSWORD_TEXTFIELD}        ${PASS}
    Click element    ${LOGIN_BUTTON}
