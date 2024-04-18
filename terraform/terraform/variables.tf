variable "aws_ami" {
  default = "ami-080e1f13689e07408" #Trocar pela ami da conta
}
variable "instance_type" {
  default = ""
}
variable "instance_name" {
  default = ""
}
variable "aws_region" {
  default = "us-east-1"
}
variable "description" {
  default = ""
}
variable "volume_type" {
  default = ""
}
variable "volume_size" {
  default = ""
}
variable "device_name" {
  default = ""
}
variable "private_key" {
  default = ""
}
variable "playbook_path" {
  default = ""
}
variable "key_pair" {
  default = ""
}