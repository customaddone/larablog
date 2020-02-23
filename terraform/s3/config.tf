provider "aws" {
   region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "larablog-code-collection"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
