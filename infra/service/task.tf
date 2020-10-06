
resource "aws_ecs_task_definition" "task" {
  family                   = "service"
  container_definitions    = "[${module.service.json_map_encoded}, ${module.db.json_map_encoded}]"
  network_mode             = "awsvpc"
  requires_compatibilities = [ "FARGATE" ]
  cpu                      = 1024
  memory                   = 2048

  task_role_arn      = aws_iam_role.role.arn
  execution_role_arn = aws_iam_role.role.arn
}
