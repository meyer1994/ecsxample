
provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}


resource "aws_ecs_cluster" "ecs" {
  name               = "cluster"
  capacity_providers = [ "FARGATE_SPOT" ]
}
