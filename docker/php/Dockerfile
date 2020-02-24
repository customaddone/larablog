# 基本となるイメージを引っ張ってくる
FROM php:7.3-fpm-alpine

# docker内の作業用ディレクトリを設定
ENV WORKDIR=/var/www/html
WORKDIR $WORKDIR

# php.ini（phpの設定）をdocker内にコピーする
COPY ./docker/php/php.ini /usr/local/etc/php

# composerでインストールする内容一覧をdocker内にコピーする
COPY composer.json composer.lock ${WORKDIR}/

# laravelのファイル一式をdocker内にコピーする
COPY . .

# apk alpineのパッケージマネジャー
# とりあえずgitとnpmとvimが使えればいいかな
# git openssh,openssh-keygen,vim,gitが必要
# npm nodejs, nodejs-npmが必要
# bash,curlコマンドも要
RUN set -x \
    && apk update && \
    apk add --update --no-cache --virtual=.build-dependencies \
      autoconf \
      gcc \
      g++ \
      make && \
    apk add --update --no-cache \
      curl-dev \
      icu-dev \
      libzip-dev \
      openssl \
      openssh \
      openssh-keygen \
      nodejs \
      nodejs-npm \
      bash \
      vim \
      git
RUN docker-php-ext-install \
      pdo_mysql \
      zip
# composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN set -x \
    && composer update --no-dev\
    && composer install --no-autoloader --no-progress --no-dev

# 適当にユーザーを作っとく
ARG UID=991
ARG UNAME=www
ARG GID=991
ARG GNAME=www

# php artisan config:clear キャッシュクリアー
# ３行目以下　ユーザーに権限付与
RUN set -x \
    && composer install --no-progress --no-dev \
    && php artisan config:clear \
    && addgroup ${GNAME} -g ${GID} \
    && adduser -D -G ${GNAME} -u ${UID} ${UNAME} \
    && chown -R ${UNAME}:${GNAME} ${WORKDIR} \
    && mv /root/.composer /home/${UNAME}/ \
    && chown -R ${UNAME}:${GNAME} /home/${UNAME}

# nginxからのアクセスの窓口
EXPOSE 9000
