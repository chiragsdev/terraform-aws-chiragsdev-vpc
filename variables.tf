variable "vpc_config" {
  description = "Configuration for the VPC"
  type = object({
    cidr_block           = string
    name                 = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The provided CIDR block is not valid. - ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  description = "Configuration for the Subnets"
  type = map(object({
    cidr_block           = string
    availability_zone    = string
    public               = optional(bool,false)
  }))  

  validation {
    # subnet_1={cidr_block=string,availability_zone=string}
    condition     = alltrue([for s in var.subnet_config : can(cidrnetmask(s.cidr_block))])
    error_message = "The provided CIDR block is not valid in one of the subnets."
  }
}