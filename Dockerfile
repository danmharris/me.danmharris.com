FROM ubuntu
RUN apt-get update && apt-get install hugo
COPY . /usr/src
WORKDIR /usr/src
RUN hugo

FROM nginx
COPY --from=0 /usr/src/public/ /usr/share/nginx/html
COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
