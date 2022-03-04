
# VNET name.
variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-default"
}

#VNET address space.
variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

#Web subnet name
variable "web_subnet_name" {
  description = "Web subnet name"
  type        = string
  default     = "websubnet"
}

#Web subnet address
variable "web_subnet_address" {
  description = "Web subnet address space"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

#App subnet name
variable "app_subnet_name" {
  description = "App subnet name"
  type        = string
  default     = "appsubnet"
}

#App subnet address
variable "app_subnet_address" {
  description = "App subnet address space"
  type        = list(string)
  default     = ["10.0.11.0/24"]
}

#DB subnet name
variable "db_subnet_name" {
  description = "DB subnet name"
  type        = string
  default     = "dbsubnet"
}

#DB subnet address
variable "db_subnet_address" {
  description = "DB subnet address space"
  type        = list(string)
  default     = ["10.0.21.0/24"]
}

#Bastion subnet name
variable "bastion_subnet_name" {
  description = "Bastion subnet name"
  type        = string
  default     = "bastionsubnet"
}

#Bastion subnet address
variable "bastion_subnet_address" {
  description = "Bastion subnet address space"
  type        = list(string)
  default     = ["10.0.100.0/24"]
}
