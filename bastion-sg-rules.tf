resource "aws_security_group_rule" "bastion-sshd-ingress" {
  security_group_id = aws_security_group.bastion-sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "bastion-mosh-ingress" {
  security_group_id = aws_security_group.bastion-sg.id
  type              = "ingress"
  from_port         = 55055
  to_port           = 55055
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
