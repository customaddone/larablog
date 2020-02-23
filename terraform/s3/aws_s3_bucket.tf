# terraformの各コードの保存用
# 外部公開しないプライベートバケット
resource "aws_s3_bucket" "private" {
  # bucket バケットの名前（必要）
  bucket = "larablog-code-collection"
}
