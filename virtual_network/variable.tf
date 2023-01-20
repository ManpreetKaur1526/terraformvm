variable "rgname" {
  type = string
  }
variable "loc" {
  type = string	
}
variable "vnetname" {
  type = string
}

variable "vnetaddress"{
type = list
}

variable "subnetaddress" {
type = list
}

variable "subnetname" {
type = tuple([string, number,bool])
}

variable "tagging" {
type = object({
env = string 
tier = number   
})
}