FROM nginx
RUN apt-get update && apt-get install hugo

COPY . /usr/src
WORKDIR /usr/src
RUN hugo

RUN cp -r ./public/* /usr/share/nginx/html

COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
