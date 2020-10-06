
data "aws_vpc" "default" {
  default = true
}


data "aws_region" "current" {}


data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.default.id
}


data "aws_ecs_cluster" "cluster" {
  cluster_name = var.cluster
}
