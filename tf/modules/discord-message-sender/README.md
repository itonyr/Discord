# discord-webhook-sender

## Table of Contents

- [discord-webhook-sender](#discord-webhook-sender)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Usage](#usage)

## Overview

This module, using the default `variables.tf` file listed in this repository, will deploy a single container app service and pull down the image for a simple Discord Webhook Message Sending application.  

The modules contained in this directory can be reused by simply editing the values in the `variables.tf` file.  

## Usage

To deploy this module on it's own:

1. Open this section of the Modules directory
2. Run `az login` and login to the terminal using your Azure Portal credentials
3. Run `terraform init` to initialize the terraform client.  
4. Run `terraform plan` to confirm that the proper resources will be deployed
5. Run `terraform apply` to deploy the resources to Azure.  