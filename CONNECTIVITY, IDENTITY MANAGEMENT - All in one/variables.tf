# variables.tf 

# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "myorg"
}

variable "root_name" {
  type    = string
  default = "My Organization"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "uksouth"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "my_valid_security_contact@replace_me" # Replace this value with your own email address.
}

variable "management_resources_location" {
  type    = string
  default = "uksouth"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}

variable "deploy_identity_resources" {
  type    = bool
  default = true
}

variable "identity_resources_location" {
  type    = string
  default = "uksouth"
}

variable "identity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_identity_resources_custom"
  }
}
