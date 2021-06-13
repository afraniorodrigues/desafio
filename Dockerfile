FROM ruby:3.0-alpine

# Set work directory
WORKDIR /usr/src/app

# install dependencies
RUN apk add --update --no-cache binutils-gold build-base curl file \
      g++ gcc git less libstdc++ libffi-dev libc-dev linux-headers \
      libxml2-dev libxslt-dev libgcrypt-dev make netcat-openbsd \
      nodejs openssl pkgconfig postgresql-dev sqlite-dev tzdata yarn

# copy files
COPY . /usr/src/app/

# install ruby dependencies
RUN bundle install
