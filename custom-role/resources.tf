terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}

resource "azurerm_role_definition" "custom_role" {
  count       = length(var.roles)
  name        = var.roles[count.index].name
  description = var.roles[count.index].description
  scope       = var.scope
  permissions {
    actions = var.roles[count.index].actions
    not_actions = var.roles[count.index].not_actions 
  }
}
