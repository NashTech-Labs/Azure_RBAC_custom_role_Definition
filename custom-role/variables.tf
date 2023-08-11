variable "azure_client_id" {
  description = "Service Principal (application-id) Client id details"
}

variable "azure_client_secret" {
  description = "Service Principal Client Secrets value details"
}

variable "azure_tenant_id" {
  description = "Service Principal tenant id details"
}

variable "azure_subscription_id" {
  description = "Service Principal subsription id details"
}

variable "scope" {
  description = "scope of role --> When a custom role is assigned at the subscription level, the permissions defined in the role apply to all resources within that subscription"
}

variable "roles" {
  type = list(object({
    name        = string
    description = string
    actions = list(string)
    not_actions = list(string)
  }))
}
