resource "aws_ecs_cluster" "sample-ecs-cluster" {
  name = "larablog-ecs-cluster"
}

resource "aws_ecs_service" "rails-service" {
  name            = "larablog"
  cluster         = aws_ecs_cluster.sample-ecs-cluster.id
  task_definition = aws_ecs_task_definition.sample-task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = data.terraform_remote_state.alb.outputs.lb_target_group_arn
    container_name   = "example"
    container_port   = "80"
  }
}

data "template_file" "service_container_definition" {
  template = file("./container_definitions.json")
}

resource "aws_ecs_task_definition" "sample-task" {
  family = "larablog"
  container_definitions = data.template_file.service_container_definition.rendered
  task_role_arn = data.terraform_remote_state.iam.outputs.ecs_role_arn
  execution_role_arn       = data.terraform_remote_state.iam.outputs.ecs_role_arn
  network_mode  = "bridge"
}


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "larablog-code-collection"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "larablog-code-collection"
    key    = "sample/alb/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"
  config = {
    bucket = "larablog-code-collection"
    key    = "sample/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
