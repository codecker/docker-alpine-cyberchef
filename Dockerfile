FROM alpine:3.14

# Update image with latest patches
RUN apk -U upgrade

# Add Prerequisites
RUN apk add curl build-base pcre-dev openssl-dev gzip zlib-dev

# Download and extract tar.gz
RUN curl https://nginx.org/download/nginx-1.21.6.tar.gz -o nginx-1.21.6.tar.gz && tar -zxvf nginx-1.21.6.tar.gz

# Cleanup .tar.gz and change directory
RUN rm nginx-1.21.6.tar.gz && cd nginx-1.21.6

# Setup NGINX configuration
RUN ./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --with-http_ssl_module --with-http_v2_module

# Build NGINX
RUN make && make install



