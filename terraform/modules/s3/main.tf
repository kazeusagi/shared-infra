resource "aws_s3_bucket" "this" {
  bucket        = "kazeusagi-tfstate"
  force_destroy = false
}
