variable "vpc_name"{
    description = "Name of the VPC"
    type = string
}

variable "subnet"{
    description = "Subnet CIDR block"
    type = string
}

variable "sg_name"{
    description = "Name of the security group"
    type = string
}