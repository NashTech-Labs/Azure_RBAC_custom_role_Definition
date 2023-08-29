terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

resource "azurerm_role_definition" "custom_role" {
  count       = length(var.roles_define)
  name        = var.roles[count.index].name
  description = var.roles[count.index].description
  scope       = var.scope_subs
  permissions {
    actions = var.roles[count.index].actions
    not_actions = var.roles[count.index].not_actions 
  }
}
