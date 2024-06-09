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