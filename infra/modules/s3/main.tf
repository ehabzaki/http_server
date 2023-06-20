module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.12.0"
  bucket =  var.bucket_name  #"baqend-bucket"
  block_public_policy = false
  restrict_public_buckets =false
  force_destroy = true
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = module.s3.s3_bucket_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "bucket",
  "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": {"AWS":"arn:aws:iam::079541103782:root"},
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
     ]
}
POLICY
}