FROM alpine:3.10

# 最新バージョン
ARG terraform_version="0.12.21"

# Terraformインストール用のコマンドを使えるようにwget unzip curlをインストール
# Terraformをインストールして解凍する
# ディレクトリを作成する
RUN apk update --no-cache \
    && apk add --no-cache \
        wget \
        unzip \
        curl \
    && wget https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip \
    && unzip ./terraform_${terraform_version}_linux_amd64.zip -d /usr/local/bin/ \
    && rm -rf ./terraform_${terraform_version}_linux_amd64.zip \
    && mkdir terraform

WORKDIR /terraform

# いちいちterraformコマンドを打つのが面倒な場合
# CMD ["terraform"]
