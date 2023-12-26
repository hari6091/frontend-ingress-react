FROM node:14.14.0-alpine as builder

WORKDIR /app

RUN apk --no-cache add git && \
    git clone https://github.com/hari6091/frontend-ingress-react.git . && \
    npm install && \
    npm run build

FROM nginx

EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html

WORKDIR /app

CMD ["sh", "-c", "git pull && npm install && npm run build && nginx -g 'daemon off;'"]
