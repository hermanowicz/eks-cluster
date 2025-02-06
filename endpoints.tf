resource "aws_vpc_endpoint" "s3" {
  vpc_id          = module.vpc.vpc_id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = flatten(module.vpc.private_route_table_ids[*])

  tags = {
    Name : "s3-vpc-endpoint-gateway"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}

# set of endpoint for ssm sessions in vpc
# ---------------------------------------

resource "aws_vpc_endpoint" "ec2-messages-vpc-endpoint" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "ec2messages.${var.region}.amazonaws.com"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids         = flatten(module.vpc.private_subnets[*])

  private_dns_enabled = true

  tags = {
    Name : "ec2-messages-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }

}

resource "aws_vpc_endpoint" "ssm-vpc-endpoint" {
  vpc_id              = module.vpc.vpc_id
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids          = flatten(module.vpc.private_subnets[*])
  private_dns_enabled = true

  tags = {
    Name : "ssm-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}

resource "aws_vpc_endpoint" "ssm-messages-vpc-endpoint" {
  vpc_id              = module.vpc.vpc_id
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids          = flatten(module.vpc.private_subnets[*])
  private_dns_enabled = true

  tags = {
    Name : "ssm-messages-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}

resource "aws_vpc_endpoint" "kms-service-vpc-endpoint" {
  vpc_id              = module.vpc.vpc_id
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids          = flatten(module.vpc.private_subnets[*])
  private_dns_enabled = true

  tags = {
    Name : "kms-service-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}

resource "aws_vpc_endpoint" "logs-vpc-endpoint" {
  vpc_id              = module.vpc.vpc_id
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids          = flatten(module.vpc.private_subnets[*])
  private_dns_enabled = true

  tags = {
    Name : "logs-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }
}