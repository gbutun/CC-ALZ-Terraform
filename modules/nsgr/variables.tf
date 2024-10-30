variable "nsg_rule_name" {
  type=string
}

variable "resource_group_name" {
  type=string
}

variable "nsg_name" {
  type=string
}

variable "nsg_description" {
  type=string
  default = "Allow VeriPark Agent VM IPs RDP Inbound Rule"
}

variable "nsg_priority" {
  type=number
}

variable "direction" {
  type=string
}

variable "access" {
  type=string
  default = "Allow VeriPark Agent VM IPs RDP Inbound Rule"
}

variable "protocol" {
  type=string
  default="*"
}

variable "spr" {
  type=string
}

variable "dpr" {
  type=string
}

variable "s_address_prefix" {
  type=string
}

variable "d_address_prefix" {
  type=string
}


