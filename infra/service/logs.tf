
resource "aws_cloudwatch_log_group" "service" {
  name              = "service"
  retention_in_days = 3
}

resource "aws_cloudwatch_log_group" "db" {
  name              = "db"
  retention_in_days = 3
}
