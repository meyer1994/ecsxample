
resource "aws_ecs_service" "service" {
  name            = "service"
  cluster         = data.aws_ecs_cluster.cluster.arn
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = data.aws_subnet_ids.subnets.ids
    security_groups  = [ aws_security_group.sg.id ]
    assign_public_ip = true
  }
}
