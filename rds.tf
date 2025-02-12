module "cluster" {
  version = "9.11.0"
  source  = "terraform-aws-modules/rds-aurora/aws"

  name                = "tetris-with-vectors"
  engine              = "aurora-postgresql"
  engine_version      = "16.4"
  engine_mode         = "provisioned"
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enable_http_endpoint = true

  serverlessv2_scaling_configuration = {
    min_capacity             = 0
    max_capacity             = 8
    seconds_until_auto_pause = 300
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
    # ex1_ingress = {
    #   cidr_blocks = ["10.20.0.0/20"]
    # }
  }

  enabled_cloudwatch_logs_exports = ["tetris-db-with-vectors"]

  tags = var.tags
}
