# インターネットゲートウェイ
# VPCとインターネット間で通信できる
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

# ルートテーブル
# ルーティング情報を管理する
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
}

# ルート（パブリックサブネット用）
# １ルートにつき１つ作る
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}
# ルート（プライベートサブネット用）
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

# ルートテーブルとサブネットを紐付ける
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
