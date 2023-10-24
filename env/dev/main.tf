module "aws-dev" {
  source = "../../infra"
  regiao_aws = "us-east-1"
  cluster_name = "fiap-app-eks-aws"
}