# Create a Resource Group
resource "azurerm_resource_group" "appservice-rg" {
  name = "${var.service_name}-${var.environment}"
  location = var.location
 
  tags = {
    owner = var.owner
    environment = var.environment
  }
}

# Create a virtual network 
resource "azurerm_virtual_network" "appservice-vnet" {
  name                = "${var.service_name}-${var.environment}"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  address_space       = var.vnet_address_space 
}

# Create a subnet
resource "azurerm_subnet" "appservice-subnet" {
  name                 = "${var.service_name}-${var.environment}"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  address_prefixes     = var.subnet_address_prefix

  delegation {
    name = "App-Service"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}


# Create an app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name = "${var.service_name}-${var.environment}"
  location = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  kind = "Linux"
  reserved = true
 
  sku {
    tier = "Basic"
    size = "B1"
  }
 
  tags = {
    owner = var.owner
    environment = var.environment
  }
}

# Create an app service
resource "azurerm_app_service" "app-service" {
  name = "${var.service_name}-${var.environment}"
  location = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id  
 
  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}:${var.docker_image_tag}"
  }
 
  app_settings = {
    "WEBSITES_PORT" = var.app_port
  }
 
  tags = {
    owner = var.owner
    environment = var.environment
    service = var.service_name
  }
}

# Connect app service to subnet
resource "azurerm_app_service_virtual_network_swift_connection" "app-service-subnet-connection" {
  app_service_id = azurerm_app_service.app-service.id
  subnet_id      = azurerm_subnet.appservice-subnet.id
}

# Output the URL to access the app service
output "app_service_url" {
  value       = azurerm_app_service.app-service.default_site_hostname
  description = "System generated URL to access the App Service" 
}

