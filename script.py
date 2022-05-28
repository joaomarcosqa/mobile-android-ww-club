import sys
import os
import platform
import time

command = """robot -d output --listener "RobotNotifications;https://hooks.slack.com/services/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;end_test;summary" """""

print("Instalando depedencia de execução")
os.system("npm install pm2")

print("Iniciando Android ...")
os.system("emulator -avd Nexus_5_API_28 -no-audio -no-window &")

time.sleep(10)

print("Incializando Appium")
os.system("pm2 start appium")

time.sleep(10)




for param in sys.argv[1:]:
    if param == "-all":
        command += "./tests/**/tests/*.robot "
    else:
        command += "tests/{}/tests/{}.robot ".format(param, param)


commandSlack = "python shared/libs/SlackLib.py"


if platform.system() == "Linux":
    commandSlack = "python3 shared/libs/SlackLib.py"

print(command)

os.system(command)
os.system("python3 shared/libs/SlackLib.py")
os.system("pm2 stop appium")
