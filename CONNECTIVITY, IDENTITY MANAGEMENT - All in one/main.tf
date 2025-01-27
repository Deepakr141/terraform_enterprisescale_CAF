# main.tf

# main.tf

# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {
  provider = azurerm
}

data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}

data "azurerm_client_config" "management" {
  provider = azurerm.management
}

data "azurerm_client_config" "identity" {
  provider = azurerm.identity
}


# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.1.2"

providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm
    azurerm.connectivity = azurerm
    azurerm.identity     = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = data.azurerm_client_config.connectivity.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources
  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.management.subscription_id
  configure_management_resources = local.configure_management_resources
  deploy_identity_resources    = var.deploy_identity_resources
  subscription_id_identity     = data.azurerm_client_config.identity.subscription_id
  configure_identity_resources = local.configure_identity_resources
}
