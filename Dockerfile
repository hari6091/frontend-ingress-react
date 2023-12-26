FROM node:14.14.0-alpine as builder

WORKDIR /app

RUN apk --no-cache add git

COPY package.json .
RUN npm install

FROM nginx
EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
