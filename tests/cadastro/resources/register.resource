from shared/libs/EmailLib.py import *

***Settings***
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource

Variables    ../../../shared/locators/login_locators.py
Variables    ../../../shared/locators/register_locators.py

Library    ../../../shared/libs/EmailLib.py


***Keywords***
Dado que acesse a página de Cadastro
    Sleep                            5                             reason=Aguardando renderização dos botoes de cadastro e login
    Click element                    ${OPEN_REGISTRATION_BUTTON}
    Wait until element is visible    ${EMAIL_OR_CPF_TEXTFIELD}     10


Quando Preencher email e senha validos
    ${email} =     get_random_email
    Run Keyword    Preencher informações de cadastro    ${email}    123@westwingbr

E aceitar os termos de uso
   Click element                    ${TERMS_CONDITIONS_BUTTONS}

E clicar em Cadastrar
    Click element                    ${REGISTER_BUTTON}

Entao verei a Homepage do app
    Wait until page contains    Campanhas atuais    10

Quando preencher email invalido e senha valida
    Run Keyword    Preencher informações de cadastro    emailinvalido    123456

Entao verei a mensagem "Por favor, insira um e-mail válido"
    Wait until page contains    Por favor, insira um e-mail válido    10

Quando preencher email valido e senha inferior a 6 caracteres
    ${email} =     get_random_email
    Run Keyword    Preencher informações de cadastro    ${email}    123

Entao verei a mensagem "A senha precisa ter no mínimo 6 caracteres"
    Wait until page contains    Por favor, forneça pelo menos 6 caracteres    10

Quando não digitar email e digitar senha valida
    Input text       ${PASSWORD_TEXTFIELD}        123456

Quando não digitar a senha e digitar um email valido
    ${email} =     get_random_email
    Input text     ${EMAIL_OR_CPF_TEXTFIELD}       ${email} 

E não aceitar os termos de uso
    Click element    ${REGISTER_BUTTON}

Entao Verei a mensagem de Aceite dos termos de uso "Você deve aceitar os Termos de Uso e Política de privacidade para continuar com o cadastro"
    Wait until page contains     Você deve aceitar os Termos de Uso e Política de Privacidade para continuar com o cadastro

Preencher informações de cadastro
    [Arguments]      ${EMAIL_OR_CPF}              ${PASS}
    Input text       ${EMAIL_OR_CPF_TEXTFIELD}    ${EMAIL_OR_CPF}
    Input text       ${PASSWORD_TEXTFIELD}        ${PASS}
    Click element    ${REGISTER_BUTTON}