module "vpc" {
  source = "./vpc"

  vpccidr     = "10.0.0.0/16"
  vpcname     = "eks-vpc"
  subnet1cidr = "10.0.1.0/24"
  subnet1az   = "us-east-2a"
  subnet2cidr = "10.0.2.0/24"
  subnet2az   = "us-east-2b"
  sgname      = "eks_sg"
  sgcidr      = "0.0.0.0/0"
}

module "eks" {
  source = "./eks"

  eksclustername       = "tfekscluster"
  subnet1id            = module.vpc.subnet1id
  subnet2id            = module.vpc.subnet2id
  eksclusterrolename   = "eksrolename"
  eksnodegroupname     = "tfnodegroup1"
  eksnodegrouprolename = "eksnodegrouprole"

  depends_on = [
    module.vpc
  ]
}