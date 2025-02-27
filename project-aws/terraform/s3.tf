# AWS S3 BUCKET 
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.bucket_name
}

# AWS S3 OBJECT
resource "aws_s3_object" "my_s3_object" {
  bucket   = aws_s3_bucket.my_s3_bucket.bucket
  for_each = fileset("../public/images", "**")
  key      = "images/${each.key}"
  source   = "../public/images/${each.key}"
}
