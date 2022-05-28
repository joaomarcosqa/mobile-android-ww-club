***Settings***
Library     String 
Library     ../../../shared/libs/CPFLib.py
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource

Variables    ../../../shared/locators/account_informations_locators.py

***Keywords***
Dado que acesso a tela de informações da conta
    Run keyword    Realizar login                  qa.test.user@westwing.com.br    123@westwingbr
    Run keyword    Acessar informações da conta

Dado que acesso a tela de informações da conta com uma nova conta
    Run keyword    Criar nova conta
    Run keyword    Acessar informações da conta

Quando realizar a alteração do nome do usuário
    ${nome}=                         Generate random String    5          abcdefgh
    Wait until element is visible    ${userNameTextField}
    Input text                       ${userNameTextField}      ${nome}
    Run keyword                      Salvar alterações

Quando realizar a alteração do sobrenome do usuário
    ${sobrenome}=                    Generate random String      7               abcdefghijkl
    Wait until element is visible    ${userLastNameTextField}
    Input text                       ${userLastNameTextField}    ${sobrenome}
    Run keyword                      Salvar alterações

Quando realizar a alteração do sexo do usuário
    Wait until element is visible    ${genderSpinner}
    ${currentGender}=                Get text                        ${genderSpinner}
    Click element                    ${genderSpinner}
    Sleep                            1                               reason=Waiting for the pop-up to renderize
    IF                               "${currentGender}" == "Sra."
    Click text                       Sr.
    ELSE
    Click text                       Sra.
    END
    Run keyword                      Salvar alterações 

Quando não preencher o campo de sexo do usuário
    Wait until element is visible    ${genderSpinner}
    Click element                    ${genderSpinner}
    Click text                       Selecionar
    Run keyword                      Salvar alterações

Quando realizar a alteração da senha do usuário
    Wait until element is visible    ${genderSpinner}
    Click text                       Alterar senha
    Wait until element is visible    ${oldPassTextField}
    Input text                       ${oldPassTextField}                                                         123@westwingbr
    Input text                       ${newPassTextField}                                                         1234@westwingbr
    Click text                       Salvar senha
    Run keyword                      Então o usuário deverá receber um aviso de sucesso na alteração de senha
    Wait until element is visible    ${genderSpinner}
    Click text                       Alterar senha
    Wait until element is visible    ${oldPassTextField}
    Input text                       ${oldPassTextField}                                                         1234@westwingbr
    Input text                       ${newPassTextField}                                                         123@westwingbr
    Click text                       Salvar senha

Quando realizar a inserção de um novo CPF
    ${newCPF} =                      Get random CPF
    Wait until element is visible    ${cpfTextField}
    Input text                       ${cpfTextField}    ${newCPF}

    #inserção de dados obrigatórios na alteração de uma nova conta
    Input text       ${userNameTextField}        Testson
    Input text       ${userLastNameTextField}    Da Silva
    Click element    ${genderSpinner}
    Sleep            1                           reason=Waiting for the pop-up to renderize
    Click text       Sr.
    Click element    ${birthDateDay}
    Click text       05
    Click element    ${birthDateMonth}
    Click text       Maio
    Click element    ${birthDateYear}
    Click text       2014

    Run keyword    Salvar alterações 

Quando não preencher o campo de CPF do usuário
    Wait until element is visible    ${cpfTextField}

    #inserção de dados obrigatórios na alteração de uma nova conta
    Input text       ${userNameTextField}        Testson
    Input text       ${userLastNameTextField}    Da Silva
    Click element    ${genderSpinner}
    Sleep            1                           reason=Waiting for the pop-up to renderize
    Click text       Sr.
    Click element    ${birthDateDay}
    Click text       05
    Click element    ${birthDateMonth}
    Click text       Maio
    Click element    ${birthDateYear}
    Click text       2014

    Run keyword    Salvar alterações 

Quando não preencher o campo de nome do usuário
    Wait until element is visible    ${userNameTextField}
    Clear text                       ${userNameTextField}
    Run keyword                      Salvar alterações

Quando não preencher o campo de sobrenome do usuário
    Wait until element is visible    ${userLastNameTextField}
    Clear text                       ${userLastNameTextField}
    Run keyword                      Salvar alterações

Quando não preencher o campo de e-mail do usuário
    Wait until element is visible    ${userEmailTextField}
    Clear text                       ${userEmailTextField}
    Run keyword                      Salvar alterações

Quando não preencher o campo de data de nascimento do usuário
    ${newCPF} =                      Get random CPF
    Wait until element is visible    ${cpfTextField}
    Input text                       ${cpfTextField}    ${newCPF}

    #inserção de dados obrigatórios na alteração de uma nova conta
    Input text       ${userNameTextField}        Testson
    Input text       ${userLastNameTextField}    Da Silva
    Click element    ${genderSpinner}
    Click text       Sr.

    Run keyword    Salvar alterações 

Quando realizar a inserção de um nome inválido
    Wait until element is visible    ${userNameTextField}
    Input text                       ${userNameTextField}    AA@#@32
    Run keyword                      Salvar alterações

Quando realizar a inserção de um sobrenome inválido
    Wait until element is visible    ${userLastNameTextField}
    Input text                       ${userLastNameTextField}    EE$!20
    Run keyword                      Salvar alterações

Quando realizar a inserção de um e-mail inválido
    Wait until element is visible    ${userEmailTextField}
    Input text                       ${userEmailTextField}    iojoiewjgiowe@
    Run keyword                      Salvar alterações

Então o usuário deverá receber um aviso de e-mail inválido
    Wait until page contains    E-mail inválido

Então o usuário deverá receber um aviso de nome inválido
    Wait until page contains    Nome contém caracteres inválidos

Então o usuário deverá receber um aviso de sobrenome inválido
    Wait until page contains    Sobrenome contém caracteres inválidos

Então o usuário deverá receber um aviso de sucesso na alteração
    Wait until page contains    Sua conta foi atualizada com sucesso    10

Então o usuário deverá receber um aviso de sucesso na alteração de senha
    Wait until page contains    Senha alterada com sucesso    10

Então o usuário deverá receber um aviso de campo obrigatório
    Wait until page contains    campo obrigatório

Acessar informações da conta
    Sleep                            3                              reason=Waiting DOM refresh
    Wait until element is visible    ${lateralMenu}
    Click element                    ${lateralMenu}
    Click element                    ${accountInformationButton}

Salvar alterações
    Click element    ${saveModificationsButton}
