variable "vpc_name"{
    description = "Name of the vpc"
    type = string
}

variable "subnet"{
    description = "subnet CIDR block"
    type = string
}

variable "instance_name"{
    description = "Name of the instance"
    type = string
}

variable "ami_ids" { 
    description = "AMI ID"
    type = map

    default = {
        linux = "ami-0d398eb3480cb04e7"
    }
}

variable "disk" {
    description = "OS image"
    type = object({
        delete_on_termination = bool
        encrypted = bool
        volume_size = string
        volume_type = string
  })
} 

variable "os_type" {
    description = "OS type: Linux or Windows"
    type = string
}

variable "instance_size" {
    description = "Size of the EC2 instance"
    type = string
    default = "t2.micro"
}