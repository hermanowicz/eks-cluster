resource "aws_security_group_rule" "fsx-nfs-sg-nfs-tcp-rule" {
  security_group_id = aws_security_group.fsx-sg.id
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "fsx-nfs-sg-nfs-udp-rule" {
  security_group_id = aws_security_group.fsx-sg.id
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "udp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "fsx-nfs-sg-nfs-rpc-tcp-rule" {
  security_group_id = aws_security_group.fsx-sg.id
  type              = "ingress"
  from_port         = 111
  to_port           = 111
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "fsx-nfs-sg-nfs-rpc-udp-rule" {
  security_group_id = aws_security_group.fsx-sg.id
  type              = "ingress"
  from_port         = 111
  to_port           = 111
  protocol          = "udp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
