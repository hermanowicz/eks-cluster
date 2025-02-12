module "kms" {
  version = "3.1.1"
  source  = "terraform-aws-modules/kms/aws"

  description             = "EKS labs key"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 7
  multi_region            = false
  is_enabled              = true

  # Policy
  enable_default_policy             = true
  key_administrators                = ["arn:aws:iam::901978288702:user/MacBookPro", "arn:aws:iam::901978288702:user/nextera-solutions-site"]
  key_service_roles_for_autoscaling = ["arn:aws:iam::012345678901:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]

  # Aliases
  aliases = ["hermanowiczCo/labs"]
  create  = flase


  tags = {
    Terraform   = "true"
    Environment = "sandbox"
    Version     = "0.1.0"
  }
}
