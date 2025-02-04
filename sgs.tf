resource "aws_security_group" "bastion-sg" {
  vpc_id      = module.vpc.default_vpc_id
  description = "Security group for bastion server accessed via. ssm session."

  tags = {
    Name : "bastion-sg"
    Terraform : true
    Version : "0.1.0"
  }
}


resource "aws_security_group" "eks-workers-sg" {
  vpc_id      = module.vpc.default_vpc_id
  description = "default security group for eks worker nodes in all subnets"

  tags = {
    Name : "eks-workers-sg"
    Terraform : true
    Version : "0.1.0"
  }
}

resource "aws_security_group" "eks-master-sg" {
  vpc_id      = module.vpc.default_vpc_id
  description = "default security group for masters/control plane of eks"

  tags = {
    Name : "eks-masters-sg"
    Terraform : true
    Version : "0.1.0"
  }
}