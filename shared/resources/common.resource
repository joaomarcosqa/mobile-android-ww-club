***Settings***
Library     AppiumLibrary
Resource    ../../tests/login/resources/login.resource
Resource    ../../tests/cadastro/resources/register.resource

Variables    ../../config.py

Documentation
...    Arquivo destinado a fixtures


***Keywords***
Dado que esteja logado
    Sleep                            5                             reason=Aguardando renderização dos botoes de cadastro e login
    Click element                    ${OPEN_LOGIN_MODAL_BUTTON}
    Wait until element is visible    ${EMAIL_OR_CPF_TEXTFIELD}     10
    Input text                       ${EMAIL_OR_CPF_TEXTFIELD}     ${EMAIL_OR_CPF}
    Input text                       ${PASSWORD_TEXTFIELD}         ${PASS}
    Click element                    ${LOGIN_BUTTON}
    Wait until page contains         Campanhas atuais              10

Realizar login
    [Arguments]                      ${EMAIL_OR_CPF}               ${PASS}
    Wait until element is visible    ${OPEN_LOGIN_MODAL_BUTTON}
    Click element                    ${OPEN_LOGIN_MODAL_BUTTON}
    Wait until element is visible    ${EMAIL_OR_CPF_TEXTFIELD}
    Input text                       ${EMAIL_OR_CPF_TEXTFIELD}     ${EMAIL_OR_CPF}
    Input text                       ${PASSWORD_TEXTFIELD}         ${PASS}
    Click element                    ${LOGIN_BUTTON}

Criar nova conta
    Sleep                            5                              reason=Aguardando renderização dos botoes de cadastro e login
    Click element                    ${OPEN_REGISTRATION_BUTTON}
    Wait until element is visible    ${EMAIL_OR_CPF_TEXTFIELD}      10
    ${email} =                       get_random_email
    Input text                       ${EMAIL_OR_CPF_TEXTFIELD}      ${email}
    Input text                       ${PASSWORD_TEXTFIELD}          123456
    Click element                    ${TERMS_CONDITIONS_BUTTONS}
    Click element                    ${REGISTER_BUTTON}
