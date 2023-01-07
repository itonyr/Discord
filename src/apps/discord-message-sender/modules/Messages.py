import requests
import logging

# Class for all message interactions leveraging the Discord webhooks
class Send: 
    def __init__(self, webhook_url: str, message_content: str = ""):
        # Webhook URL. Retrieved in the Settings > Integrations > Webhooks field within a given Discord Server. 
        logging.info(f'Sending webhook with message content: {message_content}')
        self.webhook_url = webhook_url
        self.message_content = message_content
        
        # Method for sending messages to a channel using the Webhook_URL
        data = {
            "content": self.message_content
        }
        response = requests.post(self.webhook_url, json=data)
        logging.info(f"Response recieved from webhook: {response.status_code}")
        return response

if __name__ == '__main__':
    Send(webhook_url=input("Webhook URL:"), 
        message_content=input("Message Content:")
    )