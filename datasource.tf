data "aws_ami" "ami_id" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = ["RHEL-9.3.0_HVM-20240117-x86_64-49-*"]
  }
}

output "ami_id" {
  description = "Latest available AMI ID"
  value = data.aws_ami.ami_id.image_id
}