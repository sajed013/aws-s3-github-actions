provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "sajed-devops-demo-12345"

  tags = {
    Name = "DevOpsBucket"
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "html_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}