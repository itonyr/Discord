import requests
import logging

# Class for all message interactions leveraging the Discord webhooks
class Messages: 
    # Method for sending messages to a channel using the Webhook_URL
    def send(self,
             # Webhook URL. Retrieved in the Settings > Integrations > Webhooks 
             # field within a given Discord Server. 
             webhook_url: str,
             message_content: str
             ): 
    ## Import the webhook URL from Hashicorp Vault
        try:
            data = {
                "content": message_content
            }
            response = requests.post(webhook_url, json=data)
            logging.info(f"Response recieved from webhook: {response.status_code}")
            return response
        except:
            logging.error('Unable to send webhook.')
    # Method for sending messages to a channel using the Webhook_URL