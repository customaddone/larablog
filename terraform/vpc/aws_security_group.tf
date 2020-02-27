resource "aws_security_group" "example" {
  name   = "larablog"
  vpc_id = aws_vpc.example.id
}

#HTTPで通信できるよう80番ポートを許可
module "example_sg" {
  source      = "./aws_security_group_module"
  name        = "module-sg"
  vpc_id      = aws_vpc.example.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}
