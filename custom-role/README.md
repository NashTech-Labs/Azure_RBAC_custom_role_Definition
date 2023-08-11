This Terraform repo contains a code that create custom role in Azure.

## Prerequisites

Use this Terraform code, you will need to have the following installed:

- [Terraform]
- [Azure CLI]

Service Principal:-

- Azure service principal with permissions to create RBAC custom role definition

## Usage

Clone this Git repo to your local machine.

```bash
cd customrole
```

Create a new file `terraform.tfvars` in the same directory as your `.tf` files.

```bash
touch terraform.tfvars
```

Open the file in your preferred text editor.

```bash
nano terraform.tfvars
```

Add your desired inputs to the file in the following format:

```ruby
azure_client_id          = "this contain the service principal application (client) ID"
azure_client_secret      = "this contain the service principal secret value"
azure_tenant_id          = "this contain the service principal tenant ID"
azure_subscription_id    = "this contain the subscription ID"
scope                    = "/subscription/subscription-ID (mention your subscription-ID)"
custom_roles             =  [
    {
      name        = "list-key"
      description = "it will list the value of keys"
      actions = [
        "Microsoft.Storage/storageAccounts/listKeys/action",
      ]
      not_actions = []
    },
    {
      name        = "write-resources"
      description = "access to edit the resource group"
      actions = [
        "Microsoft.Resources/subscriptions/resourceGroups/write",
      ]
      not_actions = []
    },
  ]

```

> Note that the `terraform.tfvars` file will not be committed to version control, as it could contain sensitive information such as client id, tenant id, subscription id etc.

Review the changes that Terraform will make to your Azure resources.


Initialize Terraform in the directory.

```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```
