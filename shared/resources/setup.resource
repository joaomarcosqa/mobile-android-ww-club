***Settings***
Library    AppiumLibrary

Variables    ../../config.py

Documentation
...    Este arquivo resource é utilizado especialmente para a execução de setups.
...    Se seu arquivo de testes a utiliza, você não precisa importar a biblioteca
...    Appium nem as configurações.


***Keywords***

Abrir o aplicativo
    Open Application          ${APPIUM_ADDRESS}    platformName=${PLATFORM_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    noreset=true    fullReset=false
