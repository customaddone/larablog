resource "aws_s3_bucket" "artifact" {
  bucket = "alb-log"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

output "alb_log_id" {
  value = "${aws_s3_bucket.artifact.id}"
}
