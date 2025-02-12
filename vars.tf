variable "region" {
  type        = string
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "tags" {
  type        = map(string)
  description = "default tags for project"
  default = {
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}
