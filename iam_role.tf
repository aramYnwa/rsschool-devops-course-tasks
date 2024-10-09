provider "aws" {
  region = var.aws_region
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98e9a3b8a5b1baba04a40f10a11123d6"]
}

resource "aws_iam_role" "github_actions_role" {
  name = "GithubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        },
        Action = "sts:AssumeRole",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = "repo:aramYnwa/rsschool-devops-course-tasks:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy_attachments" {
  for_each = tomap({
    ec2       = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    route53   = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
    s3        = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    iam       = "arn:aws:iam::aws:policy/IAMFullAccess"
    vpc       = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
    sqs       = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    eventbridge = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  })

  role       = aws_iam_role.github_actions_role.name
  policy_arn = each.value
}
