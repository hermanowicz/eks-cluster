# module "rds_proxy" {
#   source = "terraform-aws-modules/rds-proxy/aws"

#   name                   = "rds-proxy"
#   iam_role_name          = "rds-proxy-role"
#   vpc_subnet_ids         = ["subnet-30ef7b3c", "subnet-1ecda77b", "subnet-ca09ddbc"]
#   vpc_security_group_ids = ["sg-f1d03a88"]

#   endpoints = {
#     read_write = {
#       name                   = "read-write-endpoint"
#       vpc_subnet_ids         = ["subnet-30ef7b3c", "subnet-1ecda77b", "subnet-ca09ddbc"]
#       vpc_security_group_ids = ["sg-f1d03a88"]
#     },
#     read_only = {
#       name                   = "read-only-endpoint"
#       vpc_subnet_ids         = ["subnet-30ef7b3c", "subnet-1ecda77b", "subnet-ca09ddbc"]
#       vpc_security_group_ids = ["sg-f1d03a88"]
#       target_role            = "READ_ONLY"
#     }
#   }

#   auth = {
#     "superuser" = {
#       description        = "Aurora PostgreSQL superuser password"
#       secret_arn         = "arn:aws:secretsmanager:us-east-1:123456789012:secret:superuser-6gsjLD"
#     }
#   }

#   # Target Aurora cluster
#   engine_family         = "POSTGRESQL"
#   target_db_cluster     = true
#   db_cluster_identifier = "my-endpoint"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }
