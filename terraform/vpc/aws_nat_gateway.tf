# NATでプライベートネットワーク「から」インターネットに接続
resource "aws_eip" "nat_gateway" {
  vpc        = true
  depends_on = [aws_internet_gateway.example]
}

# プライベートVPCからインターネットにアクセスできる
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.example]

  tags = {
    Name = "larablog"
  }
}
