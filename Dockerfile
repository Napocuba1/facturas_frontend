FROM node:16.13.0-alpine as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build


FROM  nginx:alpine
COPY --from=build /usr/local/app/dist /usr/share/nginx/html

EXPOSE 80