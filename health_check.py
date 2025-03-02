import subprocess
import requests
import os 
from dotenv import load_dotenv

#Load enviroment variable
load_dotenv

#Get token and id from env

TOKEN = os.getenv("BOT_TOKEN")
CHAT_ID = os.getenv("CHAT_ID")


def read_healthcheck_script(file_path):
    try:
        with open(file_path , 'r') as file:
            script_content = file.read()
        return script_content
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found")
        return None
    except PermissionError:
        print(f"Permission error for '{file_path}'")
        return None
    except Exception as e:
        print(f"Error reading file '{e}")
        return None



def send_message(bot_token, chat_id, message):

    url = f"https://api.telegram.org/bot{bot_token}/sendMessage"
    payload = {
        "chat_id": chat_id,
        "text": message
    }

    try:
        response = requests.post(url, json=payload)
        print(response.status_code)

        if(response.status_code == 200):
            print("success")
        else:
            print("fail")
            print(response.reason)

    except requests.exceptions.RequestException as e:
        print(f"request error: {e}")





script = read_healthcheck_script("/home/daniel/Desktop/project/healthcheck/health_check.sh")
script_message = subprocess.check_output(['bash', '-c', script],text=True)
send_message(TOKEN,CHAT_ID,script_message)
