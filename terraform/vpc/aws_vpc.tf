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
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
}

#　サブネット　プライベート
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.64.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}

output "example_id" {
  value = aws_vpc.example.id
}

output "public_id" {
  value = aws_subnet.public.id
}

output "private_id" {
  value = aws_subnet.private.id
}


output "cidr_block" {
  value = aws_vpc.example.cidr_block
}
