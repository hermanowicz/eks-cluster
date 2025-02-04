resource "aws_vpc_endpoint" "s3" {
  vpc_id          = module.vpc.vpc_id
  service_name    = "com.amazonaws.us-west-2.s3"
  route_table_ids = flatten(module.vpc.private_route_table_ids[*])
}

# set of endpoint for ssm sessions in vpc
# ---------------------------------------

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.us-west-2.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.ssm-endpoints-sg.id]
  subnet_ids         = flatten(module.vpc.private_subnets[*])

  private_dns_enabled = true

  tags = {
    Name : "ec2-vpc-endpoint"
    Terraform : true
    Version : "0.1.0"
    Envrionment : "sandbox"
  }

}

