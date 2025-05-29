resource "aws_iam_role" "fluentd_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "fluentd_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.fluentd_role.name
}

resource "aws_iam_role_policy" "fluentd_policy" {
  name = "${var.role_name}-policy"
  role = aws_iam_role.fluentd_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::k8s-fluentd-clobee-bucket",
          "arn:aws:s3:::k8s-fluentd-clobee-bucket/*"
        ]
      }
    ]
  })
}
