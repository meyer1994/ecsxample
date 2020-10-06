
resource "aws_ecs_service" "service" {
  name            = "service"
  cluster         = var.cluster
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = data.aws_subnet_ids.subnets.ids
    assign_public_ip = true
  }
}
