resource "aws_security_group_rule" "ssm-vpc-endpoints-ingress" {
  security_group_id = aws_security_group.ssm-endpoints-sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
