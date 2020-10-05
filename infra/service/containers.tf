
module "service" {
    source  = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=0.41.0"

    essential = true

    container_name   = "service"
    container_image  = "meyer1994/ecsxample"
    container_memory = 1024
    container_cpu    = 512

    port_mappings = [
      {
        containerPort = 8000
        hostPort      = 8000
        protocol      = "TCP"
      }
    ]

    log_configuration = {
      logDriver = "awslogs"
      options   = {
          awslogs-group         = aws_cloudwatch_log_group.service.id
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = "service"
      }
      secretOptions = null
    }

    environment = [
      {
        name  = "POSTGRES"
        value = "postgres://postgres@db"
      }
    ]
}


module "db" {
    source  = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=0.41.0"

    essential = true

    container_name   = "db"
    container_image  = "postgres"
    container_memory = 1024
    container_cpu    = 512

    port_mappings = [
      {
        containerPort = 5432
        hostPort      = 5432
        protocol      = "TCP"
      }
    ]

    log_configuration = {
      logDriver = "awslogs"
      options   = {
          awslogs-group         = aws_cloudwatch_log_group.db.id
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = "db"
      }
      secretOptions = null
    }

    environment = [
      {
        name  = "POSTGRES_HOST_AUTH_METHOD"
        value = "trust"
      }
    ]
}
