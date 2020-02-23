resource "aws_lb" "example" {
  name                       = "example"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60

  subnets = [
    data.terraform_remote_state.vpc.outputs.public_id,
  ]

  access_logs {
    bucket  = data.terraform_remote_state.s3.outputs.artifact_id
    enabled = true
  }

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id
  ]
}
