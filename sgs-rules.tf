
resource "aws_security_group_rule" "eks-workers-2k-ingress" {
  security_group_id = aws_security_group.eks-workers-sg.id
  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-workers-ping-ingress" {
  security_group_id = aws_security_group.eks-workers-sg.id
  type              = "ingress"
  from_port         = "icmp"
  to_port           = "icmp"
  protocol          = "icmp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-workers-kublet-ingress" {
  security_group_id = aws_security_group.eks-workers-sg.id
  type              = "ingress"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-workers-proxy-ingress" {
  security_group_id = aws_security_group.eks-workers-sg.id
  type              = "ingress"
  from_port         = 10256
  to_port           = 10256
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-api-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-etcd-79-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 2379
  to_port           = 2379
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-etcd-80-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 2380
  to_port           = 2380
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-etcd-80-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 2380
  to_port           = 2380
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-kublet-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-scheduler-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 10259
  to_port           = 10259
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "eks-control-manager-ingress" {
  security_group_id = aws_security_group.eks-master-sg.id
  type              = "ingress"
  from_port         = 10257
  to_port           = 10257
  protocol          = "tcp"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
