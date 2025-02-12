resource "aws_security_group_rule" "rds-proxy-psql-ingress" {
  security_group_id = aws_security_group.rds-proxy-sg.id
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
