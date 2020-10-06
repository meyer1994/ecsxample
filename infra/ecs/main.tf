
provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}


resource "aws_ecs_cluster" "cluster" {
  name               = "cluster"
  capacity_providers = [ "FARGATE", "FARGATE_SPOT" ]
}
