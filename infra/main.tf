
provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}

module "cluster" {
  source = "./cluster"
}

module "service" {
  source = "./service"

  cluster = module.cluster.id
}
