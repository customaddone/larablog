resource "aws_cloudwatch_log_group" "nginx" {
  name = "nginx"
}

resource "aws_cloudwatch_log_group" "php" {
  name = "php"
}
