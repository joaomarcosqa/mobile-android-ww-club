import boto3
from botocore.exceptions import ClientError
import logging
import shutil
from datetime import date, datetime
from requests import post
import os

__version__ = '1.0'
__scope__ = 'GLOBAL'
__author__ = 'Enzo Franzini; Thales Almeida'

"""
This lib was created to be used to send the Robot test results to AWS S3. 
For any sugestions or bugs found, please contact:

enzo.franzini@westwing.com.br or thales.almeida@westwing.com.br
"""

s3_client = boto3.client(
    's3',
    aws_access_key_id='AKIA3FUHYH46IBT5BSPR',
    aws_secret_access_key='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'
)


def upload_object(file_name, bucket="westwingrobot", object_name=None):

    object_name = meutempo + "/" + object_name

    try:
        s3_client.upload_file(file_name, bucket, object_name, ExtraArgs={
                              'ContentType': "text/html", 'ACL': "public-read"})
    except ClientError as e:
        logging.error(e)
        return False

    return True


meutempo = "default/" + str(date.today()) + "/" + str(datetime.now())
meutempo = meutempo.replace(" ", "")


slackTemplate = {
    "blocks": [
        {
            "type": "header",
            "text": {
                    "type": "plain_text",
                    "text": "Relatório do teste",
                    "emoji": True
            }
        },
        {
            "type": "section",
            "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*Relatório:*\n<https://westwingrobot.s3.us-east-2.amazonaws.com/" + meutempo + "/report.html|Clique aqui>"
                    },
                {
                        "type": "mrkdwn",
                        "text": "*Gerado em:*\nDesenvolvimento"
                }
            ]
        }
    ]
}


for diretorio, subpastas, arquivos in os.walk("./output"):
    for arquivo in arquivos:
        if(arquivo.endswith(".png")):
            print("output/" + arquivo)
            upload_object("output/" + arquivo, object_name=arquivo)

upload_object("output/log.html", object_name="log.html")
upload_object("output/report.html", object_name="report.html")
upload_object("output/output.xml", object_name="output.xml")

dateActual = str(datetime.now())
dateParsed = dateActual.replace(" ", "")


comandoCriaPasta = "cd output && mkdir {}".format(dateParsed)
comandoMoveArquivos = "cd .. && mv output/* output/{}".format(dateParsed)


os.system(comandoCriaPasta)
os.system(comandoMoveArquivos)


post("https://hooks.slack.com/services/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", json=slackTemplate)
