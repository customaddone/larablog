resource "aws_ecr_repository" "example" {
  name = "nginx"
}

resource "aws_ecr_repository" "app" {
  name = "php"
}
