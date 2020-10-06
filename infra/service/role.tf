
data "aws_iam_policy_document" "assume" {
  statement {
    effect    = "Allow"
    actions   = [ "sts:AssumeRole" ]

    principals {
      type        = "Service"
      identifiers = [ "ecs-tasks.amazonaws.com" ]
    }
  }
}


data "aws_iam_policy" "task" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}



resource "aws_iam_role" "role" {
  name               = "service"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}


resource "aws_iam_role_policy" "policy" {
  name = "service"
  role = aws_iam_role.role.id

  policy = data.aws_iam_policy.task.policy
}
