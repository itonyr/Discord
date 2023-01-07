from modules.messages import messages

## Whenever possible, the webhook_url here should instead be ingested from a secret store such as Azure Key Vault or Hashicorp Vault. 
# Never store plain text secrets in code, such as webhook URL's with embeded tokens. 
response = Messages.send(webhook_url='https://yourwebhookurl.com/channelid/token', 
                         message_content="Anyone gaming tonight? \r :thumbsup: for yes, \r :hand_with_index_finger_and_thumb_crossed: for maybe. \r :thumbsdown: for no.")