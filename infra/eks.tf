module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.28"
  cluster_endpoint_public_access = true

  # VPC nova
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  #  Configuração das máquinas
  eks_managed_node_groups = {
    fiap = {
      min_size               = 1
      max_size               = 3
      desired_size           = 1
      vpc_security_group_ids = [aws_security_group.fiap-security-group-app.id]
      instance_types         = ["t2.micro"]
    }
  }
}