#!/bin/bash

export S3_BUCKET="heroku-buildpack-php-tyler"

export LIBMCRYPT_VERSION="2.5.8"
export LIFREETYPE_VERSION="2.4.12"
export PHP_VERSION="5.4.45"
export APC_VERSION="3.1.10"
export PHPREDIS_VERSION="2.2.2"
export LIBMEMCACHED_VERSION="1.0.7"
export MEMCACHED_VERSION="2.0.1"
export NEWRELIC_VERSION="4.9.0.54"
export NEW_RELIC_LICENSE_KEY="3059beac230bc653378add929ca186d2b5ddfa5c"
export NGINX_VERSION="1.10.2"

export EC2_PRIVATE_KEY=~/.ec2/pk.pem
export EC2_CERT=~/.ec2/cert.pem
export EC2_URL=https://ec2.us-east-1.amazonaws.com
