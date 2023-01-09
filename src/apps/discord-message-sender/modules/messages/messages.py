import requests
import logging

# Class for all message interactions leveraging the Discord webhooks
class message:
    def __init__(self,webhook_url: str,message_content: str): 
        logging.info("Message class invoked",)
        self.webhook_url = webhook_url
        self.message_content = message_content
    ## Import the webhook URL from Hashicorp Vault
    def send(self):
        try:
            data = {
                "content": self.message_content
            }
            response = requests.post(self.webhook_url, json=data)
            logging.info(f"Response recieved from webhook:")
        except:
            logging.error('Unable to send webhook.')
    # Method for sending messages to a channel using the Webhook_URL

# if __name__ == "__main__":
#     print("What would you like to do? \f 1: Send Message")
#     selection = input("")
#     match selection: 
#         case 1: 
#             Messages.send(webhook_url=input("webhook_url"), 
#                 message_content=input("Message_Content")
#             )