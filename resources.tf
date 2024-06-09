#Configure S3 Bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucketname
  tags = {
    Name        = "demobucket"
    description = "This bucket is created to store terraform statefile"
    Environment = "Dev"
  }
}

output "bucket_name" {
  description = "Display the name of S3 bucket created for backend"
  value       = aws_s3_bucket.tfstate.id
}

#Create a Security Group
resource "aws_security_group" "mysg" {
  name        = "terraform_sg"
  description = "This SG is created to attach to EC2 created using Terraform"

  tags = {
    Name = "terraform_sg"
  }

  dynamic "ingress" {
    for_each = var.inboundports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
      description = "Inbound Rules"
    }
  }
  dynamic "egress" {
    for_each = var.outbountports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "-1"
      description = "Outbound Rules"
    }
  }
}

resource "aws_instance" "demo" {
  ami             = data.aws_ami.ami_id.image_id
  instance_type   = var.instance_type
  key_name        = "linuxkey"
  security_groups = [aws_security_group.mysg.name]
  tags = {
    Name        = "demoserver"
    description = "This instance is created as part of Terraform learning"
  }
}