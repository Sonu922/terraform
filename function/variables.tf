
variable "region" {
    default = "eu-west-1"
  
}
variable "type" {
 default = "t2.micro"
  
}

variable "ami" {
   type = map
    default = {
      "us-east-2" = "ami-0fe0b2cf0e1f25c8a"
      "eu-west-1" = "ami-05e786af422f8082a"
      "eu-west-1" = "ami-0f813cec865060df4"
    }
   
}


variable "tags" {
    type = list
    default = ["firstins", "secondins"]
  
}