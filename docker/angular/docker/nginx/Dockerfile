FROM node:14.16.0-alpine3.12 as build-stage
WORKDIR /app
COPY ./web/app/package*.json /app/
RUN npm install
COPY ./web/app/ /app/
ARG configuration=production
RUN npm run build -- --output-path=./dist/out --configuration $configuration

FROM nginx:1.17.3-alpine
COPY --from=build-stage /app/dist/out/ /var/www/html
COPY ./docker/nginx/nginx.conf /etc/nginx/
