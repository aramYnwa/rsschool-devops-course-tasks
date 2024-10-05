resource "aws_iam_role" "github_actions_role" {
  name = "GithubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"  # Modify as needed for other services
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "github_actions_inline_policy" {
  name = "GithubActionsInlinePolicy"
  role = aws_iam_role.github_actions_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",       # AmazonEC2FullAccess
          "route53:*",   # AmazonRoute53FullAccess
          "s3:*",        # AmazonS3FullAccess
          "iam:*",       # IAMFullAccess
          "vpc:*",       # AmazonVPCFullAccess
          "sqs:*",       # AmazonSQSFullAccess
          "events:*"     # AmazonEventBridgeFullAccess
        ],
        Resource = "*"
      }
    ]
  })
}
