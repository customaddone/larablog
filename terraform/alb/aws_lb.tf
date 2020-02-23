resource "aws_lb" "example" {
  name                       = "larablog"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60

  subnets = [
    data.terraform_remote_state.vpc.outputs.public_0_id,
    data.terraform_remote_state.vpc.outputs.public_1_id,
  ]

  access_logs {
    bucket  = data.terraform_remote_state.s3.outputs.alb_log_id
    enabled = true
  }

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id
  ]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "larablog-code-collection"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "larablog-code-collection"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
