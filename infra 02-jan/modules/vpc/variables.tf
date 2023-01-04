variable "instance_tenancy" {
  default = "default"
}



variable "vpc_cidr_block" {
   default = "10.0.0.0/16"
}

variable "sub_pub_cidr_block" {
    default = "10.0.1.0/24"
  
}

variable "sub_pri_cidr_block" {
    default = "10.0.2.0/24"
  
}

variable "nat_destination" {

    default = "0.0.0.0/0"
  
}

variable "azs" {

    default =""
  
}
