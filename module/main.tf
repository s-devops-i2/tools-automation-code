resource "aws_instance" "instance" {
  ami                      = data.aws_ami.ami.image_id
  instance_type            = var.instance_type
  vpc_security_group_ids   = [data.aws_security_group.selected.id]
  iam_instance_profile     = aws_iam_instance_profile.prom_inst_profile.name
  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  name    = var.name
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.public_ip]
  ttl     = 30
}
resource "aws_route53_record" "internal_record" {
  name    = "${var.name}-internal"
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl     = 30
}

resource "aws_iam_role" "prometheus_role" {
  name = "${var.name}-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "${var.name}-inline-policy"

    policy = jsonencode({
      Version   = "2012-10-17"
      Statement = [
        {
          Action   = var.policy_resource_list
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
  tags = {
    tag-key = "${var.name}-role"
  }
}


resource "aws_iam_instance_profile" "prom_inst_profile" {
  name = "${var.name}-role"
  role = aws_iam_role.prometheus_role.name
}
