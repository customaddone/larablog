# VPCは他のネットワークから論理的に切り離されたネットワークです
# EC2などのリソースを配置します
resource "aws_vpc" "example" {

  #vpcのipv4のアドレス範囲を設定します
  # 10.0.0.0〜10.0.255.255まで使えるよ
  cidr_block           = "10.0.0.0/16"

  # AWSのDNSサーバーによる名前解決を有効にする
  # route53が使えるようになる
  enable_dns_support   = true
  enable_dns_hostnames = true

  # タグをつけてコンソール上でわかりやすく
  tags = {
    Name = "larablog"
  }
}

# サブネット　パブリック
resource "aws_subnet" "public_0" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
}

#　サブネット　プライベート
resource "aws_subnet" "private_0" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.65.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}
resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.66.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false
}

output "example_id" {
  value = aws_vpc.example.id
}

output "public_0_id" {
  value = aws_subnet.public_0.id
}
output "public_1_id" {
  value = aws_subnet.public_1.id
}
output "private_0_id" {
  value = aws_subnet.private_0.id
}
output "private_1_id" {
  value = aws_subnet.private_1.id
}

output "cidr_block" {
  value = aws_vpc.example.cidr_block
}
