FROM node:14.14.0-alpine as builder

WORKDIR /app

RUN apk --no-cache add git

RUN git clone https://github.com/hari6091/frontend-ingress-react.git .

FROM nginx

EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html

CMD ["sh", "-c", "cd /app && git pull && npm install && npm run build && nginx -g 'daemon off;'"]
