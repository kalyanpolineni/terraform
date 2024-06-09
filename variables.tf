variable "bucketname" {
  default = "kalyanpolineni"
}

variable "ami_owner" {
  default = "309956199498"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "inboundports" {
  type        = list(number)
  description = "Ports which are part of Inbound rules for SG"
  default     = [22, 80]
}

variable "outbountports" {
  type        = list(number)
  description = "Ports which are part of Outbound rules for SG"
  default     = [0]
}